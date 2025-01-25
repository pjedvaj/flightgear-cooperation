# Define constants
var ROOT 		= props.globals.getNode("ai/models");
var RAW_LIST		= ROOT.getChildren();
var Radius		= 6371; # mean radius of Earth in km

# Define variables
var string 		= "";
var targetList 	= [];
var factor		= nil;
var tgts_list         	= [];
var MyTargetList      	= [];
var callsign 		= "";
var Target_Index      	= 0;
var distance 		= 0;
var bearing 		= 0;
var StandByTgtMarker  	= nil;
var tableuBound       	= nil;
var closeRange 		= nil;
var heading 		= nil;
var altitude 		= nil;
var speed 		= nil;
var longitude 		= nil;
var latitude 		= nil;
var bearing 		= nil;
var MyTarget 		= nil;
var RadarRange 		= nil;
var type 		= nil;
var maTarget		= nil;
var u_rng 		= nil;
var rel_angle		= nil;
var rel_elev		= nil;
var i 			= nil;
var MyTarget 		= nil;
var n 			= nil;
var s 			= nil;
var tgt_alt		= nil;
var carrier 		= nil;
var dev_norm 		= nil;
var nearest_u		= nil;
var hud_voffset       	= nil;
var hud_radius        	= nil;
var lat1_rad 		= nil;
var lat2_rad 		= nil;
var lat_rad 		= nil;
var lon_rad 		= nil;
var a 			= nil;
var c 			= nil;
var y 			= nil;
var x 			= nil;
var pitch		= nil;
var total_elevation	= nil;
var elevation		= nil;
var deviation		= nil;
var name		= nil;
var norm_combined_dev_rad = nil;
var o_hud_radius 	= nil;
var u_target 		= nil;
var u_dev_rad 		= nil;
var u_elev_rad 		= nil;
var h_dev 		= nil;
var v_dev 		= nil;
var dev_deg 		= nil;
var combined_dev_deg 	= nil;
var combined_dev_length = nil;
var our_lat		= nil;
var our_lon		= nil;
var our_alt		= nil;
var our_hdg            	= nil;
var our_pitch         	= nil;
var our_roll           	= nil;

var init = func(){
	hud_voffset = getprop("instrumentation/radar2/hud-vertical-offset-m");
	hud_radius = getprop("instrumentation/radar2/hud-radius-m");
}

var search1 = func (){
	our_lat 	= getprop("/position/latitude-deg") or 0.0;
	our_lon 	= getprop("/position/longitude-deg") or 0.0;
	our_alt 	= getprop("/position/altitude-ft") or 0.0;
	our_hdg		= getprop("orientation/heading-deg") or 0.0;
	our_pitch      	= getprop("orientation/pitch-deg") or 0.0;
	our_roll	= getprop("orientation/roll-deg") or 0.0;

	MyTargetList = [];
	tableuBound  = 0;
	RadarRange = getprop("instrumentation/radar/range-selected");
	foreach( var c; props.globals.getNode("ai/models").getChildren()) {
 		type = c.getName();
 		if (!c.getNode("valid", 1).getValue()) {
			continue;
		}  
		if (type == "multiplayer" or type == "tanker" or type =="carrier" or type =="aircraft" or type =="ship") {
			maTarget = Threat.new(c);
			u_rng = maTarget.get_range();
			rel_angle = math.abs(maTarget.get_bearing()-our_hdg);
			rel_elev = math.abs( (math.atan2((maTarget.get_altitude() - our_alt)*FT2M,u_rng *1852)*R2D) - our_pitch);		
			if(rel_angle < 10 and rel_elev < 10){
				if(RadarRange > u_rng and u_rng!=0){
					append(MyTargetList, maTarget);
					tableuBound = tableuBound +1;
				}
			}
		}
	}                  
	targeted();  
}

var next_Target_Index = func(){
        Target_Index = Target_Index + 1;
}

var previous_Target_Index = func(){
        Target_Index = Target_Index - 1;
}

var length = func(myTab){
         i = 0;
         foreach(var tempo; myTab ) {
                i = i+1;
         }
         return i;

}

var targeted = func(){
	
	closeRange = 0;
	heading = 0;
	altitude = 0;
	speed = 0;
	callsign = "";
	longitude = 0;
	latitude = 0;
	bearing = 0;

	if(tableuBound>0){                
		if(Target_Index<0){Target_Index = tableuBound - 1;}
		if(Target_Index>tableuBound - 1){Target_Index = 0;}
		MyTarget 	= MyTargetList[Target_Index];
                closeRange 	= MyTarget.get_range();
                heading 	= MyTarget.get_heading();
                altitude 	= MyTarget.get_altitude();
                speed 		= MyTarget.get_Speed();
                callsign 	= MyTarget.get_Callsign();
                longitude 	= MyTarget.get_Longitude();
                latitude 	= MyTarget.get_Latitude();
                bearing 	= MyTarget.get_bearing();
		pitch		= MyTarget.get_Pitch();
		total_elevation = MyTarget.get_total_elevation(our_pitch);
		elevation	= MyTarget.get_elevation();
		deviation	= MyTarget.get_deviation(our_hdg);
		name		= MyTarget.shortstring;
               
                setprop("/ai/closest/callsign", callsign);
                setprop("/ai/closest/range", closeRange);
                setprop("/ai/closest/heading", heading);
                setprop("/ai/closest/bearing", bearing);
                setprop("/ai/closest/altitude", altitude);
                setprop("/ai/closest/speed", speed);
                setprop("/ai/closest/longitude", longitude);
                setprop("/ai/closest/latitude", latitude);
                setprop("/ai/closest/pitch", pitch);
                setprop("/ai/closest/total-elevation", total_elevation);
                setprop("/ai/closest/elevation", elevation);
                setprop("/ai/closest/deviation", deviation);
                setprop("/ai/closest/ai-name", name);
        }else{
		setprop("/ai/closest/callsign", "nil");
                setprop("/ai/closest/range", 0);
                setprop("/ai/closest/heading", 0);
                setprop("/ai/closest/bearing", 0);
                setprop("/ai/closest/altitude", 0);
                setprop("/ai/closest/speed", 0);
                setprop("/ai/closest/longitude", 0);
                setprop("/ai/closest/latitude", 0);
                setprop("/ai/closest/pitch", 0);
                setprop("/ai/closest/total-elevation", 0);
                setprop("/ai/closest/elevation", 0);
                setprop("/ai/closest/deviation", 0);
                setprop("/ai/closest/ai-name", "nil");
	}
}

var closest_target = func(){
	if(tableuBound>0){
                if(Target_Index<0){Target_Index = tableuBound - 1;}
                if(Target_Index>tableuBound - 1){Target_Index = 0;}		
		MyTarget = MyTargetList[Target_Index];
                return MyTarget;
       }        
}

# Utilities.
var deviation_normdeg = func(our_heading, target_bearing) {
        dev_norm = our_heading - target_bearing;
        while (dev_norm < -180) dev_norm += 360;
        while (dev_norm > 180) dev_norm -= 360;
        return(dev_norm);
}

var rel2ab = func(bearing){
	if(bearing > 0.0 and bearing < 180.0){
		return bearing;
	}elsif(bearing < 0.0 and bearing > -180.0){
		bearing = bearing + 360;
		return bearing;
	}
	return bearing;
}

var ab2rel = func(bearing){
	if(bearing > 0.0 and bearing < 180.0){
		return bearing;
	}elsif(bearing < 360.0 and bearing > 180.0){
		bearing = bearing - 360;
		return bearing;
	}
}

# Target class
var Threat = {
    new: func(c){
		var obj 	= { parents : [Threat]};
		obj.type 	= c.getName();
		obj.index 	= c.getIndex();
		obj.shortstring	= obj.type ~ "[" ~ obj.index ~ "]";
		obj.Callsign	= c.getNode("callsign");
		obj.Heading 	= c.getNode("orientation/true-heading-deg");
		obj.Pitch 	= c.getNode("orientation/pitch-deg");
		obj.Alt 	= c.getNode("position/altitude-ft");
		obj.longitude 	= c.getNode("position/longitude-deg");
		obj.latitude 	= c.getNode("position/latitude-deg");
		obj.Speed	= c.getNode("velocities/true-airspeed-kt");

		return obj;
	},
	get_Speed: func(){
		return me.Speed.getValue();
    },
	get_Callsign: func(){
		if(me.Callsign.getValue() != ""){
			return me.Callsign.getValue();
		}else{
			return me.shortstring;
		}
	},
	get_Longitude : func {
		return me.longitude.getValue();
	},
	get_Latitude : func {
		return me.latitude.getValue();
	},
	get_Pitch : func {
		return me.Pitch.getValue();
	},
	get_heading : func {
		return me.Heading.getValue();
	},
	get_altitude : func {
		return me.Alt.getValue();
	},
	get_range : func {
		lat1_rad = our_lat * D2R;
		lat2_rad = me.get_Latitude() * D2R;
		lat_rad = (me.get_Latitude() - our_lat) * D2R;
		lon_rad = (me.get_Longitude() - our_lon) * D2R;

		a = math.sin(lat_rad / 2) * math.sin(lat_rad / 2) +
			math.cos(lat1_rad) * math.cos(lat2_rad) *
			math.sin(lon_rad / 2) * math.sin(lon_rad / 2);
		c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

		distance = Radius * c;

		return distance / 1.852;
	},
	get_total_elevation : func(own_pitch) {
		return - deviation_normdeg(own_pitch, me.get_elevation());
	},
	get_elevation : func() {
		return ( (me.get_altitude() - our_alt) / (5280 * (me.get_range() * 1.150779)) - (me.get_range() * 1.150779) / (2*3956) ) * R2D; 
	},
	get_bearing : func {
		y = math.sin((me.get_Longitude()-our_lon) * D2R) * math.cos(me.get_Latitude() * D2R);
		x = math.cos(our_lat * D2R)*math.sin(me.get_Latitude() * D2R) - math.sin(our_lat * D2R)*math.cos(me.get_Latitude() *  D2R)*math.cos((me.get_Longitude()- our_lon)  * D2R);
		brng = math.atan2(y, x) * R2D;

		return rel2ab(brng);
	},
	get_deviation : func(true_heading_ref) {
		return - deviation_normdeg(true_heading_ref, me.get_bearing());
	},
};

#need to copy the properties so that we never try to access a non-existent property in XML
var search2 = func(){

   	targetList = [];
	
   	if(getprop("instrumentation/radar/selected") == 2){
		if(getprop("instrumentation/radar/range") == 10){
			setprop("instrumentation/radar/range", 20);
         	setprop("instrumentation/radar/range-factor", 0.002);
      	}elsif(getprop("instrumentation/radar/range") == 20){
         	setprop("instrumentation/radar/range-factor", 0.003246);
      	}else{
         	setprop("instrumentation/radar/range-factor", 0.001623);
      	}
   	}elsif(getprop("instrumentation/radar/selected") == 3 or getprop("instrumentation/radar/selected") == 4){
     	if(getprop("instrumentation/radar/range") == 40){
        	setprop("instrumentation/radar/range", 20);
        	setprop("instrumentation/radar/range-factor", 0.001888);
     	}elsif(getprop("instrumentation/radar/range") == 20){
        	setprop("instrumentation/radar/range-factor", 0.001888);
     	}else{
        	setprop("instrumentation/radar/range-factor", 0.003776);
     	}
   	} 
	
   	foreach(d; props.globals.getNode("ai/models").getChildren("aircraft")){
      	append(targetList, d);
   	}
	
   	foreach(m; targetList){
      	string = "instrumentation/radar/ai/models/" ~ m.getName() ~ "[" ~ m.getIndex() ~ "]/";
      	if(getprop(string ~ "joined") == 1 or m.getName() == "aircraft"){
         	factor = getprop("instrumentation/radar/range-factor");
         	setprop(string ~ "radar/y-shift", m.getNode("radar/y-shift").getValue() * factor);
         	setprop(string ~ "radar/x-shift", m.getNode("radar/x-shift").getValue() * factor);
         	setprop(string ~ "radar/rotation", m.getNode("radar/rotation").getValue());
         	setprop(string ~ "radar/h-offset", m.getNode("radar/h-offset").getValue());

         	if(getprop("instrumentation/radar/selected") == 2){
            	if(getprop(string ~ "radar/x-shift") < -0.04 or getprop(string ~ "radar/x-shift") > 0.04){
               		setprop(string ~ "radar/in-range", 0);
            	}else{
               		setprop(string ~ "radar/in-range", m.getNode("radar/in-range").getValue());
            	}
         	}else{
            	setprop(string ~ "radar/in-range", m.getNode("radar/in-range").getValue());
         	}
      	} 
	}
}

var update = func(){
	search1();
	search2();
}