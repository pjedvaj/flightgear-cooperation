var shar_dlg_syst_fail = gui.Dialog.new("harrier-dialogs/harrier-failures/dialog","Aircraft/harrier/Dialogs/system-failures.xml");
var shar_ap_dlg = gui.Dialog.new("harrier-dialogs/autopilot-dlg/dialog", "Aircraft/harrier/Dialogs/autopilot-dlg.xml");
var op_dlg = gui.Dialog.new("harrier-dialogs/options-dlg/dialog", "Aircraft/harrier/Dialogs/option-dlg.xml");

var sys_fail = {};

var sys_fail_new = func(){
	
	sys_fail.dlg = canvas.Window.new([350, 150], "dialog").setTitle("Extra system failures");
	
    sys_fail.root = sys_fail.dlg.getCanvas(1)
		.set("background", canvas.style.getColor("bg_color"))
		.createGroup();
		
	sys_fail.layout = canvas.VBoxLayout.new();
    sys_fail.dlg.setLayout(sys_fail.layout);
	
	sys_fail.hbox = canvas.HBoxLayout.new();
    sys_fail.layout.addItem(sys_fail.hbox);
	
	# ---
	# Left side	
	sys_fail.vbox_l = canvas.VBoxLayout.new();
    sys_fail.hbox.addItem(sys_fail.vbox_l);
	
	sys_fail.checkbox_hud = canvas.gui.widgets.CheckBox.new(sys_fail.root, canvas.style, {})
		.setText("HUD")
		.listen("toggled", func(a){
			setprop("/sim/failure-manager/instrumentation/hud/failure-level", a.detail.checked == 1 ? 1.0 : 0.0);
		});
	sys_fail.vbox_l.addItem(sys_fail.checkbox_hud);
	
	sys_fail.checkbox_hdd = canvas.gui.widgets.CheckBox.new(sys_fail.root, canvas.style, {})
		.setText("HDD")
		.listen("toggled", func(a){
			setprop("/sim/failure-manager/instrumentation/hdd/failure-level", a.detail.checked == 1 ? 1.0 : 0.0);
		});
	sys_fail.vbox_l.addItem(sys_fail.checkbox_hdd);
	
	sys_fail.checkbox_radar = canvas.gui.widgets.CheckBox.new(sys_fail.root, canvas.style, {})
		.setText("Radar")
		.listen("toggled", func(a){
			setprop("/sim/failure-manager/instrumentation/radar/failure-level", a.detail.checked == 1 ? 1.0 : 0.0);
		});
	sys_fail.vbox_l.addItem(sys_fail.checkbox_radar);
	
	sys_fail.checkbox_tacan = canvas.gui.widgets.CheckBox.new(sys_fail.root, canvas.style, {})
		.setText("TACAN")
		.listen("toggled", func(a){
			setprop("/sim/failure-manager/instrumentation/tacan/failure-level", a.detail.checked == 1 ? 1.0 : 0.0);
		});
	sys_fail.vbox_l.addItem(sys_fail.checkbox_tacan);
	
	# ---
	# Right side	
	sys_fail.vbox_r = canvas.VBoxLayout.new();
    sys_fail.hbox.addItem(sys_fail.vbox_r);
	
	sys_fail.checkbox_acb = canvas.gui.widgets.CheckBox.new(sys_fail.root, canvas.style, {})
		.setText("Anti-collision beacons")
		.listen("toggled", func(a){
			setprop("/sim/failure-manager/instrumentation/beacons/failure-level", a.detail.checked == 1 ? 1.0 : 0.0);
		});
	sys_fail.vbox_r.addItem(sys_fail.checkbox_acb);
	
	sys_fail.checkbox_ap = canvas.gui.widgets.CheckBox.new(sys_fail.root, canvas.style, {})
		.setText("Autopilot")
		.listen("toggled", func(a){
			setprop("/sim/failure-manager/autopilot/failure-level", a.detail.checked == 1 ? 1.0 : 0.0);
		});
	sys_fail.vbox_r.addItem(sys_fail.checkbox_ap);
	
	sys_fail.checkbox_lndlight = canvas.gui.widgets.CheckBox.new(sys_fail.root, canvas.style, {})
		.setText("Landing light")
		.listen("toggled", func(a){
			setprop("/sim/failure-manager/instrumentation/landing-light/failure-level", a.detail.checked == 1 ? 1.0 : 0.0);
		});
	sys_fail.vbox_r.addItem(sys_fail.checkbox_lndlight);
	
	# ---
	# Close button
	sys_fail.close_button = canvas.gui.widgets.Button.new(sys_fail.root, canvas.style, {})
		.setText("Close")
		.listen("clicked", func(){
			sys_fail.dlg.del();
		});		
    sys_fail.layout.addItem(sys_fail.close_button);
}