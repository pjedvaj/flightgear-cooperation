var UPDATE_PERIOD 	= getprop("/sim/update_loop_speed") or 0.25;
var sta_sel 		= nil;
var sta 			= nil;
var loop_timer 		= nil;

#### Initialization ####
var init = func(){
	print("\nInitializing...");
	limits.init();
	print("Limits initialized");	
	harrier.init();
	engines.Pegasus_mk106.init();
	print("Engine initialized");	
	electrical.init();
	print("Electrical system initialized");
	
	if(getprop("/sim/supported/canvas")){
		hdd.init();
		print("Head-down display initialized");
		#mis_com.init();
		#print("Mission computer initialized");
	}
	
	radar.init();
	print("Head-up display initialized");
	setlistener("/sim/signals/reinit", reinit);
	
	if(getprop("/sim/supported/maketimer")){
		loop_timer = maketimer(UPDATE_PERIOD, func(){
			loop();
		});
		loop_timer.singleShot = 1;
	}
	
	setprop("sim/sound/volume", 0.0);
	setprop("/sim/sound/enabled", 1);
	settimer(func(){
		setprop("sim/sound/volume", 0.8);
	}, 8);
	
	loop();
}

#### Re-initialize ####
var reinit = func(){
	print("\nReinitializing...");
	limits.reinit();
	print("Limits reinitialized");	
	harrier.turn_off();
}

#### Main loop ####
var loop = func(){
	UPDATE_PERIOD = getprop("sim/update_loop_speed") or 0.02;
	sta_sel = getprop("/controls/armament/missile/current-pylon");
	setprop("/controls/armament/missile/name", getprop("/sim/weight["~ sta_sel ~"]/selected"));
	check_canopy();
	hdd.update();
	harrier.update();
	electrical.update();
	radar.update();
	weapons.update();
	hud.update();
	sounds.update();
	fuel.update();
	
	if(!getprop("/sim/supported/maketimer")){
		settimer(loop, UPDATE_PERIOD);	
	}else{
		loop_timer.restart(UPDATE_PERIOD);
	}
}

var ctrl_w = func(){
	sta = getprop("/controls/armament/station[" ~ sta_sel ~ "]/armed");
	setprop("/controls/armament/station[" ~ sta_sel ~ "]/armed", sta ? 0 : 1);
}

var key_5 = func(){
	if(getprop("controls/armament/stick-selector") != 2){
		controls.centerFlightControls();
	}else{
		weapons.set_pylon(4);
	}
}

var check_canopy = func(){
	if(getprop("/velocities/airspeed-kt") > 100.0 and getprop("/sim/model/canopy-breakable") and !getprop("/sim/model/canopy-broken") and getprop("/canopy/position-norm") == 1.0){
		screen.log.write("Canopy broken");
		setprop("/sim/model/canopy-broken", 1);
	}
}

#### Listener ####
var listener = setlistener("/sim/signals/fdm-initialized", func(){
	init();
	removelistener(listener);
});