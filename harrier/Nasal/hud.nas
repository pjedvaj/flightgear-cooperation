var lbs_to_slugs    	= 0.031080950172;
var Clamp_Blinker = aircraft.light.new("instrumentation/radar2/hud/target-clamped-blinker", [0.1, 0.1]);
var se_fps 		= nil;
var sn_fps 		= nil;
var sd_fps 		= nil;
var agl   		= nil;
var p      		= nil;
var s_fps 		= nil;
var a 			= nil;
var gs_fps 		= nil;
var sina_vct 		= nil;
var cosa_vct 		= nil;
var sina 		= nil;
var cosa 		= nil;
var range_ft 		= nil;
var impact_pitch_deg 	= nil;
var ccip_dev_deg 	= nil;
var ccip_dev_m 		= nil;
var hud_voffset       	= nil;
var hud_radius = nil;
setprop("instrumentation/radar2/hud/target-clamped-blinker/enabled", 1);

# main loop ####################
var update = func(){
hud_voffset = getprop("instrumentation/radar2/hud-vertical-offset-m") or 0.0;
hud_radius = getprop("instrumentation/radar2/hud-radius-m") or 0.0;
		se_fps = getprop("/velocities/speed-east-fps") or 0.0;
		sn_fps = getprop("/velocities/speed-north-fps") or 0.0;
		sd_fps = getprop("/velocities/speed-down-fps") or 0.0;
		agl    = getprop("/position/altitude-agl-ft") or 0.0;
		p      = getprop("/orientation/pitch-deg") or 0.0;

		s_fps = 0; # total velocity, fps.
		a = 0; # angle between total velocity and horizontal velocity.

		gs_fps = math.sqrt( (se_fps * se_fps) + ( sn_fps * sn_fps ) );
		s_fps  = math.sqrt( (gs_fps * gs_fps) + ( sd_fps * sd_fps ) );
		sina_vct = sd_fps / s_fps;
		cosa_vct = gs_fps / s_fps;

		a = ( 180 / math.pi  * ( math.atan2( gs_fps, sd_fps )) ) - 90;
		sina = math.sin( a * D2R );
		cosa = math.cos( a * D2R );
		
		if ( agl > 0 ) {
			range_ft = ( s_fps * cosa * lbs_to_slugs ) * ( ( s_fps * sina ) + math.sqrt(( s_fps * s_fps * sina * sina ) + ( 2 * agl / lbs_to_slugs )));
		} else {
			range_ft = 0;
		}

		impact_pitch_deg =  180 / math.pi  * ( math.atan2( agl, range_ft ));
		ccip_dev_deg = impact_pitch_deg + p;
		ccip_dev_m = math.sin( ccip_dev_deg * D2R ) * 0.95 * math.cos( ccip_dev_deg * D2R );
		setprop("/sim/hud/ccip_dev_m", ccip_dev_m);
	hud_nearest_tgt();
	gunsight();
}

var hud_nearest_tgt = func() {

	if(radar.tableuBound>0){
		nearest_u = radar.MyTargetList[radar.Target_Index];
		u_target = nearest_u;
                u_dev_rad = (90 - nearest_u.get_deviation(radar.our_hdg)) * D2R;
                u_elev_rad = (90 - nearest_u.get_total_elevation(radar.our_pitch)) * D2R;
                # Deviation length on the HUD (at level flight), 0.6686m = distance eye <-> virtual HUD screen.
                h_dev = 0.6686 / ( math.sin(u_dev_rad) / math.cos(u_dev_rad) );
                v_dev = 0.6686 / ( math.sin(u_elev_rad) / math.cos(u_elev_rad) );
                # Angle between HUD center/top <-> HUD center/target position.
                # -90° left, 0° up, 90° right, +/- 180° down. 
                dev_deg =  math.atan2( h_dev, v_dev ) * R2D;
                # Correction with own a/c roll.
		combined_dev_deg = dev_deg - radar.our_roll;
		# Lenght HUD center <-> target pos on the HUD:
		combined_dev_length = math.sqrt((h_dev*h_dev)+(v_dev*v_dev));
		# Clamp so the target follow the HUD limits.
		if(hud_voffset == 0){
			if(combined_dev_length > hud_radius){
				combined_dev_length = hud_radius;
				Clamp_Blinker.blink();
			}else{
				Clamp_Blinker.cont();
			}
		}else{
			norm_combined_dev_rad = (math.abs(combined_dev_deg) - 90) * D2R;
                                o_hud_radius = hud_radius - (math.sin(norm_combined_dev_rad) * hud_voffset);
                                if ( combined_dev_length > o_hud_radius ) {
                                        combined_dev_length = o_hud_radius;
                                        Clamp_Blinker.blink();
                                } else {
                                        Clamp_Blinker.cont();
                                }
                        }
			setprop("instrumentation/radar2/hud/target-total-angle", combined_dev_deg);
			setprop("instrumentation/radar2/hud/target-total-deviation", combined_dev_length);
			setprop("instrumentation/radar2/hud/target-display", 1);
			setprop("instrumentation/radar2/hud/target", u_target.shortstring);
                        return;
        }
	setprop("instrumentation/radar2/hud/target-total-angle", 0.0);
	setprop("instrumentation/radar2/hud/target-total-deviation", 0.0);
	setprop("instrumentation/radar2/hud/target-display", 0);
	setprop("instrumentation/radar2/hud/target", "");
}

var gunsight = func(){
	name = getprop("controls/armament/missile/name");	
	if(getprop("controls/armament/stick-selector") == 1){
		# sight set to guns
		setprop("/instrumentation/hud/aim/active", "false");
		setprop("/instrumentation/hud/aim/tachy", "true");
		setprop("/instrumentation/hud/aim/align", "true");
		setprop("/instrumentation/hud/aim/speed-fps", 2430);
		setprop("/instrumentation/hud/aim/range-yds", 1000);
		setprop("/instrumentation/hud/aim/radius", 2);		
	}elsif(getprop("controls/armament/stick-selector") == 2 and name == "SNEB rocket pod"){
		# sight set to rocket
		setprop("/instrumentation/hud/aim/active", "false");
		setprop("/instrumentation/hud/aim/tachy", "true");
		setprop("/instrumentation/hud/aim/align", "true");
		setprop("/instrumentation/hud/aim/speed-fps", 3200);
		setprop("/instrumentation/hud/aim/range-yds", 1000);
		setprop("/instrumentation/hud/aim/radius", 2.5);						
	}else{
		# sight set to off
		setprop("/instrumentation/hud/aim/active", "true");
		setprop("/instrumentation/hud/aim/tachy", "false");
		setprop("/instrumentation/hud/aim/align", "false");
		setprop("/instrumentation/hud/aim/speed-fps", 0);
		setprop("/instrumentation/hud/aim/range-yds", 0);
		setprop("/instrumentation/hud/aim/radius", 0);						
	}

	if(getprop("controls/armament/stick-selector") == 2 and name == "1000lb bomb"){
		# sight hud to ccip mode
		setprop("/instrumentation/hud/show-ccip", 1);						
	}else{
		setprop("/instrumentation/hud/show-ccip", 0);		
	}	
}

var hud_toggle = func(){
	if(getprop("/instrumentation/hud/on") == 1){
		setprop("/instrumentation/hud/on", 0);
	}elsif(getprop("/instrumentation/hud/on") == 0){
		setprop("/instrumentation/hud/on", 1);
	}
}