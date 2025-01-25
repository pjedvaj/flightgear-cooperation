var beacon 		= aircraft.light.new("/sim/model/lights/beacon", [0.05, 1], "/controls/lighting/beacon");
var canopy 		= aircraft.door.new("/canopy", 5);
var started 	= "false";
var ap_enabled	= nil;
var cnpy_pos	= nil;
	
var init = func(){
	var g1 = aircraft.tyresmoke.new(0, 1, 0.8);
	var g2 = aircraft.tyresmoke.new(1, 1, 0.8);
	var g3 = aircraft.tyresmoke.new(2, 1, 0.8);
	var g4 = aircraft.tyresmoke.new(3, 1, 0.8);
	aircraft.livery.init("Aircraft/harrier/Models/Liveries");
	print("Liveries initialized");
	setprop("/controls/lighting/beacon", 0);
	print("Lighting initialized");
	test_support();
}

var update = func(){
	setprop("systems/refuel/serviceable", 0);
    if(getprop("sim/weight[7]/selected") != "none"){
        setprop("systems/refuel/serviceable", 1);
	}
}	

var autostart = func(){
	if(started == "false"){
		turn_on();
	}elsif(started == "true"){
		turn_off();
	}
}

#var toggle_ap = func(){
#	ap_enabled = getprop("/autopilot/enabled");
#	if(ap_enabled == 0){
	#	enable_ap();
#	}elsif(ap_enabled == 1){
	#	setprop("/autopilot/enabled", 0);
	#}
#}

#var enable_ap = func(){
#	setprop("/controls/flight/aileron", 0.0);
#	setprop("/controls/flight/elevator", 0.0);
#	setprop("/autopilot/enabled", 1);
#}


#### Options:

var switch_path = "/controls/switches/windscreen-wiper"; # Required switch property
var anim_path = "/sim/multiplay/generic/float[10]"; # Required animation property
# ^ Recommend you use a generic multiplayer float node e.g. "/sim/multiplay/generic/float[10]"
var wiper_speed = 0.8; # How many seconds it takes to make one single sweep

####

var wiper_switch = props.globals.getNode(switch_path,1); 
wiper_switch.setBoolValue(0); 
var wiper_prop = props.globals.getNode(anim_path,1); 
wiper_prop.setValue(0);

var wiper_loop = func {
     if (!wiper_switch.getBoolValue()) { return; }
     interpolate(wiper_prop,1,wiper_speed);
     settimer(func {interpolate(wiper_prop,0,wiper_speed);},(wiper_speed + 0.1) );
     settimer(wiper_loop,(wiper_speed * 2 + 0.1));
    }
	
setlistener("/controls/switches/windscreen-wiper",wiper_loop);


var switch_canopy = func(v){
	cnpy_pos = getprop("/canopy/position-norm");
	if(v == 2){
		if(cnpy_pos < 1){
			v = 1;
		}elsif(cnpy_pos >= 1){
			v = -1;
		}
	}
	if(v < 0){
		canopy.close();
	}elsif(v > 0){
		canopy.open();
	}
}

var turn_off = func(){
	gui.popupTip("Shutting down", 7);
	engines.Pegasus_mk106.turn_off();
	setprop("/sim/shutdown", 1);		
	setprop("/controls/switches/landing-light", 0);
	setprop("/instrumentation/hud/on", 0);
	setprop("/instrumentation/radar/on", 0);
	setprop("/instrumentation/hdd/on", 0);
	setprop("/controls/switches/alternator", 0);
	setprop("/controls/lighting/beacon", 0);
	setprop("/controls/switches/battery", 0);
	setprop("/instrumentation/attitude-indicator/serviceable", 0);
	started = "false";
}

var turn_on = func(){
	gui.popupTip("Starting up", 7);
	engines.Pegasus_mk106.turn_on();
	setprop("/sim/shutdown", 0);	
	setprop("/controls/switches/battery", 1);
	setprop("/controls/lighting/beacon", 1);
	setprop("/controls/switches/alternator", 1);
	setprop("/instrumentation/hdd/on", 1);
	setprop("/instrumentation/radar/on", 1);
	setprop("/instrumentation/hud/on", 1);
	setprop("/controls/switches/landing-light", 1);
	setprop("/controls/switches/battery", 0);
	setprop("/instrumentation/attitude-indicator/serviceable", 1);
	started = "true";
}

var test_support = func(){
	var version = split(".", getprop("sim/version/flightgear"));
	var major = num(version[0]);
	var minor = num(version[1]);
	var detail = num(version[2]);
	
	if(major <= 1){
		print("Disabled features:\n\tCanvas (FG 2.8.0 upwards)\n\tCanvas MapStructure (FG 3.0.0 upwards)\n\tCanvas-based GUI (FG 3.2.0 upwards\n\tNew custom failures (FG 3.2.0 upwards)");
	}elsif(major == 2){
		if(minor <= 9){
			print("Disabled features:\n\tCanvas (FG 2.8.0 upwards)\n\tCanvas MapStructure (FG 3.0.0 upwards)\n\tCanvas-based GUI (FG 3.2.0 upwards\n\tNew custom failures (FG 3.2.0 upwards)");
		}elsif(minor <= 11){
			print("Disabled features:\n\tCanvas MapStructure (FG 3.0.0 upwards)\n\tCanvas-based GUI (FG 3.2.0 upwards\n\tNew custom failures (FG 3.2.0 upwards)");
			setprop("/sim/supported/canvas", 1);
			setprop("/sim/use-hdd", 1);
		}else{
			print("Disabled features:\n\tCanvas MapStructure (FG 3.0.0 upwards)\n\tCanvas-based GUI (FG 3.2.0 upwards\n\tNew custom failures (FG 3.2.0 upwards)");
			setprop("/sim/supported/canvas", 1);
			setprop("/sim/use-hdd", 1);
			setprop("/sim/supported/maketimer", 1);
		}
	}elsif(major == 3){
		setprop("/sim/supported/canvas", 1);
		setprop("/sim/use-hdd", 1);
		setprop("/sim/supported/canvas-mapstructure", 1);
		setprop("/sim/supported/maketimer", 1);
		if(minor <= 1){
			print("Disabled features:\n\tCanvas-based GUI (FG 3.2.0 upwards\n\tNew custom failures (FG 3.2.0 upwards)");
		}elsif(minor <= 3){
			setprop("/sim/supported/new-custom-fails", 1);
			setprop("/sim/supported/fap-dialog", 1);
			install_new_failures();
		}else{
			setprop("/sim/supported/new-custom-fails", 1);
			setprop("/sim/supported/fap-dialog", 1);
			setprop("/sim/supported/new-menu", 1);
		}
	}
}

var install_new_failures = func(){
	io.include("Aircraft/Generic/Systems/failures.nas");
	
	var RandTrigger = {

        parents: [FailureMgr.Trigger],
        requires_polling: 1,

        new: func(name = nil, reliability = 100){
			if(name == nil){
				die("RandTrigger.new(): Error! Define 'name'");
			}
			
            var m = FailureMgr.Trigger.new();
            m.parents = [RandTrigger];
            m.params["probability"] = reliability;
			m.params["name"] = name;
            return m;
        },

        to_str: func(){
            sprintf("Probability of %d failing: %d%", me.params["name"], me.params["probability"]);
        },

        update: func(){
			me.random = rand() * 100;
            if(me.random > me.params["probability"] and me.params["probability"] < 100){
				return 1;
			}else{
				return 0;
			}
        }
    };
	
	## Make all the systems unfailable for now
    FailureMgr.add_failure_mode("instrumentation/hdd", "HDD", set_unserviceable("instrumentation/hdd"));
    FailureMgr.set_trigger("instrumentation/hdd", RandTrigger.new("HDD"));
	
    FailureMgr.add_failure_mode("instrumentation/hud", "HUD", set_unserviceable("instrumentation/hud"));
    FailureMgr.set_trigger("instrumentation/hud", RandTrigger.new("HUD"));
	
    FailureMgr.add_failure_mode("instrumentation/radar", "Radar", set_unserviceable("instrumentation/radar"));
    FailureMgr.set_trigger("instrumentation/radar", RandTrigger.new("radar"));
	
    FailureMgr.add_failure_mode("instrumentation/landing-light", "Landing light", set_unserviceable("instrumentation/landing-light"));
    FailureMgr.set_trigger("instrumentation/landing-light", RandTrigger.new("landing light"));
	
    FailureMgr.add_failure_mode("instrumentation/beacons", "Beacons", set_unserviceable("instrumentation/beacons"));
    FailureMgr.set_trigger("instrumentation/beacons", RandTrigger.new("beacons"));
	
  #  FailureMgr.add_failure_mode("autopilot", "Autopilot", set_unserviceable("autopilot"));
    #FailureMgr.set_trigger("autopilot", RandTrigger.new("autopilot"));
	
    FailureMgr.add_failure_mode("instrumentation/tacan", "TACAN", set_unserviceable("instrumentation/tacan"));
    FailureMgr.set_trigger("instrumentation/tacan", RandTrigger.new("TACAN"));
}