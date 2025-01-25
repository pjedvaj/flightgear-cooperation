###############################################################################
## $Id$
##
## Nasal for MP-passenger on the MD500E over the multiplayer network.
##
##  Copyright (C) 2009  Anders Gidenstam  (anders(at)gidenstam.org)
##  This file is licensed under the GPL license version 2 or later.
##
###############################################################################
# Loading text
print("Loading Westland Gazelle Dual Control script");
# Renaming (almost :)
var DCT = dual_control_tools;

######################################################################
# Pilot/copilot aircraft identifiers. Used by dual_control.
var pilot_type   = "Aircraft/Westland_SeaKing/Models/Westland_SeaKing-HAR3.xml";
var copilot_type = "Aircraft/Westland_SeaKing/Models/SeaKing-Crew.xml";

props.globals.initNode("/sim/remote/pilot-callsign", "", "STRING");

######################################################################
# MP enabled properties.
# NOTE: These must exist very early during startup - put them
#       in the -set.xml file.

var copilot_rudder_mpp     = "surface-positions/rudder-pos-norm";
var copilot_elevator_mpp   = "surface-positions/elevator-pos-norm";
var copilot_aileron_mpp    = "surface-positions/left-aileron-pos-norm";
var copilot_throttle1_mpp  = "sim/multiplay/generic/float[10]";
######################################################################
# Useful local property paths.
var l_rudder_cmd     = "controls/flight/fcs/yaw";
var l_aileron_cmd    = "controls/flight/fcs/roll";
var l_elevator_cmd   = "controls/flight/fcs/pitch";
var l_throttle1_cmd  = "controls/engines/engine[0]/throttle";
var l_throttle2_cmd  = "controls/engines/engine[1]/throttle";
# Engines
var l_pilot_throttle1_cmd = "controls/engines/engine[0]/throttle";
######################################################################
# Slow state properties for replication.


###############################################################################
# Pilot MP property mappings and specific copilot connect/disconnect actions.


######################################################################
# Used by dual_control to set up the mappings for the pilot.
var pilot_connect_copilot = func (copilot) {
    return 
        [
         ######################################################################
         # Process received properties.
         ######################################################################
		  # Co-Pilot controls
		 DCT.Translator.new
         (copilot.getNode(copilot_elevator_mpp),
        props.globals.getNode("/controls/copilot/elevator")),
		 DCT.Translator.new
         (copilot.getNode(copilot_aileron_mpp),
          props.globals.getNode("/controls/copilot/aileron")),
         DCT.Translator.new
         (copilot.getNode(copilot_rudder_mpp),
          props.globals.getNode("/controls/copilot/rudder")),
		 DCT.Translator.new
         (copilot.getNode(copilot_throttle1_mpp),
          props.globals.getNode("/controls/copilot/throttle[0]")),
         ######################################################################
         # Process properties to send.
         ######################################################################
        ];
}

######################################################################
var pilot_disconnect_copilot = func {
}


###############################################################################
# Copilot MP property mappings and specific pilot connect/disconnect actions.


######################################################################
# Used by dual_control to set up the mappings for the copilot.
var copilot_connect_pilot = func (pilot) {
    # Initialize Nasal wrappers for copilot pick anaimations.
    set_copilot_wrappers(pilot);

    return
        [
         ######################################################################
         # Process received properties.
         ######################################################################
		 # DCT.Translator.new
         #(pilot.getNode(pilot_inhg_mpp),
         # props.globals.getNode("/instrumentation/altimeter/setting-inhg")),
		 #  DCT.Translator.new
         #(pilot.getNode(pilot_inst_lights_mpp),
         # props.globals.getNode("/controls/rotary/pilot-instrument-lights")),
         ######################################################################
         # Process properties to send.
         ######################################################################
		  DCT.Translator.new
         (props.globals.getNode(l_elevator_cmd),
          props.globals.getNode(copilot_elevator_mpp)),
		 DCT.Translator.new
         (props.globals.getNode(l_aileron_cmd),
          props.globals.getNode(copilot_aileron_mpp), 1),
         DCT.Translator.new
         (props.globals.getNode(l_rudder_cmd),
          props.globals.getNode(copilot_rudder_mpp)),
		 DCT.Translator.new
         (props.globals.getNode(l_throttle1_cmd),
          props.globals.getNode(copilot_throttle1_mpp)),
        ];
}

######################################################################
var copilot_disconnect_pilot = func {
    # Reset local sound properties.
    p = "engines/engine/rpm";
    props.globals.getNode(p).unalias();
    props.globals.getNode(p).setValue(0);
    p = "gear/gear[0]/compression-norm";
    props.globals.getNode(p).unalias();
    props.globals.getNode(p).setValue(0);
    p = "gear/gear[1]/compression-norm";
    props.globals.getNode(p).unalias();
    props.globals.getNode(p).setValue(0);
}

######################################################################
# Copilot Nasal wrappers

var set_copilot_wrappers = func (pilot) {
    # Setup aliases to animate the MP 3d model.

    # Setup aliases to drive local sound.
    p = "engines/engine/rpm";
    props.globals.getNode(p).alias(pilot.getNode(p));
	p = "engines/engine[1]/rpm";
}