var autohover_on = 0;
var autohover_yaw_gain = 0.2;
var autohover_alt_gain = 0.3;
var autohover_alt_error = 0.0;
var autohover_pitch_gain = 1.0;
var autohover_pitch_error = 0.0;
var autohover_speed_gain = 5;
var autohover_speed_error = 0.0;

func autohover()
{
    var controls = getprop("/controls/flight");
    var ap_speed_mode = getprop("autopilot/locks/speed");
    
    if(!autohover_on)
    {
        autohover_alt_error = 0.0;
        autohover_pitch_error = 0.0;
        autohover_speed_error = 0.0;
        autohover_on = 1;
    }
    
    var alt_error = -getprop("/autopilot/settings/altitude-ft") + getprop("/position/altitude-ft");
    var pitch_error = 0.0;
    var speed_error = 0.0;
    
    if (ap_speed_mode == "speed-with-pitch-trim") {
        speed_error = -getprop("/autopilot/settings/speed-kt") - getprop("/velocities/airspeed-kt");
    }
    
    pitch_error = autohover_alt_gain * autohover_alt_error + autohover_pitch_gain * autohover_pitch_error + autohover_speed_gain * autohover_speed_error;
    
    var collective = 0.7 * alt_error + 0.3 * autohover_alt_error;
    var pitch = pitch_error;
    var roll = -getprop("/orientation/roll-deg") * autohover_yaw_gain;
    
    controls.fcs[0] = collective;
    controls.fcs[1] = pitch;
    controls.fcs[2] = roll;
    
    autohover_alt_error = alt_error;
    autohover_pitch_error = pitch_error;
    autohover_speed_error = speed_error;
    
    setprop("/controls/flight/fcs/auto-hover-enabled", 1);
}

func autohover_off()
{
    autohover_on = 0;
    setprop("/controls/flight/fcs/auto-hover-enabled", 0);
}

addhook("key_down", "autohover_keydown");
func autohover_keydown(event)
{
    if(event == "h")
    {
        autohover();
        print("Autohover ON");
    }
    if(event == "j")
    {
        autohover_off();
        print("Autohover OFF");
    }
}
