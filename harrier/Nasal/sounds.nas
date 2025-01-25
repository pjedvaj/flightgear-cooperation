var high_g 	= "false";
var g 		= nil;
var eng_n1	= nil;

var update = func(){
	eng_n1 = getprop("/engines/engine[0]/n1");
	g = getprop("/accelerations/pilot-g") or 1.0;
	if(getprop("/canopy/position-norm") == 0.0 and getprop("/sim/current-view/view-number") == 0){
		setprop("/sim/sound/startup-sound-factor", eng_n1 * 0.0025);
		setprop("/sim/sound/startup-sound-factor-mp", eng_n1 * 0.0025);
		setprop("/sim/sound/gunfire-vol", 0.5);
		setprop("/sim/sound/missile-vol", 0.5);
	}else{
		setprop("/sim/sound/startup-sound-factor", eng_n1 * 0.005);
		setprop("/sim/sound/startup-sound-factor-mp", eng_n1 * 0.005);
		setprop("/sim/sound/gunfire-vol", 1);
		setprop("/sim/sound/missile-vol", 1);
	}

	if(high_g == "false" and g > 5.0){
		high_g = "true";
		setprop("/sim/sound/high-g", 1);
		setprop("/sim/sound/low-g", 0);		
	}elsif(high_g == "true" and g > 5.0){		
		return;
	}elsif(high_g == "false" and g < 5.0){
		return;
	}elsif(high_g == "true" and g < 5.0){
		high_g = "false";
		setprop("/sim/sound/high-g", 0);
		setprop("/sim/sound/low-g", 1);
	}
}