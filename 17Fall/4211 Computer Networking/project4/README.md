Code Implementation and Design Details
Upon launch of the controller, hardcoded IPs are matched to MAC addresses in a
python dictionary, since we know these values beforehand. Then we set our
controller to listen to events to set up the rest of the required functionality.

When all of the connections come up when Mininet is launched using our controller,
we install flow rules to tell all of the switches to send all ARP packets to the
controller. We also install flow rules to set up the required functionality of
our spine-leaf topology. We tell L1, L2, and L3 to route packets from H1, H3, and
H5 through S4. We tell them to route packets from H2, H4, and H6 through S5. We
also tell them that if the destination host is on the same leaf as the source host
we can just route it through the leaf without going through a host.

When an ARP request packet is sent to the controller, we fetched the request MAC
address from the table we built in the beginning, and send a response packet with
that MAC back.

When a link goes down between a leaf and a spine, we tell the link affect to route
packets that would normally go through the spine to go through the other spine instead.
We also tell the other two leaf switches that any packets that would normally go through
that spine to get to the leaf to instead send them to the other spine instead. In this way,
when all the links on a spine go down, all traffic can go through the other spine
without any difficulty.

--------------------------------------------------------------------------------
Lab 4
--------------------------------------------------------------------------------
Running the Project
custom_controller.py should be in ~/pox/pox/forwarding
topology.py should be in ~/pox/pox/topology
In one terminal:
  run: `~/pox/pox.py forwarding.custom_controller`
In another terminal: run:
  ```
  mininet@mininet$: sudo mn --controller=remote --custom topology.py --topo mytopo --mac
  mininet> pingall
  ```
 --------------------------------------------------------------------------------
 Part 1:
  In mininet you want to want run
  ```
  mininet> <host> arp -n
  ```
  (EG, h1 arp -n)

 Part 2:
  We can check that the rules are in effect by making sure the hosts are reachable
  by using the command
  ```
  mininet> pingall
  ```

 Part 3:
  For this part we want to see if the program can detect link failures and watch it
  mitigate the errors by bypassing the link so that everything else remains connected
  You can demonstrate this by:
  ```
  mininet> link <spine> <leaf> down
  mininet> pingall
  ```


--------------------------------------------------------------------------------
Contributions:
Hoang Nguyen - All of Part 2

Kieran Kelly - All of Part 3

Wyatt Kormick - All of Part 1
