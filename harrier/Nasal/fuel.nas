# Simple fuelsystem
# This will use fuel from droptanks first. 
# While refueling all tanks are selected
# Adapted from the F-16C(FGUK) code

# Define constant
var fueltanks 	= props.globals.getNode("consumables/fuel").getChildren("tank");

# Define variables
var wow 		= nil;
var parked 		= nil;
var tank1		= nil;
var tank2		= nil;

setlistener("systems/refuel/contact", func(n){
	if(n.getValue() == 1){
		foreach(f; fueltanks){
			f.getNode("selected", 1).setBoolValue(1);
		}
	}
}, 1);

# accessible from menu:
var fillup = func {
	if(wow and parked){
		gui.popupTip("Refueling from ground", 7);
		foreach(f; fueltanks) {
			var cap = f.getNode("capacity-gal_us");
			var level = f.getNode("level-gal_us");
			if(cap.getValue() > level.getValue()){
				f.getNode("selected", 1).setBoolValue(1);
				interpolate(f.getNode("level-gal_us"), cap.getValue(), 20);
			} 
		}
	}else{
		gui.popupTip("You must be on the ground and parked", 7);
	}	
}

var update = func {
	wow = getprop("/gear/gear[0]/wow");
	parked = getprop("controls/gear/brake-parking");
	
	if (getprop("/systems/refuel/contact") == 0 and getprop("sim/freeze/fuel") != 1) {
		tank1 = getprop("consumables/fuel/tank[1]/level-gal_us");
		tank2 = getprop("consumables/fuel/tank[2]/level-gal_us");
	
		if(tank2 == nil) { 
			setprop("consumables/fuel/tank[2]/level-gal_us", 0)
		}
		if(tank1 == nil) { 
			setprop("consumables/fuel/tank[1]/level-gal_us", 0)
		}
		
		foreach(f; fueltanks) {
			if (f.getNode("selected", 1).getBoolValue()){
				f.getNode("selected", 1).setBoolValue(0);
			}
		}
		if(tank1 > 0 or tank2 > 0) { 
			if(tank1 > 0){
				setprop("consumables/fuel/tank[1]/selected", 1);
			}
			if(tank2 > 0){ 
				setprop("consumables/fuel/tank[2]/selected", 1);
			}
		} else {
			foreach(f; fueltanks) {
				if (f.getNode("level-lbs").getValue() > 0.01) {
					f.getNode("selected", 0).setBoolValue(1);
				} 
			}
		}
	} 
}