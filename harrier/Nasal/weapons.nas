var firing 	= "false";
var hud_disp 	= 1;
var dep 	= nil;
var name 	= nil;
var pylon 	= nil;
var groundspeed = nil;
var r_gun_on	= "true";
var l_gun_on	= "true";
var gun_unlim	= nil;
var weight_2	= nil;
var weight_4	= nil;
var select 		= nil;
var target		= nil;
var SelectedPylon 	= nil;
var typeMissile 	= nil;
var armed		= nil;
var weight 		= nil;
var weight_b 		= nil;
var ca 			= 0;
var cb 			= 0;
var cc 			= 0;
var cd 			= 0;
var x			= 0;		
var y			= 0;
var z			= 0;


var dropLoad = func(number){
	select = getprop("sim/weight["~ number ~"]/selected");
	armed = getprop("controls/armament/station["~ number ~"]/armed"); 
	if(select != "none"){
		if(select == "190 Gallon Fuel Tank"){
			dropTank(number);
		}elsif(select == "1000lb bomb"){
			dropBomb(number);
		}elsif(select == "500lb bomb"){
			dropBomb(number);	
		}elsif(select == "SNEB rocket pod"){
			fireSingleRocket(number);		
		}elsif(select == "ADEN 30mm Cannon"){
			return;			
		}else{
			x = getprop("sim/weight["~ number ~"]/offsets/x-m");
			y = getprop("sim/weight["~ number ~"]/offsets/y-m");
			z = getprop("sim/weight["~ number ~"]/offsets/z-m");
			dropMissile(number, select, x, y, z);
		}
	}
}

var dropMissile = func (number, typeMissile, xx, yy, zz) {
	target = radar.closest_target();	
  	if(target == nil){
		return;
	}
        missile.load_missile_settings(typeMissile);
        Current_missile = missile.MISSILE.new(number, typeMissile, xx, yy, zz);
        Current_missile.status = 0;
        Current_missile.search(target);             
        Current_missile.release();
          
        setprop("sim/weight["~ number ~"]/selected", "none");
        setprop("sim/weight["~ number ~"]/weight-lb", 0);
        after_fire_next();
}

var after_fire_next = func(){
	setprop("controls/armament/missile-sound", 0);
	SelectedPylon = getprop("controls/armament/missile/current-pylon");    
        if(SelectedPylon == 0){
		set_pylon(6);
	}elsif(SelectedPylon == 1){
		set_pylon(5);
	}elsif(SelectedPylon == 2){
		set_pylon(4);
	}elsif(SelectedPylon == 3){
		set_pylon(3);
	}elsif(SelectedPylon == 6){
		set_pylon(0);
	}elsif(SelectedPylon == 5){
		set_pylon(1);
	}elsif(SelectedPylon == 4){
		set_pylon(2);
	}    
}

var set_pylon = func(a) {
	setprop("controls/armament/missile/current-pylon", a);	
	setprop("controls/armament/missile/name", getprop("sim/weight["~ a ~"]/selected"));
}

var fireSingleRocket = func(b){	
	weight = getprop("/sim/weight["~ b ~"]/weight-lb");
	weight_b = weight;	
	if(b==0){		
		if(weight>50 and ca != 18){
			weight_b = weight_b - 10;
			setprop("/sim/weight["~ b ~"]/weight-lb", weight_b);			
			setprop("controls/armament/station[" ~ b ~ "]/fire-rocket[" ~ ca ~ "]", 1);
			ca = ca + 1;								
		}elsif(weight==50){
			ca=0;
			reset_triggers(0);
		}
	}elsif(b==1){		
		if(weight>50 and cb != 18){
			weight_b = weight_b - 10;
			setprop("/sim/weight["~ b ~"]/weight-lb", weight_b);		
			setprop("controls/armament/station[" ~ b ~ "]/fire-rocket[" ~ cb ~ "]", 1);
			cb = cb + 1;					
		}elsif(weight==50){
			cb=0;
			reset_triggers(1);
		}
	}elsif(b==5){		
		if(weight>50 and cc != 18){
			weight_b = weight_b - 10;
			setprop("/sim/weight["~ b ~"]/weight-lb", weight_b);				
			setprop("controls/armament/station[" ~ b ~ "]/fire-rocket[" ~ cc ~ "]", 1);
			cc = cc + 1;					
		}elsif(weight==50){
			cc=0;
			reset_triggers(5);
		}
	}elsif(b==6){		
		if(weight>50 and cd != 18){
			weight_b = weight_b - 10;
			setprop("/sim/weight["~ b ~"]/weight-lb", weight_b);				
			setprop("controls/armament/station[" ~ b ~ "]/fire-rocket[" ~ cd ~ "]", 1);
			cd = cd + 1;					
		}elsif(weight==50){
			cd=0;
			reset_triggers(6);
		}
	}
	
}

var dropTank = func(k){
	if(getprop("/controls/armament/station["~ k ~"]/drop-tank") == 1){			
		setprop("/sim/weight["~ k ~"]/weight-lb", 0);		
		setprop("/sim/weight["~ k ~"]/selected", "none");
		setprop("/controls/armament/station["~ k ~"]/drop-tank2", 1);
		setprop("/controls/armament/station["~ k ~"]/drop-tank", 0);
	}elsif(getprop("/controls/armament/station["~ k ~"]/drop-tank2") == 1){				
		setprop("/sim/weight["~ j ~"]/weight-lb", 0);		
		setprop("/sim/weight["~ j ~"]/selected", "none");
		setprop("/controls/armament/station["~ k ~"]/drop-tank", 1);
		setprop("/controls/armament/station["~ k ~"]/drop-tank2", 0);	
	}
	after_fire_next();			
}

var reset_triggers = func(v){
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[0]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[1]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[2]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[3]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[4]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[5]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[6]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[7]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[8]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[9]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[10]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[11]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[12]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[13]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[14]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[15]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[16]", 0);
	setprop("controls/armament/station[" ~ v ~ "]/fire-rocket[17]", 0);
}

var dropBomb = func(j){
	if(getprop("/controls/armament/station["~ j ~"]/release-bomb1") == 1){			
		setprop("/sim/weight["~ j ~"]/weight-lb", 0);		
		setprop("/sim/weight["~ j ~"]/selected", "none");
		setprop("/controls/armament/station["~ j ~"]/release-bomb1", 0);
		setprop("/controls/armament/station["~ j ~"]/release-bomb2", 1);
	}elsif(getprop("/controls/armament/station["~ j ~"]/release-bomb2") == 1){				
		setprop("/sim/weight["~ j ~"]/weight-lb", 0);		
		setprop("/sim/weight["~ j ~"]/selected", "none");
		setprop("/controls/armament/station["~ j ~"]/release-bomb1", 1);
		setprop("/controls/armament/station["~ j ~"]/release-bomb2", 0);	
	}
        after_fire_next();
}

var fire_flare = func(){
	if(getprop("/controls/armament/flare-release") == 1){
		setprop("/controls/armament/flare-release", 0);
		setprop("/controls/armament/flare-release2", 1);
	}elsif(getprop("/controls/armament/flare-release2") == 1){
		setprop("/controls/armament/flare-release", 1);
		setprop("/controls/armament/flare-release2", 0);	
	}
}

var eject_all = func(){
	if(getprop("sim/weight[0]/selected") == "ADEN 30mm Cannon"){
	}elsif(getprop("sim/weight[0]/selected") == "SNEB rocket pod"){
		setprop("sim/weight[0]/weight-lb", 50); 
	}else{
        	setprop("sim/weight[0]/selected", "none");
        	setprop("sim/weight[0]/weight-lb", 0);
	}

	if(getprop("sim/weight[1]/selected") == "ADEN 30mm Cannon"){
	}elsif(getprop("sim/weight[1]/selected") == "SNEB rocket pod"){
		setprop("sim/weight[1]/weight-lb", 50); 
	}else{
        	setprop("sim/weight[1]/selected", "none");
        	setprop("sim/weight[1]/weight-lb", 0);
	}

	if(getprop("sim/weight[2]/selected") == "ADEN 30mm Cannon"){
	}elsif(getprop("sim/weight[2]/selected") == "SNEB rocket pod"){
		setprop("sim/weight[2]/weight-lb", 50); 
	}else{
        	setprop("sim/weight[2]/selected", "none");
        	setprop("sim/weight[2]/weight-lb", 0);
	}

	if(getprop("sim/weight[3]/selected") == "ADEN 30mm Cannon"){
	}elsif(getprop("sim/weight[3]/selected") == "SNEB rocket pod"){
		setprop("sim/weight[3]/weight-lb", 50); 
	}else{
        	setprop("sim/weight[3]/selected", "none");
        	setprop("sim/weight[3]/weight-lb", 0);
	}

	if(getprop("sim/weight[4]/selected") == "ADEN 30mm Cannon"){
	}elsif(getprop("sim/weight[4]/selected") == "SNEB rocket pod"){
		setprop("sim/weight[4]/weight-lb", 50); 
	}else{
        	setprop("sim/weight[4]/selected", "none");
        	setprop("sim/weight[4]/weight-lb", 0);
	}

	if(getprop("sim/weight[5]/selected") == "ADEN 30mm Cannon"){
	}elsif(getprop("sim/weight[5]/selected") == "SNEB rocket pod"){
		setprop("sim/weight[5]/weight-lb", 50); 
	}else{
        	setprop("sim/weight[5]/selected", "none");
        	setprop("sim/weight[5]/weight-lb", 0);
	}

	if(getprop("sim/weight[6]/selected") == "ADEN 30mm Cannon"){
	}elsif(getprop("sim/weight[6]/selected") == "SNEB rocket pod"){
		setprop("sim/weight[6]/weight-lb", 50); 
	}else{
        	setprop("sim/weight[6]/selected", "none");
        	setprop("sim/weight[6]/weight-lb", 0);
	}
	gui.setWeightOpts();
}

var fire_MG = func(){
	if(getprop("controls/armament/stick-selector") == 1){
		fire_adens();
	}
	if(getprop("controls/armament/stick-selector") == 2){
		pylon = getprop("controls/armament/missile/current-pylon");
		if(getprop("controls/armament/station[" ~ pylon ~ "]/armed") == 1){
			dropLoad(pylon);
		}
	}	
}

var stop_MG = func(){
    setprop("/controls/armament/triggerl", 0);
	setprop("/controls/armament/triggerr", 0);
	setprop("/controls/armament/trigger", 0);	 
}
 
var fire_adens = func(){
	firing = "true";
	if(getprop("sim/weight[2]/selected") == "ADEN 30mm Cannon"){
		if(getprop("/ai/submodels/submodel[1]/count") != 0){
			setprop("/controls/armament/triggerl", 1);
			setprop("/controls/armament/trigger", 1);
		}
	}

	if(getprop("sim/weight[4]/selected") == "ADEN 30mm Cannon"){
		if(getprop("/ai/submodels/submodel[3]/count") != 0){
			setprop("/controls/armament/triggerr", 1);		
			setprop("/controls/armament/trigger", 1);
		}
	}
}

var reload_guns = func() {
	setprop("/controls/armament/guns-umlimited", 0);
	groundspeed = getprop("velocities/groundspeed-kt");

	if(groundspeed < 5){
    		setprop("/ai/submodels/submodel[0]/count", 130);
		setprop("/ai/submodels/submodel[1]/count", 130);
		setprop("/ai/submodels/submodel[2]/count", 130);
		setprop("/ai/submodels/submodel[3]/count", 130);
		setprop("/ai/submodels/submodel[4]/count", 130);
		setprop("/ai/submodels/submodel[5]/count", 130);
		gui.popupTip ("ADEN cannons reloaded to 130 rounds.", 7);
	}else{
    		gui.popupTip ("You must be stopped to reload ammo.", 7);
	}
}

var unlimited_guns = func() {
	setprop("/controls/armament/guns-umlimited", 1);
    	setprop("/ai/submodels/submodel[0]/count", -1);
	setprop("/ai/submodels/submodel[1]/count", -1);
	setprop("/ai/submodels/submodel[2]/count", -1);
	setprop("/ai/submodels/submodel[3]/count", -1);
	setprop("/ai/submodels/submodel[4]/count", -1);
	setprop("/ai/submodels/submodel[5]/count", -1);
    	gui.popupTip ("ADEN cannons reloaded to unlimited rounds.", 7);	
}

var update = func(){
	gun_unlim = getprop("/controls/armament/guns-umlimited");
	weight_2 = getprop("sim/weight[2]/selected");
	weight_4 = getprop("sim/weight[4]/selected");
	
	if(getprop("/sim/current-view/view-number") == 0 and getprop("/instrumentation/hud/volts") > 20){
		setprop("/sim/hud/visibility[1]", 1);
	}else{	
		setprop("/sim/hud/visibility[1]", 0);
	}
	
	if(firing == "true"){
		if(getprop("/ai/submodels/submodel[0]/count") != -1 or getprop("/ai/submodels/submodel[2]/count") != -1){
			if(getprop("/ai/submodels/submodel[0]/count") <= 0 or getprop("/ai/submodels/submodel[2]/count") <= 0){
				stop_MG();
				firing = "false";
			}
		}
	}
	
	if(getprop("/sim/supported/fap-dialog")){
		setprop("/sim/menubar/default/menu[5]/item[3]/enabled", 0);
		if(getprop("/velocities/groundspeed-kt") < 2){
			setprop("/sim/menubar/default/menu[5]/item[3]/enabled", 1);
		}
	}else{
		setprop("/sim/menubar/default/menu[5]/item[2]/enabled", 0);
		if(getprop("/velocities/groundspeed-kt") < 2){
			setprop("/sim/menubar/default/menu[5]/item[2]/enabled", 1);
		}
	}
	
	update_r_guns();
	update_l_guns();
}

var update_r_guns = func(){
	if(r_gun_on == "true" and weight_4 != "ADEN 30mm Cannon"){
		r_gun_on = "false";
    		setprop("/ai/submodels/submodel[0]/count", 0);
		setprop("/ai/submodels/submodel[1]/count", 0);
		setprop("/ai/submodels/submodel[5]/count", 0);
	}elsif(r_gun_on == "false" and weight_4 != "ADEN 30mm Cannon"){
		return;
	}elsif(r_gun_on == "true" and weight_4 == "ADEN 30mm Cannon"){
		return;
	}elsif(r_gun_on == "false" and weight_4 == "ADEN 30mm Cannon"){
		r_gun_on = "true";
		if(gun_unlim == 1){
    			setprop("/ai/submodels/submodel[0]/count", -1);
			setprop("/ai/submodels/submodel[1]/count", -1);
			setprop("/ai/submodels/submodel[5]/count", -1);
		}else{
    			setprop("/ai/submodels/submodel[0]/count", 130);
			setprop("/ai/submodels/submodel[1]/count", 130);
			setprop("/ai/submodels/submodel[5]/count", 130);
		}
	}
}

var update_l_guns = func(){

	if(l_gun_on == "true" and weight_2 != "ADEN 30mm Cannon"){
		l_gun_on = "false";
    		setprop("/ai/submodels/submodel[2]/count", 0);
		setprop("/ai/submodels/submodel[3]/count", 0);
		setprop("/ai/submodels/submodel[4]/count", 0);
	}elsif(l_gun_on == "false" and weight_2 != "ADEN 30mm Cannon"){
		return;
	}elsif(l_gun_on == "true" and weight_2 == "ADEN 30mm Cannon"){
		return;
	}elsif(l_gun_on == "false" and weight_2 == "ADEN 30mm Cannon"){
		l_gun_on = "true";
		if(gun_unlim == 1){
    			setprop("/ai/submodels/submodel[2]/count", -1);
			setprop("/ai/submodels/submodel[3]/count", -1);
			setprop("/ai/submodels/submodel[4]/count", -1);
		}else{
    			setprop("/ai/submodels/submodel[2]/count", 130);
			setprop("/ai/submodels/submodel[3]/count", 130);
			setprop("/ai/submodels/submodel[4]/count", 130);
		}
	}
}