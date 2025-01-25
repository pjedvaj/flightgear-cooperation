
# simple fuelsystem for 4 sequenced wingtanks.
# this will use fuel from external tanks first. 
# while refueling all tanks are selected

props.globals.initNode("systems/refuel/refueling", 0, "BOOL");
props.globals.initNode("systems/refuel/refueling_grnd", 0, "BOOL");

var fueltanks = props.globals.getNode("consumables/fuel").getChildren("tank");
var engine = props.globals.getNode("controls/engines").getChildren("engine");
var fueltanks = props.globals.getNode("consumables/fuel").getChildren("tank");
var wow = getprop ("/gear/gear[0]/wow");
var parked = getprop("controls/gear/brake-parking");
var refueling_grnd = props.globals.getNode("systems/refuel/refueling_grnd"); 
var refueling = props.globals.getNode("systems/refuel/refueling"); 

setlistener("systems/refuel/contact", func(n) {
	if (n.getValue() == 1) {
		refueling.setValue(1);
		foreach(f; fueltanks) {
			f.getNode("selected", 1).setBoolValue(1);
		}
	} else {
		refueling.setValue(0);
	}
},1);

# accessible from menu:
var fillup = func {
		if (wow and parked) {
		foreach(f; fueltanks) {		
		var cap 	= f.getNode("capacity-gal_us");
		var level = f.getNode("level-gal_us");
		if (cap.getValue() > level.getValue()) {
			refueling_grnd.setValue(1);
			f.getNode("selected", 1).setBoolValue(1);
			interpolate(f.getNode("level-gal_us"), cap.getValue(), 20);
			} 
		}	
		settimer( func refueling_grnd.setValue(0), 20);
	}	
}

var fuelTanks = func {
	if (refueling.getValue() == 0 and refueling_grnd.getValue() == 0) {

	var levelDropStbd1 = getprop("consumables/fuel/tank[10]/level-gal_us");
		if(levelDropStbd1 == nil) { levelDropStbd1 = 0; }
		var levelDropStbd2 = getprop("consumables/fuel/tank[9]/level-gal_us");
		if(levelDropStbd2 == nil) { levelDropStbd2 = 0; }
		var levelDropPort2 = getprop("consumables/fuel/tank[8]/level-gal_us");
		if(levelDropPort2 == nil) { levelDropPort2 = 0; }
		var levelDropPort1 = getprop("consumables/fuel/tank[7]/level-gal_us");
		if(levelDropPort1 == nil) { levelDropPort1 = 0; }
		var wingtanks1 = getprop("sim/weight[9]/weight-lb") + getprop("sim/weight[1]/weight-lb");
		var wigntanks2 = getprop("sim/weight[7]/weight-lb") + getprop("sim/weight[3]/weight-lb");
		if (getprop("sim/freeze/fuel")) { return registerTimer(fuelTanks); }
		if (getprop("systems/refuel/contact")) {return registerTimer(fuelTanks); }
	
	# first zero all tanks
	foreach(f; fueltanks) {
			if (f.getNode("selected", 1).getBoolValue()){
				f.getNode("selected", 1).setBoolValue(0);
				}
			}
	# wingranks1	
	if (levelDropStbd1 > 0 and levelDropPort1 > 0) {
		setprop("consumables/fuel/tank[10]/selected", 1);
		setprop("consumables/fuel/tank[7]/selected", 1);	
	# wingtanks2	
	} elsif (levelDropStbd2 > 0 and levelDropPort2 > 0) { 
		setprop("consumables/fuel/tank[9]/selected", 1);
		setprop("consumables/fuel/tank[8]/selected", 1); 
	# internal: not ordered yet
	} else {
			foreach(f; fueltanks) {
			if (f.getNode("level-lbs").getValue() > 0.05) {
				f.getNode("selected", 0).setBoolValue(1);
				} 
			}
		}
	} 
	settimer(fuelTanks, 0.5);
}

setlistener("/sim/signals/fdm-initialized", fuelTanks);