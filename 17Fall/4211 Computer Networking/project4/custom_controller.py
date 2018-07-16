from pox.core import core
import pox.openflow.libopenflow_01 as of
from pox.lib.util import dpid_to_str, str_to_dpid
from pox.lib.packet.ethernet import ethernet
from pox.lib.packet.arp import arp
from pox.lib.addresses import IPAddr, EthAddr

# Even a simple usage of the logger is much nicer than print!
log = core.getLogger()

IP_to_MAC = {}

#Part 1: Called when a packet has been sent to the controller from a switch
#Receive ARP Request packets, and send ARP Response Packets with correct MAC
#found in the IP_to_MAC table that we have built
#Using some example Code from POX Wiki's section on building ARP messages
def _handle_PacketIn (event):
    packet = event.parsed
    in_port = event.port
    #check if packet is arp packet
    if packet.type == ethernet.ARP_TYPE:
        #check if arp packet is an arp request
        if packet.payload.opcode == arp.REQUEST:
            log.info("Received ARP request: "+str(packet.payload.protodst))
            if str(packet.payload.protodst) in IP_to_MAC:
                #Build the arp response
                arp_reply = arp()
                arp_reply.hwsrc = IP_to_MAC[str(packet.payload.protodst)]
                #log.info("Reply Source: "+IP_to_MAC[str(packet.payload.protodst)])
                arp_reply.hwdst = packet.src
                #log.info("Reply Dest: "+str(packet.src))
                arp_reply.opcode = arp.REPLY
                arp_reply.protosrc = packet.payload.protodst
                #log.info("protosrc: "+str(packet.payload.protodst))
                arp_reply.protodst = packet.payload.protosrc
                #log.info("protodst: "+str(packet.payload.protosrc))
                #Build the packet
                ether = ethernet()
                ether.type = ethernet.ARP_TYPE
                ether.dst = packet.src
                ether.src = IP_to_MAC[str(packet.payload.protodst)]
                ether.payload = arp_reply
                #Build the message
                msg = of.ofp_packet_out()
                msg.data = ether.pack()
                #Send the message back to the switch
                msg.actions.append(of.ofp_action_output(port = of.OFPP_IN_PORT))
                msg.in_port = in_port
                event.connection.send(msg)
                log.info("Sent ARP Reply: "+str(IP_to_MAC[str(packet.payload.protodst)]))
                

#Part 1: Called on launch of controller
#Since we know exactly how the topology is built, we know what all of the
#IP's and MAC's of our hosts will be. So we will add all of these associations
#to our IP_to_MAC table.
def map_IP_to_MAC():
    #Add IP-MAC Associations for all hosts to the IP_to_MAC table
    IP_to_MAC["10.0.0.1"] = EthAddr("00:00:00:00:00:01")
    IP_to_MAC["10.0.0.2"] = EthAddr("00:00:00:00:00:02")
    IP_to_MAC["10.0.0.3"] = EthAddr("00:00:00:00:00:03")
    IP_to_MAC["10.0.0.4"] = EthAddr("00:00:00:00:00:04")
    IP_to_MAC["10.0.0.5"] = EthAddr("00:00:00:00:00:05")
    IP_to_MAC["10.0.0.6"] = EthAddr("00:00:00:00:00:06")

    
#Part 1: Called when a connection on a switch goes up
#Install rules  in all switches that all ARP packets go to controller
#We will then install open flow rules in every switch as they come up,
#telling them to forward all ARP packets to the controller.
#Part 2
#Install our starting rules in the switches as defined in the description
#of the leaf-spine topology in Prog4_Description
#Hosts on the same leaf route through the leaf to the other host
#H1, H3, H5 route through S4. H2, H4, H6 route through S5   
def _handle_ConnectionUp(event):
    log.info("Installing ARP flow mod in dpid:" + dpid_to_str(event.dpid))
    msg =  of.ofp_flow_mod()
    msg.priority = 0x7000
    msg.match.dl_type = ethernet.ARP_TYPE
    msg.actions.append(of.ofp_action_output(port=of.OFPP_CONTROLLER))
    event.connection.send(msg)
    _dpid =dpid_to_str(event.dpid)
    _dpid = _dpid[16]

    #Time to install flow rules in the connection
    msg = of.ofp_flow_mod()
    msg.priority = 0x0007
    msg.match.dl_type = 0x0800
    log.info("Installing Flow mod in dpid: "+dpid_to_str(event.dpid))
    if _dpid == "1":
        #H1 to H2
        msg.match.nw_dst = "10.0.0.2"
        msg.match.nw_src = "10.0.0.1"
        msg.actions.append(of.ofp_action_output(port = 4))
        event.connection.send(msg)
        #H2 to H1
        msg.match.nw_dst = "10.0.0.1"
        msg.match.nw_src = "10.0.0.2"
        msg.actions.append(of.ofp_action_output(port = 3))
        event.connection.send(msg)
        #L1 to H1
        msg.match.nw_dst = "10.0.0.1"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 3))
        event.connection.send(msg)
        #L1 to H2
        msg.match.nw_dst = "10.0.0.2"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 4))
        event.connection.send(msg)
        #L1 to S4
        msg.match.nw_src = "10.0.0.1"
        msg.match.nw_dst = None
        msg.actions.append(of.ofp_action_output(port = 1))
        event.connection.send(msg)
        #L1 to S5
        msg.match.nw_src = "10.0.0.2"
        msg.match.nw_dst = None
        msg.actions.append(of.ofp_action_output(port = 2))
        event.connection.send(msg)
        
    elif _dpid == "2":
        #H3 to H4
        msg.match.nw_dst = "10.0.0.4"
        msg.match.nw_src = "10.0.0.3"
        msg.actions.append(of.ofp_action_output(port = 4))
        event.connection.send(msg)
        #H4 to H3
        msg.match.nw_dst = "10.0.0.3"
        msg.match.nw_src = "10.0.0.4"
        msg.actions.append(of.ofp_action_output(port = 3))
        event.connection.send(msg)
        #L2 to H3
        msg.match.nw_dst = "10.0.0.3"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 3))
        event.connection.send(msg)
        #L2 to H4
        msg.match.nw_dst = "10.0.0.4"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 4))
        event.connection.send(msg)
        #L2 to S4
        msg.match.nw_src = "10.0.0.3"
        msg.match.nw_dst = None
        msg.actions.append(of.ofp_action_output(port = 1))
        event.connection.send(msg)
        #L2 to S5
        msg.match.nw_src = "10.0.0.4"
        msg.match.nw_dst = None
        msg.actions.append(of.ofp_action_output(port = 2))
        event.connection.send(msg)
        
    elif _dpid == "3":
        #H5 to H6
        msg.match.nw_dst = "10.0.0.6"
        msg.match.nw_src = "10.0.0.5"
        msg.actions.append(of.ofp_action_output(port = 4))
        event.connection.send(msg)
        #H6 to H5
        msg.match.nw_dst = "10.0.0.5"
        msg.match.nw_src = "10.0.0.6"
        msg.actions.append(of.ofp_action_output(port = 3))
        event.connection.send(msg)
        #L3 to H5
        msg.match.nw_dst = "10.0.0.5"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 3))
        event.connection.send(msg)
        #L3 to H6
        msg.match.nw_dst = "10.0.0.6"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 4))
        event.connection.send(msg)
        #L3 to S4
        msg.match.nw_src = "10.0.0.5"
        msg.match.nw_dst = None
        msg.actions.append(of.ofp_action_output(port = 1))
        event.connection.send(msg)
        #L3 to S5
        msg.match.nw_src = "10.0.0.6"
        msg.match.nw_dst = None
        msg.actions.append(of.ofp_action_output(port = 2))
        event.connection.send(msg)
        
    elif _dpid == "4":
        #S4 to L1
        msg.match.nw_dst = "10.0.0.1"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 1))
        event.connection.send(msg)
        msg.match.nw_dst = "10.0.0.2"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 1))
        event.connection.send(msg)
        #S4 to L2
        msg.match.nw_dst = "10.0.0.3"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 2))
        event.connection.send(msg)
        msg.match.nw_dst = "10.0.0.4"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 2))
        event.connection.send(msg)
        #S4 to L3
        msg.match.nw_dst = "10.0.0.5"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 3))
        event.connection.send(msg)
        msg.match.nw_dst = "10.0.0.6"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 3))
        event.connection.send(msg)
        
    elif _dpid == "5":
        #S5 to L1
        msg.match.nw_dst = "10.0.0.1"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 1))
        event.connection.send(msg)
        msg.match.nw_dst = "10.0.0.2"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 1))
        event.connection.send(msg)     
        #S5 to L2
        msg.match.nw_dst = "10.0.0.3"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 2))
        event.connection.send(msg)
        msg.match.nw_dst = "10.0.0.4"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 2))
        event.connection.send(msg)
        #S5 to L3
        msg.match.nw_dst = "10.0.0.5"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 3))
        event.connection.send(msg)
        msg.match.nw_dst = "10.0.0.6"
        msg.match.nw_src = None
        msg.actions.append(of.ofp_action_output(port = 3))
        event.connection.send(msg)
    else:
        log.info("Finished install_rules without installing any flow mods")
        return


#Part 3: Called when a link goes down between two switches
#When a link goes down, install a new rule at the switch affected to just use
#the other spine switch
def _handle_PortStatus(event):
    log.info("Port status event: "+str(event.ofp.reason))
    if event.ofp.reason == of.OFPPR_MODIFY:
        _dpid = event.dpid
        _dpid_short =dpid_to_str(_dpid)
        _dpid_short = _dpid_short[16]
        _port = event.port
        log.info("Link failure in switch: "+str(_dpid_short)+" on port: "+str(_port))

        msg = of.ofp_flow_mod()
        msg.priority = 0x0007
        msg.match.dl_type = 0x0800
        
        #Link is down in S4
        if _dpid_short == "4":
            #Link between S4 and L1 is down
            if _port == 1:
                #Tell L1 to send things from H1 to S5 instead
                msg.match.nw_src = "10.0.0.1"
                msg.match.nw_dst = None
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-01"), msg)
                #Tell L2 to send things to H1 and H2 via S5 instead
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.1"
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-02"), msg)
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.2"
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-02"), msg)
                #Tell L3 to send things to H1 and H2 via S5 instead
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.1"
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-03"), msg)
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.2"
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-03"), msg)

                
            #Link between S4 and L2 is down
            elif _port == 2:
                #Tell L2 to send things from H3 to S5 instead
                msg.match.nw_src = "10.0.0.3"
                msg.match.nw_dst = None
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-02"), msg)
                #Tell L1 to send things to H3 and H4 via S5 instead
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.3"
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-01"), msg)
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.4"
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-01"), msg)
                #Tell L3 to send things to H3 and H4 via S5 instead
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.3"
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-03"), msg)
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.4"
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-03"), msg)
                
            #Link between S4 and L3 is down
            elif _port == 3:
                #Tell L3 to send things from H5 to S5 instead
                msg.match.nw_src = "10.0.0.5"
                msg.match.nw_dst = None
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-03"), msg)
                #Tell L2 to send things to H5 and H6 via S5 instead
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.5"
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-02"), msg)
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.6"
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-02"), msg)
                #Tell L1 to send things to H5 and H6 via S5 instead
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.5"
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-01"), msg)
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.6"
                msg.actions.append(of.ofp_action_output(port = 2))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-01"), msg)
            else:
                log.info("Failed port non-useful: "+str(_port))
                
        #Link is down in S5
        elif _dpid_short == "5":
            #Link between S5 and L1 is down
            if _port == 1:
                #Tell L1 to send things from H2 to S4 instead
                msg.match.nw_src = "10.0.0.2"
                msg.match.nw_dst = None
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-01"), msg)
                #Tell L2 to send things to H1 and H2 via S4 instead
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.1"
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-02"), msg)
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.2"
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-02"), msg)
                #Tell L3 to send things to H1 and H2 via S4 instead
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.1"
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-03"), msg)
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.2"
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-03"), msg)
                
            #Link between S4 and L2 is down
            elif _port == 2:
                #Tell L2 to send things from H3 to S4 instead
                msg.match.nw_src = "10.0.0.4"
                msg.match.nw_dst = None
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-02"), msg)
                #Tell L1 to send things to H3 and H4 via S4 instead
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.3"
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-01"), msg)
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.4"
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-01"), msg)
                #Tell L3 to send things to H3 and H4 via S4 instead
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.3"
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-03"), msg)
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.4"
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-03"), msg)
                
            #Link between S4 and L3 is down
            elif _port == 3:
                #Tell L3 to send things from H5 to S4 instead
                msg.match.nw_src = "10.0.0.6"
                msg.match.nw_dst = None
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-03"), msg)
                #Tell L2 to send things to H5 and H6 via S4 instead
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.5"
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-02"), msg)
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.6"
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-02"), msg)
                #Tell L1 to send things to H5 and H6 via S4 instead
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.5"
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-01"), msg)
                msg.match.nw_src = None
                msg.match.nw_dst = "10.0.0.6"
                msg.actions.append(of.ofp_action_output(port = 1))
                core.openflow.sendToDPID(str_to_dpid("00-00-00-00-00-01"), msg)
            else:
                log.info("Failed port non-useful: "+str(_port))
        else:
            log.info("Link failure in non-spine switch: "+str(_dpid_short))


   
def launch ():
  core.openflow.addListenerByName("PacketIn", _handle_PacketIn)
  core.openflow.addListenerByName("ConnectionUp", _handle_ConnectionUp)
  core.openflow.addListenerByName("PortStatus", _handle_PortStatus)
  map_IP_to_MAC()
  #install_rules()
  log.info("Project 4 Controller Running.")
