# $Id$
#
# Nasal script to print errors to the screen when aircraft exceed design limits:
#  - extending flaps above maximum flap extension speed(s)
#  - extending gear above maximum gear extension speed
#  - exceeding Vna
#  - exceeding structural G limits
#
# To use, include this .nas file and define one or more of
# limits/max-flap-extension-speed/speed
# limits/max-flap-extension-speed/flaps
# limits/vne
# limits/max-gear-extension-speed
# limits/max-positive-g
# limits/max-negative-g (must be defined in max-positive-g defined)
#
# You can define multiple max-flap-extension-speed entries for max extension
# speeds for different flap settings.

#Define variables
var msg 		= "";
var ltext 		= "";
var flapsetting 	= nil;
var airspeed 		= nil;
var limits 		= nil;
var children 		= nil;
var flaps 		= nil;
var speed 		= nil;
var max_gear 		= nil;
var g 			= nil;
var max_positive 	= nil;
var max_negative 	= nil;
var vne      		= nil;

var checkFlaps = func(n) {
  flapsetting = n.getValue();
  if (flapsetting == 0){
    return;
}
	ltext = "";
 airspeed = getprop("velocities/airspeed-kt");
	limits = props.globals.getNode("limits");

  if ((limits != nil) and (limits.getChildren("max-flap-extension-speed") != nil))
  {
    children = limits.getChildren("max-flap-extension-speed");
    foreach(var c; children)
    {
      if ((c.getChild("flaps") != nil) and
          (c.getChild("speed") != nil)     )
      {
        flaps = c.getChild("flaps").getValue();
        speed = c.getChild("speed").getValue();

        if ((flaps != nil)        and
            (speed != nil)        and
            (flapsetting > flaps) and
            (airspeed > speed)       )
        {
          ltext = "Flaps extended above maximum flap extension speed!";
        }
      }
    }

    if (ltext != "")
    {
      screen.log.write(ltext);
	if(getprop("/sim/model/flaps-breakable") == 1){
		setprop("/sim/model/flaps-broken", 1);
		setprop("/controls/flight/flaps", 0.0);
		setprop("/sim/failure-manager/controls/flight/flaps/serviceable", 0);
	}
    }
  }
}


var checkGear = func(n) {
  if (!n.getValue())
    return;
 airspeed = getprop("velocities/airspeed-kt");
  max_gear = getprop("limits/max-gear-extension-speed");

  if ((max_gear != nil) and (airspeed > max_gear))
  {
    screen.log.write("Gear extended above maximum extension speed!");
  }
}


# Set the listeners
setlistener("controls/flight/flaps", checkFlaps);
setlistener("controls/gear/gear-down", checkGear);

var checkGandVNE = func(){
	if (getprop("/sim/freeze/replay-state")){
    		return;
	}
  g = getprop("/accelerations/pilot-g") or 4.0;
  max_positive = getprop("/limits/max-positive-g");
 max_negative = getprop("/limits/max-negative-g");
 msg = "";

 if (max_positive != nil and g > max_positive){
    msg = "Airframe structural positive-g load limit exceeded!";
  }

  if (max_negative != nil and g < max_negative){
    msg = "Airframe structural negative-g load limit exceeded!";
  }

  # Now check VNE
  airspeed = getprop("/velocities/airspeed-kt");
  vne      = getprop("/limits/vne");

 if (airspeed != nil and vne != nil and airspeed > vne){
    msg = "Airspeed exceeds Vne!";
  }

  if (msg != ""){
    # If we have a message, display it, but don't bother checking for
    # any other errors for 10 seconds. Otherwise we're likely to get
    # repeated messages.
    screen.log.write(msg);
	if(getprop("/sim/model/aircraft-breakable") == 1 and getprop("/sim/model/aircraft-broken") == 0){
		detonate();
		setprop("/engines/engine[0]/serviceable", 0);
		setprop("/controls/switches/landing-light", 0);
		setprop("/instrumentation/hud/on", 0);
		setprop("/instrumentation/radar/on", 0);
		setprop("/instrumentation/hdd/on", 0);
		setprop("/controls/switches/alternator", 0);
		setprop("/controls/lighting/beacon", 0);
		setprop("/controls/switches/battery", 0);
		setprop("/instrumentation/attitude-indicator/serviceable", 0);
		setprop("/sim/failure-manager/controls/flight/aileron/serviceable", 0);
		setprop("/sim/failure-manager/controls/flight/elevator/serviceable", 0);
		setprop("/sim/failure-manager/controls/flight/rudder/serviceable", 0);
		setprop("/sim/model/aircraft-broken", 1);
	}
   		 settimer(checkGandVNE, 10);
  	}else{
    		settimer(checkGandVNE, 1);
	}
}

var reinit = func(){
	setprop("sim/multiplay/generic/int[7]", 0);
	setprop("sim/multiplay/generic/int[8]", 0);
	setprop("/sim/failure-manager/controls/flight/aileron/serviceable", 1);
	setprop("/sim/failure-manager/controls/flight/elevator/serviceable", 1);
	setprop("/sim/failure-manager/controls/flight/rudder/serviceable", 1);
}

var init = func(){
	setprop("sim/multiplay/generic/int[7]", 0);
	setprop("sim/multiplay/generic/int[8]", 0);
	checkGandVNE();
	setlistener("sim/crashed", listener_explode);
};

var listener_explode = func(){
	if(getprop("sim/multiplay/generic/int[8]") < 1 and getprop("sim/crashed")){
		print("doing crash");
		setprop("sim/sound/explode", 0);
		setprop("sim/multiplay/generic/int[7]", 1);
		setprop("sim/multiplay/generic/int[8]", 1);
		setprop("sim/sound/explode", 1);
		settimer(func(){
				setprop("sim/multiplay/generic/int[7]", 0);
		}, 0.3);
	}
};

var detonate = func {
	if (getprop("sim/multiplay/generic/int[8]") < 1){
		setprop("sim/sound/explode", 0);
		setprop("sim/multiplay/generic/int[7]", 1);
		setprop("sim/multiplay/generic/int[8]", 2);
		setprop("sim/sound/explode", 1);
		settimer( func {
				setprop("sim/multiplay/generic/int[7]", 0);
			} , 0.3);
		settimer( func {
				setprop("sim/multiplay/generic/int[8]", 3);
			} , 20);
	}
}
