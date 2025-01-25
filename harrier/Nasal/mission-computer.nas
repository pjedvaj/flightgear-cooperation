 var switches = {
	"toggle_range": 		{path: "/range-nm", 					value:50, 		type:"INT"},
	"toggle_weather":       {path: "/wxr", 							value:0, 		type:"BOOL"},
    "toggle_airports":      {path: "/arpt", 						value:0, 		type:"BOOL"},
    "toggle_stations":      {path: "/sta", 							value:0, 		type:"BOOL"},
    "toggle_waypoints":     {path: "/wpt", 							value:0, 		type:"BOOL"},
    "toggle_position":      {path: "/constants/pos", 				value:0, 		type:"BOOL"},
    "toggle_data":          {path: "/data",							value:0, 		type:"BOOL"},
    "toggle_terrain":       {path: "/constants/terr",				value:0, 		type:"BOOL"},
    "toggle_traffic":       {path: "/constants/tfc",				value:0,		type:"BOOL"},
    "toggle_centered":      {path: "/nd-centered",					value:0, 		type:"BOOL"},
    "toggle_lh_vor_adf":    {path: "/constants/lh-vor-adf",			value:0, 		type:"INT"},
    "toggle_rh_vor_adf":    {path: "/constants/rh-vor-adf",			value:0, 		type:"INT"},
    "toggle_display_mode":  {path: "/display-mode", 				value:"MAP", 	type:"STRING"},
    "toggle_display_type":  {path: "/constants/display-type", 		value:"LCD", 	type:"STRING"},
    "toggle_true_north":    {path: "/true-north", 					value:0, 		type:"BOOL"},
    "toggle_rangearc":      {path: "/constants/rangearc", 			value:0, 		type:"BOOL"},
    "toggle_track_heading": {path: "/constants/hdg-trk-selected", 	value:0, 		type:"BOOL"}
 };	

var init = func(){
    var mis_com = canvas.NavDisplay.new("instrumentation/hdd/mis-com", switches);
    mis_com.newMFD(hdd.root_ex, hdd.canvas_ex);
    mis_com.update();
}