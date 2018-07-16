from pox.core import core
import pox.openflow.libopenflow_01 as of



# Even a simple usage of the logger is much nicer than print!
log = core.getLogger()


#use this table to add the needed entries
table = {}


# Handle messages the switch has sent us because it has no
# matching rule.

def _handle_PacketIn (event):
	log.info("packet received")
	packet = event.parsed
  # check if the entry is in the table or not

	table[packet.src] = event.port

	if packet.dst not in table:
		log.info("packet.dst not in table")
		# if it's not in the table, add an entry to the table
		# We don't know where the destination is yet.  So, we'll just
		# send the packet out all ports (except the one it came in on!)
		# and hope the destination is out there somewhere. :)
		# To send out all ports, we can use either of the special ports
		# OFPP_FLOOD or OFPP_ALL.

		msg = of.ofp_flow_mod()
		msg.actions.append(of.ofp_action_output(port = of.OFPP_ALL))
		event.connection.send(msg)
		log.info("command sent to switch: flood on all ports except in port")
		# """
		# msg = of.ofp_packet_out()
		# msg.actions.append(of.ofp_action_output(port = of.OFPP_FLOOD))
		# msg.data = event.ofp
		# msg.in_port = event.port
		# event.connection.send(msg)
		# """
	elif table[packet.dst] == event.port:
		log.info("Destination Mac in table. Destination port equals src port")
		return
	else:
		log.info("Destination MAC is in table")
	# if the appropriate entry is in the table, just forward the packet to that port
		msg = of.ofp_flow_mod()
		msg.match.dst_mac = packet.dst
		msg.actions.append(of.ofp_action_output(port = table[packet.dst]))
		event.connection.send(msg)
		log.info("command sent to switch: send packet out Destination port")
		# """
		# msg = of.ofp_flow_mod()
		# msg.match = of.ofp_match.from_packet(packet, event.port)
		# msg.actions.append(of.ofp_action_output(port = event.port))
		# msg.data = event.ofp
		# event.connection.send(msg)
		# """
def launch ():
	core.openflow.addListenerByName("PacketIn", _handle_PacketIn)
	log.info("Pair-Learning switch running.")
