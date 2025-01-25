var hold_altitude = 0;
var pitch_gain = 0.27;
var roll_gain = 0.0019;
var yaw_gain = -0.63;
var collective_gain = 2;

func autohover() {
  var current_altitude = getprop("/position/altitude-ft");
  var altitude_error = hold_altitude - current_altitude;
  var pitch = altitude_error * pitch_gain;
  var roll = getprop("/orientation/roll-deg") * roll_gain;
  var yaw = getprop("/orientation/heading-deg") * yaw_gain;
  var collective = altitude_error * collective_gain;
  
  setcontrolvalue("pitch", pitch);
  setcontrolvalue("roll", roll);
  setcontrolvalue("yaw", yaw);
  setcontrolvalue("collective", collective);
}

var autohover_enabled = 0;

func enable_autohover() {
  autohover_enabled = 1;
  hold_altitude = getprop("/position/altitude-ft");
}

func disable_autohover() {
  autohover_enabled = 0;
}

var autohover_key = "Alt+q";

func check_input() {
  var keys = getkeys();
  if (inarray(keys, autohover_key) && !autohover_enabled) {
    enable_autohover();
    print("Autohover enabled");
  } else if (!inarray(keys, autohover_key) && autohover_enabled) {
    disable_autohover();
    print("Autohover disabled");
  }
}

settimer(function() {
  if (autohover_enabled) {
    autohover();
  }
  check_input();
}, 50);
