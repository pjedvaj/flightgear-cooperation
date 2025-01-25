# Define variables
var index 			= 0;
var use_map 		= 0;
var map_layers 		= ["APS", "APT", "VOR", "RTE", "DME"];
var font 			= "LiberationFonts/LiberationSans-Regular.ttf";
var alignment		= "left-center";
var max_width		= ["max-width", 380];
var object 			= "PFD-Screen";
var matrix			= nil;
var station_select	= nil;
var page			= nil;
var sub_page 		= nil;
var hdg_off			= nil;	
var ap_1			= nil;	
var ap_2			= nil;
var or_deg			= nil;
var wght_2			= nil;
var wght_4			= nil;
var sta_0			= nil;
var sta_1			= nil;
var sta_2			= nil;
var sta_3			= nil;
var sta_4			= nil;
var sta_5			= nil;
var sta_6			= nil;
var level_1			= nil;
var level_2			= nil;
var level_3			= nil;

	var parts = {
		page1: {
			subpage1: {
				hidden: "true",
				show: "false"
			},
			subpage2: {
				hidden: "true",
				show: "false"
			}
		},
		page2: {
			subpage1: {
				hidden: "true",
				show: "false"
			},
		},
		page3: {
			hidden: "true",
			show: "false"
		},
		page4: {
			subpage1: {
				hidden: "true",
				show: "false"
			},
			subpage2: {
				hidden: "true",
				show: "false"
			},
			subpage3: {
				hidden: "true",
				show: "false"
			}
		},
		nav: {
			hidden: "true",
			show: "false"
		}
	};
	
var init = func(){
	if(!getprop("sim/supported/canvas")){
		return;
	}

    var new_canvas = canvas.new({
		name: "HDD",
		size: [1024, 1024],
		view: [500, 500],
		mipmapping: 1
	});
	
	new_canvas.addPlacement({"node": object});
	new_canvas.setColorBackground(0,0,0,1);
	
	#### For putting in a Canvas dialog ####
	#var dlg = canvas.Window.new([500,500], "dialog");
	#var new_canvas = dlg.createCanvas().setColorBackground(0,0,0,1);
	
	#### Alternative ####
	#var canvas_dlg = canvas.Window.new([500, 500], "dialog").setCanvas(new_canvas);
	
	var root = new_canvas.createGroup();

		#### Text to aid page navigation ####
		parts.nav.text_top0 = root.createChild("text")
								.setText("NAV")
								.setTranslation(75, 25)
								.setAlignment(alignment)
								.setFontSize(15)
								.setFont(font)
								.set(max_width[0], max_width[1])
								.setColor(0,1,0)
								.setColorFill(0,1,0)
								.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
								.hide();

		parts.nav.text_top1 = root.createChild("text")
								.setText("SMS")
								.setTranslation(190, 25)
								.setAlignment(alignment)
								.setFontSize(15)
								.setFont(font)
								.set(max_width[0], max_width[1])
								.setColor(0,1,0)
								.setColorFill(0,1,0)
								.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
								.hide();

		parts.nav.text_top2 = root.createChild("text")
								.setText("MIS")
								.setTranslation(315, 25)
								.setAlignment(alignment)
								.setFontSize(15)
								.setFont(font)
								.set(max_width[0], max_width[1])
								.setColor(0,1,0)
								.setColorFill(0,1,0)
								.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
								.hide();

		parts.nav.text_top3 = root.createChild("text")
								.setText("SYS")
								.setTranslation(420, 25)
								.setAlignment(alignment)
								.setFontSize(15)
								.setFont(font)
								.set(max_width[0], max_width[1])
								.setColor(0,1,0)
								.setColorFill(0,1,0)
								.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
								.hide();
								
		for(index = 0; index <= 1; index += 1){
			parts.nav["text_left" ~ index] = root.createChild("text")
														.setText("")
														.setTranslation(25, (index * 85) + 90)
														.setAlignment(alignment)
														.setFontSize(15)
														.setFont(font)
														.set(max_width[0], max_width[1])
														.setColor(0,1,0)
														.setColorFill(0,1,0)
														.setDrawMode(canvas.Text.TEXT)
														.hide();
		}

		parts.nav.text_left2 = root.createChild("text")
                               .setText("")
                               .setTranslation(25, 255)
                               .setAlignment(alignment)
                               .setFontSize(15)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
		 	       .setColorFill(0,1,0)
			       .setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
			       .hide();

		parts.nav.text_left4 = root.createChild("text")
									.setText("ON")
									.setTranslation(25, 435)
									.setAlignment(alignment)
									.setFontSize(15)
									.setFont(font)
									.set(max_width[0], max_width[1])
									.setColor(0,1,0)
									.setDrawMode(canvas.Text.TEXT)
									.hide();

		#### page 1, subpage 1 (Autopilot) ####
		parts.page1.subpage1.text0 = root.createChild("text")
                               .setText("Altitude:")
                               .setTranslation(110, 110)
                               .setAlignment(alignment)
                               .setFontSize(30)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
		 	       .setColorFill(0,1,0)
			       .setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
			       .hide();

		parts.page1.subpage1.text1 = root.createChild("text")
                               .setText("")
                               .setTranslation(110, 150)
                               .setAlignment(alignment)
                               .setFontSize(30)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
			       .setDrawMode(canvas.Text.TEXT)
			       .hide();

		parts.page1.subpage1.text2 = root.createChild("text")
                               .setText("Pitch:")
                               .setTranslation(300, 110)
                               .setAlignment(alignment)
                               .setFontSize(30)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
		 	       .setColorFill(0,1,0)
			       .setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
			       .hide();

		parts.page1.subpage1.text3 = root.createChild("text")
                               .setText("")
                               .setTranslation(300, 150)
                               .setAlignment(alignment)
                               .setFontSize(30)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
			       .setDrawMode(canvas.Text.TEXT)
			       .hide();

		parts.page1.subpage1.text4 = root.createChild("text")
                               .setText("Heading:")
                               .setTranslation(300, 230)
                               .setAlignment(alignment)
                               .setFontSize(30)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
		 	       .setColorFill(0,1,0)
			       .setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
			       .hide();

		parts.page1.subpage1.text5 = root.createChild("text")
                               .setText("")
                               .setTranslation(300, 270)
                               .setAlignment(alignment)
                               .setFontSize(30)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
			       .setDrawMode(canvas.Text.TEXT)
			       .hide();

		parts.page1.subpage1.text6 = root.createChild("text")
                               .setText("Engaged")
                               .setTranslation(160, 230)
                               .setAlignment("center-center")
                               .setFontSize(30)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
		 	       .setColorFill(0,1,0)
			       .setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
			       .hide();

		parts.page1.subpage1.text7 = root.createChild("text")
                               .setText("Disengaged")
                               .setTranslation(160, 270)
                               .setAlignment("center-center")
                               .setFontSize(30)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
		 	       .setColorFill(0,1,0)
			       .setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
			       .hide();

		#### page 1, subpage 2 (TACAN) ####
		parts.page1.subpage2.text0 = root.createChild("text")
                               .setText("")
                               .setTranslation(100, 80)
                               .setAlignment(alignment)
                               .setFontSize(20)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
			       .setDrawMode(canvas.Text.TEXT)
			       .hide();

		parts.page1.subpage2.text1 = root.createChild("text")
                               .setText("")
                               .setTranslation(400, 80)
                               .setAlignment(alignment)
                               .setFontSize(20)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
			       .setDrawMode(canvas.Text.TEXT)
			       .hide();

		parts.page1.subpage2.text2 = root.createChild("text")
                               .setText("")
                               .setTranslation(250, 250)
                               .setAlignment("center-center")
                               .setFontSize(20)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
			       .setDrawMode(canvas.Text.TEXT)
			       .hide();

		parts.page1.subpage2.text3 = root.createChild("text")
                               .setText("")
                               .setTranslation(100, 450)
                               .setAlignment(alignment)
                               .setFontSize(20)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
			       .setDrawMode(canvas.Text.TEXT)
			       .hide();

		parts.page1.subpage2.text4 = root.createChild("text")
                               .setText("")
                               .setTranslation(400, 450)
                               .setAlignment(alignment)
                               .setFontSize(20)
                               .setFont(font)
                               .set(max_width[0], max_width[1])
                               .setColor(0,1,0)
			       .setDrawMode(canvas.Text.TEXT)
			       .hide();

		parts.page1.subpage2.outer_circle = root.createChild("path")
				.setStrokeLineWidth(2)
				.moveTo(100, 250)
				.set("stroke", "rgba(0,255,0,1)")
				.arcLargeCW(150,150,0,300,0)
				.arcLargeCW(150,150,0,-300,0)
				.moveTo(250, 100)
				.vert(10)
				.moveTo(250, 400)
				.vert(-10)
				.moveTo(100, 250)
				.horiz(10)
				.moveTo(400, 250)
				.horiz(-10)
				.hide();

		parts.page1.subpage2.inner_circle = root.createChild("path")
				.setStrokeLineWidth(2)
				.moveTo(220, 250)
				.set("stroke", "rgba(0,255,0,1)")
				.arcLargeCW(30,30,0,60,0)
				.arcLargeCW(30,30,0,-60,0)
				.hide();

    	matrix = root.createChild("group");	       
   		matrix.createTransform();

		parts.page1.subpage2.arrow = matrix.createChild("path")
				.setStrokeLineWidth(2)
				.moveTo(250, 100)
				.lineTo(280, 130)
				.vert(120)
				.moveTo(220, 250)
				.vert(-120)
				.lineTo(250, 100)	
				.set("stroke", "rgba(0,255,0,1)")
				.setCenter(250, 250)			
				.hide();

		parts.page1.subpage2.hdg_mark = matrix.createChild("path")
				.setStrokeLineWidth(2)
				.moveTo(250, 100)
				.lineTo(235, 85)
				.moveTo(250, 100)
				.lineTo(265, 85)	
				.set("stroke", "rgba(0,255,0,1)")
				.setCenter(250, 250)			
				.hide();

		parts.page1.subpage2.tac_mark = matrix.createChild("path")
				.setStrokeLineWidth(2)
				.moveTo(250, 96)
				.lineTo(235, 81)
				.moveTo(250, 96)
				.lineTo(265, 81)
				.horiz(-30)	
				.set("stroke", "rgba(0,255,0,1)")
				.setCenter(250, 250)			
				.hide();
		
	#### page 2 (SMS) text ####
		
	for(index = 0; index <= 6; index += 1){
		parts.page2.subpage1["text" ~ index] = root.createChild("text")
													.setText("")
													.setTranslation(60, (index * 60) + 70)
													.setAlignment(alignment)
													.setFontSize(20)
													.setFont(font)
													.set(max_width[0], max_width[1])
													.setColor(0,1,0)
													.setColorFill(0,1,0)
													.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX)
													.hide();		
	}
		
	for(index = 0; index <= 6; index += 1){
		parts.page2.subpage1["text" ~ (index + 7)] = root.createChild("text")
														.setText("")
														.setTranslation(350, (index * 60) + 70)
														.setAlignment(alignment)
														.setFontSize(20)
														.setFont(font)
														.set(max_width[0], max_width[1])
														.setColor(0,1,0)
														.setDrawMode(canvas.Text.TEXT)
														.hide();		
	}

	#### page 4, subpage 1 (Engine) ####
				   
	for(index = 0; index <= 1; index += 1){
		parts.page4.subpage1["text" ~ index] = root.createChild("text")
													.setText("")
													.setTranslation(300, (index * 120) + 150)
													.setAlignment(alignment)
													.setFontSize(30)
													.setFont(font)
													.set(max_width[0], max_width[1])
													.setColor(0,1,0)
													.setDrawMode(canvas.Text.TEXT)
													.hide();
	}
			   
	parts.page4.subpage1.text2 = root.createChild("text")
									.setText("RPM:")
									.setTranslation(300, 110)
									.setAlignment(alignment)
									.setFontSize(30)
									.setFont(font)
									.set(max_width[0], max_width[1])
									.setColor(0,1,0)
									.setDrawMode(canvas.Text.TEXT)
									.hide();
									
	parts.page4.subpage1.text3 = root.createChild("text")
									.setText("EGT:")
									.setTranslation(300, 230)
									.setAlignment(alignment)
									.setFontSize(30)
									.setFont(font)
									.set(max_width[0], max_width[1])
									.setColor(0,1,0)
									.setDrawMode(canvas.Text.TEXT)
									.hide();

	parts.page4.subpage1.text4 = root.createChild("text")
									.setText("Idle")
									.setTranslation(100, 394)
									.setAlignment(alignment)
									.setFontSize(30)
									.setFont(font)
									.set(max_width[0], max_width[1])
									.setColor(0,1,0)
									.setDrawMode(canvas.Text.TEXT)
									.hide();
				
	parts.page4.subpage1.bar = root.createChild("path")
									.setStrokeLineWidth(2)	
									.set("stroke", "rgba(0,255,0,1)")
									.moveTo(230, 400)
									.horiz(-60)
									.vert(-300)
									.horiz(60)
									.vert(300)
									.moveTo(170, 394)
									.horiz(60)			
									.hide();
									
	parts.page4.subpage1.ind = root.createChild("path")
									.setStrokeLineWidth(2)	
									.set("stroke", "rgba(0,0,255,1)")
									.moveTo(165, 400)
									.horiz(65)
									.lineTo(240, 390)
									.vert(20)
									.lineTo(230, 400)			
									.hide();

		#### page 4, subpage 2 (Fuel) ####	
		for(index = 0; index <= 1; index += 1){
			parts.page4.subpage2["text" ~ index] = root.createChild("text")
														.setText("")
														.setTranslation((index * 190) + 110, 270)
														.setAlignment(alignment)
														.setFontSize(30)
														.setFont(font)
														.set(max_width[0], max_width[1])
														.setColor(0,1,0)
														.setDrawMode(canvas.Text.TEXT)
														.hide();
		}

		parts.page4.subpage2.text2 = root.createChild("text")
										.setText("")
										.setTranslation(250, 150)
										.setAlignment("center-center")
										.setFontSize(30)
										.setFont(font)
										.set(max_width[0], max_width[1])
										.setColor(0,1,0)
										.setDrawMode(canvas.Text.TEXT)
										.hide();
			
		parts.page4.subpage2.text3 = root.createChild("text")
										.setText("Internal tank")
										.setTranslation(250, 110)
										.setAlignment("center-center")
										.setFontSize(30)
										.setFont(font)
										.set(max_width[0], max_width[1])
										.setColor(0,1,0)
										.setDrawMode(canvas.Text.TEXT)
										.hide();

		parts.page4.subpage2.text4 = root.createChild("text")
										.setText("Droptank right")
										.setTranslation(300, 230)
										.setAlignment(alignment)
										.setFontSize(30)
										.setFont(font)
										.set(max_width[0], max_width[1])
										.setColor(0,1,0)
										.setDrawMode(canvas.Text.TEXT)
										.hide();

		parts.page4.subpage2.text5 = root.createChild("text")
										.setText("Droptank left")
										.setTranslation(110, 230)
										.setAlignment(alignment)
										.setFontSize(30)
										.setFont(font)
										.set(max_width[0], max_width[1])
										.setColor(0,1,0)
										.setDrawMode(canvas.Text.TEXT)
										.hide();
						
		#### page 4, subpage 3 (Air data) ####
		
		for(index = 0; index <= 1; index += 1){
			parts.page4.subpage3["text" ~ index] = root.createChild("text")
														.setText("")
														.setTranslation(110, (index * 120) + 150)
														.setAlignment(alignment)
														.setFontSize(30)
														.setFont(font)
														.set(max_width[0], max_width[1])
														.setColor(0,1,0)
														.setDrawMode(canvas.Text.TEXT)
														.hide();
		}
		
		for(index = 0; index <= 1; index += 1){
			parts.page4.subpage3["text" ~ (index + 2)] = root.createChild("text")
															.setText("")
															.setTranslation(300, (index * 120) + 150)
															.setAlignment(alignment)
															.setFontSize(30)
															.setFont(font)
															.set(max_width[0], max_width[1])
															.setColor(0,1,0)
															.setDrawMode(canvas.Text.TEXT)
															.hide();
		}
		
		parts.page4.subpage3.text4 = root.createChild("text")
										.setText("Pressure")
										.setTranslation(110, 110)
										.setAlignment(alignment)
										.setFontSize(30)
										.setFont(font)
										.set(max_width[0], max_width[1])
										.setColor(0,1,0)
										.setDrawMode(canvas.Text.TEXT)
										.hide();

		parts.page4.subpage3.text5 = root.createChild("text")
										.setText("Dew point")
										.setTranslation(300, 110)
										.setAlignment(alignment)
										.setFontSize(30)
										.setFont(font)
										.set(max_width[0], max_width[1])
										.setColor(0,1,0)
										.setDrawMode(canvas.Text.TEXT)
										.hide();

		parts.page4.subpage3.text6 = root.createChild("text")
										.setText("Temp")
										.setTranslation(300, 230)
										.setAlignment(alignment)
										.setFontSize(30)
										.setFont(font)
										.set(max_width[0], max_width[1])
										.setColor(0,1,0)
										.setDrawMode(canvas.Text.TEXT)
										.hide();

		parts.page4.subpage3.text7 = root.createChild("text")
										.setText("Wind speed")
										.setTranslation(110, 230)
										.setAlignment(alignment)
										.setFontSize(30)
										.setFont(font)
										.set(max_width[0], max_width[1])
										.setColor(0,1,0)
										.setDrawMode(canvas.Text.TEXT)
										.hide();
										
	if(getprop("sim/supported/canvas-mapstructure")){
		parts.page3.Map_box = root.createChild("path")
			.setStrokeLineWidth(2)	
			.set("stroke", "rgba(0,255,0,1)")
			.moveTo(70, 70)
			.horiz(360)
			.vert(360)
			.horiz(-360)
			.vert(-360)		
			.hide();
			
		# Create mission computer
		parts.page3.Map = root.createChild("map");
		parts.page3.Map.setController("Aircraft position");
		parts.page3.Map.setRange(getprop("instrumentation/hdd/mis-com/range-nm")); 
		parts.page3.Map.setTranslation(250, 215);
		parts.page3.Map.set("clip", "rect(70, 430, 430, 70)");
							
		foreach(var type; map_layers){
			type = layer(type);
			parts.page3.Map.addLayer(factory: canvas.SymbolLayer, type_arg: type.name, visible: type.vis, priority: type.zindex);
		}
		foreach(var layer; map_layers){
			parts.page3.Map.getLayer(layer).setVisible(0);	
		}
	}
}

var page1_1 = func(){
	if(parts.page1.subpage1.hidden == "true" and parts.page1.subpage1.show == "false"){
		return;
	}elsif(parts.page1.subpage1.hidden == "false" and parts.page1.subpage1.show == "false"){
		hide_page(1,1);
		parts.page1.subpage1.hidden = "true";
	}elsif(parts.page1.subpage1.hidden == "true" and parts.page1.subpage1.show == "true"){
		show_page(1,1);
		parts.page1.subpage1.hidden = "false";
	}
	if(parts.page1.subpage1.hidden == "false" and parts.page1.subpage1.show == "true"){

			parts.page1.subpage1.text1.setText(getprop("/autopilot/settings/target-altitude-ft"));
			parts.page1.subpage1.text3.setText(getprop("/autopilot/settings/target-pitch-deg"));
			parts.page1.subpage1.text5.setText(ap_1);

			parts.page1.subpage1.text0.setDrawMode(canvas.Text.TEXT);
			parts.page1.subpage1.text0.setColor(0,1,0);

			parts.page1.subpage1.text2.setDrawMode(canvas.Text.TEXT);
			parts.page1.subpage1.text2.setColor(0,1,0);

			parts.page1.subpage1.text4.setDrawMode(canvas.Text.TEXT);
			parts.page1.subpage1.text4.setColor(0,1,0);

			parts.page1.subpage1.text6.setDrawMode(canvas.Text.TEXT);
			parts.page1.subpage1.text6.setColor(0,1,0);

			parts.page1.subpage1.text7.setDrawMode(canvas.Text.TEXT);
			parts.page1.subpage1.text7.setColor(0,1,0);
	
		if(ap_2 == "altitude-hold" and getprop("/autopilot/mode") == "altitude"){

			parts.page1.subpage1.text0.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			parts.page1.subpage1.text0.setColor(0,0,0);

		}elsif(ap_2 == "pitch-hold"){

			parts.page1.subpage1.text2.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			parts.page1.subpage1.text2.setColor(0,0,0);

		}elsif(getprop("autopilot/locks/heading") == "dg-heading-hold"){

			parts.page1.subpage1.text4.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			parts.page1.subpage1.text4.setColor(0,0,0);

		}

		if(getprop("autopilot/enabled") == 1){
			parts.page1.subpage1.text6.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			parts.page1.subpage1.text6.setColor(0,0,0);		
		}else{
			parts.page1.subpage1.text7.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			parts.page1.subpage1.text7.setColor(0,0,0);	
		}
	}
}

var page1_2 = func(){
	if(parts.page1.subpage2.hidden == "true" and parts.page1.subpage2.show == "false"){
		return;
	}elsif(parts.page1.subpage2.hidden == "false" and parts.page1.subpage2.show == "false"){
		hide_page(1,2);
		parts.page1.subpage2.hidden = "true";
	}elsif(parts.page1.subpage2.hidden == "true" and parts.page1.subpage2.show == "true"){
		show_page(1,2);
		parts.page1.subpage2.hidden = "false";
	}
	if(parts.page1.subpage2.hidden == "false" and parts.page1.subpage2.show == "true"){

			parts.page1.subpage2.text3.setText(sprintf("%.2f nm", getprop("/instrumentation/tacan/indicated-distance-nm")));
			parts.page1.subpage2.text2.setText(sprintf("%3d", or_deg));
			parts.page1.subpage2.text1.setText(getprop("/instrumentation/tacan/ident"));
			parts.page1.subpage2.text0.setText(sprintf("%.2f min", getprop("/instrumentation/tacan/indicated-time-min")));

			parts.page1.subpage2.text4.setText("0" ~ getprop("/instrumentation/tacan/frequencies/selected-channel[2]") ~ getprop("/instrumentation/tacan/frequencies/selected-channel[3]") ~ getprop("/instrumentation/tacan/frequencies/selected-channel[4]"));

			parts.page1.subpage2.arrow.setRotation(or_deg * D2R);
			parts.page1.subpage2.hdg_mark.setRotation(ap_1 * D2R);
			parts.page1.subpage2.tac_mark.setRotation(getprop("/instrumentation/tacan/indicated-bearing-true-deg") * D2R);
		
	}
}

var page2 = func(){
	if(parts["page2"]["subpage1"]["hidden"] == "true" and parts["page2"]["subpage1"]["show"] == "false"){
		return;
	}
	
	if(parts["page2"]["subpage1"]["hidden"] == "false" and parts["page2"]["subpage1"]["show"] == "false"){
		hide_page(2);
		parts["page2"]["subpage1"]["hidden"] = "true";
	}
	
	if(parts["page2"]["subpage1"]["hidden"] == "true" and parts["page2"]["subpage1"]["show"] == "true"){
		show_page(2);
		parts["page2"]["subpage1"]["hidden"] = "false";
	}
	
	if(parts["page2"]["subpage1"]["hidden"] == "false" and parts["page2"]["subpage1"]["show"] == "true"){
		station_select = getprop("controls/armament/missile/current-pylon");

		parts.page2.subpage1.text0.setDrawMode(canvas.Text.TEXT).setColor(0,1,0).setText("0 " ~ getprop("/sim/weight[0]/selected"));		
		parts.page2.subpage1.text1.setDrawMode(canvas.Text.TEXT).setColor(0,1,0).setText("1 " ~ getprop("/sim/weight[1]/selected"));		
		parts.page2.subpage1.text2.setDrawMode(canvas.Text.TEXT).setColor(0,1,0).setText("2 " ~ wght_2);
		parts.page2.subpage1.text3.setDrawMode(canvas.Text.TEXT).setColor(0,1,0).setText("3 " ~ getprop("/sim/weight[3]/selected"));
		parts.page2.subpage1.text4.setDrawMode(canvas.Text.TEXT).setColor(0,1,0).setText("4 " ~ wght_4);
		parts.page2.subpage1.text5.setDrawMode(canvas.Text.TEXT).setColor(0,1,0).setText("5 " ~ getprop("/sim/weight[5]/selected"));
		parts.page2.subpage1.text6.setDrawMode(canvas.Text.TEXT).setColor(0,1,0).setText("6 " ~ getprop("/sim/weight[6]/selected"));

		if(station_select == 0){
		
			parts.page2.subpage1.text0.setColor(0,0,0).setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			
		}elsif(station_select == 1){
		
			parts.page2.subpage1.text1.setColor(0,0,0).setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			
		}elsif(station_select == 2){
		
			parts.page2.subpage1.text2.setColor(0,0,0).setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			
		}elsif(station_select == 3){
		
			parts.page2.subpage1.text3.setColor(0,0,0).setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			
		}elsif(station_select == 4){
		
			parts.page2.subpage1.text4.setColor(0,0,0).setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			
		}elsif(station_select == 5){
		
			parts.page2.subpage1.text5.setColor(0,0,0).setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			
		}elsif(station_select == 6){
		
			parts.page2.subpage1.text6.setColor(0,0,0).setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			
		}

		if(sta_0 == 0){
			parts.page2.subpage1.text7.setText("STANDBY");
		}elsif(sta_0 == 1){
			parts.page2.subpage1.text7.setText("ARMED");
		}

		if(sta_1 == 0){
			parts.page2.subpage1.text8.setText("STANDBY");
		}elsif(sta_1 == 1){
			parts.page2.subpage1.text8.setText("ARMED");
		}

		if(sta_2 == 0 and wght_2 != "ADEN 30mm Cannon"){
			parts.page2.subpage1.text9.setText("STANDBY");
		}elsif(sta_2 == 1 and wght_2 != "ADEN 30mm Cannon"){
			parts.page2.subpage1.text9.setText("ARMED");
		}

		if(sta_3 == 0){
			parts.page2.subpage1.text10.setText("STANDBY");
		}elsif(sta_3 == 1){
			parts.page2.subpage1.text10.setText("ARMED");
		}

		if(sta_4 == 0 and wght_4 != "ADEN 30mm Cannon"){
			parts.page2.subpage1.text11.setText("STANDBY");
		}elsif(sta_4 == 1 and wght_4 != "ADEN 30mm Cannon"){
			parts.page2.subpage1.text11.setText("ARMED");
		}

		if(sta_5 == 0){
			parts.page2.subpage1.text12.setText("STANDBY");
		}elsif(sta_5 == 1){
			parts.page2.subpage1.text12.setText("ARMED");
		}

		if(sta_6 == 0){
			parts.page2.subpage1.text13.setText("STANDBY");
		}elsif(sta_6 == 1){
			parts.page2.subpage1.text13.setText("ARMED");
		}

		if(wght_2 == "ADEN 30mm Cannon"){
			parts.page2.subpage1.text9.setText("RDS: " ~ getprop("ai/submodels/submodel[3]/count"));
		}

		if(wght_4 == "ADEN 30mm Cannon"){
			parts.page2.subpage1.text11.setText("RDS: " ~ getprop("ai/submodels/submodel[1]/count"));
		}
	}			
}

var page4_1 = func(){
	if(parts["page4"]["subpage1"]["hidden"] == "true" and parts["page4"]["subpage1"]["show"] == "false"){
		return;
	}
	
	if(parts["page4"]["subpage1"]["hidden"] == "false" and parts["page4"]["subpage1"]["show"] == "false"){
		hide_page(4, 1);
		parts["page4"]["subpage1"]["hidden"] = "true";
	}
	
	if(parts["page4"]["subpage1"]["hidden"] == "true" and parts["page4"]["subpage1"]["show"] == "true"){
		show_page(4, 1);
		parts["page4"]["subpage1"]["hidden"] = "false";
	}
	
	if(parts["page4"]["subpage1"]["hidden"] == "false" and parts["page4"]["subpage1"]["show"] == "true"){
		parts["page4"]["subpage1"]["ind"].setTranslation(0, -getprop("/controls/engines/engine[0]/throttle") * 300);
		parts["page4"]["subpage1"]["text1"].setText(sprintf("%.1f° C", (getprop("/engines/engine[0]/egt-degf") - 32) 
		/ 1.8));
		parts["page4"]["subpage1"]["text0"].setText(sprintf("%.1f rpm", getprop("/engines/engine[0]/rpm")));
	}
}

var page4_2 = func(){
	if(parts["page4"]["subpage2"]["hidden"] == "true" and parts["page4"]["subpage2"]["show"] == "false"){
		return;
	}
	
	if(parts["page4"]["subpage2"]["hidden"] == "false" and parts["page4"]["subpage2"]["show"] == "false"){
		hide_page(4, 2);
		parts["page4"]["subpage2"]["hidden"] = "true";
	}
	
	if(parts["page4"]["subpage2"]["hidden"] == "true" and parts["page4"]["subpage2"]["show"] == "true"){
		show_page(4, 2);
		parts["page4"]["subpage2"]["hidden"] = "false";
	}
	
	if(parts["page4"]["subpage2"]["hidden"] == "false" and parts["page4"]["subpage2"]["show"] == "true"){

			parts["page4"]["subpage2"]["text2"].setText(sprintf("%.1f", level_1));
			parts["page4"]["subpage2"]["text1"].setText(sprintf("%.1f", level_3));
			parts["page4"]["subpage2"]["text0"].setText(sprintf("%.1f", level_2));
			parts["page4"]["subpage2"]["text2"].setColor(0,1,0);
			parts["page4"]["subpage2"]["text1"].setColor(0,1,0);
			parts["page4"]["subpage2"]["text0"].setColor(0,1,0);
	
			if(level_1 < 75){
				parts["page4"]["subpage2"]["text2"].setColor(1,0,0);
			}
			
			if(level_2 < 22){
				parts["page4"]["subpage2"]["text0"].setColor(1,0,0);
			}
			
			if(level_3 < 22){
				parts["page4"]["subpage2"]["text1"].setColor(1,0,0);
			}
	}
}

var page4_3 = func(){
	if(parts["page4"]["subpage3"]["hidden"] == "true" and parts["page4"]["subpage3"]["show"] == "false"){
		return;
	}
	
	if(parts["page4"]["subpage3"]["hidden"] == "false" and parts["page4"]["subpage3"]["show"] == "false"){
		hide_page(4, 3);
		parts["page4"]["subpage3"]["hidden"] = "true";
	}
	
	if(parts["page4"]["subpage3"]["hidden"] == "true" and parts["page4"]["subpage3"]["show"] == "true"){
		show_page(4, 3);
		parts["page4"]["subpage3"]["hidden"] = "false";
	}
	
	if(parts["page4"]["subpage3"]["hidden"] == "false" and parts["page4"]["subpage3"]["show"] == "true"){	
		parts["page4"]["subpage3"]["text0"].setText(sprintf("%.1f hg", getprop("/environment/config/boundary/entry[0]/pressure-sea-level-inhg")));
		parts["page4"]["subpage3"]["text2"].setText(sprintf("%.1f° C", getprop(	"/environment/config/aloft/entry[0]/dewpoint-degc")));
		parts["page4"]["subpage3"]["text3"].setText(sprintf("%.1f° C", getprop("/environment/config/aloft/entry[0]/temperature-degc")));
		parts["page4"]["subpage3"]["text1"].setText(sprintf("%.1f kt", getprop("/environment/config/aloft/entry[0]/wind-speed-kt")));
	}
}

var help = func(){
	if(parts.nav.hidden == "true" and parts.nav.show == "false"){
		return;
	}
	
	if(parts.nav.hidden == "false" and parts.nav.show == "false"){
		hide_page("nav");
		parts.nav.hidden = "true";
	}
	
	if(parts.nav.hidden == "true" and parts.nav.show == "true"){
		show_page("nav");
		parts.nav.hidden = "false";
	}
	
	if(parts.nav.hidden == "false" and parts.nav.show == "true"){
	
		parts.nav.text_left0.setText("");
		parts.nav.text_left1.setText("");
		parts.nav.text_left2.setText("");
		
		parts.nav.text_left0.setDrawMode(canvas.Text.TEXT);
		parts.nav.text_left0.setColor(0,1,0);

		parts.nav.text_left1.setDrawMode(canvas.Text.TEXT);
		parts.nav.text_left1.setColor(0,1,0);
		
		parts.nav.text_left2.setDrawMode(canvas.Text.TEXT);
		parts.nav.text_left2.setColor(0,1,0);
			
		parts.nav.text_top0.setDrawMode(canvas.Text.TEXT);
		parts.nav.text_top0.setColor(0,1,0);

		parts.nav.text_top1.setDrawMode(canvas.Text.TEXT);
		parts.nav.text_top1.setColor(0,1,0);
		
		parts.nav.text_top2.setDrawMode(canvas.Text.TEXT);
		parts.nav.text_top2.setColor(0,1,0);

		parts.nav.text_top3.setDrawMode(canvas.Text.TEXT);
		parts.nav.text_top3.setColor(0,1,0);
	
		if(page == 0){
			parts.nav.text_left0.setText("AUT");
			parts.nav.text_left1.setText("TAC");

			if(sub_page == 0){			

				parts.nav.text_left0.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
				parts.nav.text_left0.setColor(0,0,0);

			}elsif(sub_page == 1){

				parts.nav.text_left1.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
				parts.nav.text_left1.setColor(0,0,0);

			}
			
			parts.nav.text_top0.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			parts.nav.text_top0.setColor(0,0,0);

		}elsif(page == 1){

			parts.nav.text_top1.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			parts.nav.text_top1.setColor(0,0,0);

		}elsif(page == 2){

			parts.nav.text_top2.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			parts.nav.text_top2.setColor(0,0,0);

		}elsif(page == 3){

			parts.nav.text_left0.setText("ENG");
			parts.nav.text_left1.setText("FUEL");
			parts.nav.text_left2.setText("AIR");
		
			if(sub_page == 0){			

				parts.nav.text_left0.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
				parts.nav.text_left0.setColor(0,0,0);

			}elsif(sub_page == 1){

				parts.nav.text_left1.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
				parts.nav.text_left1.setColor(0,0,0);

			}elsif(sub_page == 2){

				parts.nav.text_left2.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
				parts.nav.text_left2.setColor(0,0,0);

			}

			parts.nav.text_top3.setDrawMode(canvas.Text.TEXT + canvas.Text.FILLEDBOUNDINGBOX);
			parts.nav.text_top3.setColor(0,0,0);
		}
	}
}

var update_vars = func(){
	hdg_off 	= getprop("/environment/magnetic-variation-deg");
	ap_1 		= getprop("/autopilot/settings/heading-bug-deg");
	ap_2 		= getprop("/autopilot/locks/altitude");
	or_deg 		= getprop("/orientation/heading-deg");
	wght_2 		= getprop("/sim/weight[2]/selected");
	wght_4 		= getprop("/sim/weight[4]/selected");
	sta_0 		= getprop("/controls/armament/station[0]/armed");
	sta_1 		= getprop("/controls/armament/station[1]/armed");
	sta_2 		= getprop("/controls/armament/station[2]/armed");
	sta_3 		= getprop("/controls/armament/station[3]/armed");
	sta_4 		= getprop("/controls/armament/station[4]/armed");
	sta_5 		= getprop("/controls/armament/station[5]/armed");
	sta_6 		= getprop("/controls/armament/station[6]/armed");
	level_1		= getprop("/consumables/fuel/tank[0]/level-gal_us");
	level_2		= getprop("/consumables/fuel/tank[1]/level-gal_us");
	level_3		= getprop("/consumables/fuel/tank[2]/level-gal_us");
	page 		= getprop("/instrumentation/hdd/page");
	sub_page 	= getprop("/instrumentation/hdd/sub_page");
}

var map = func(){								
	if(getprop("sim/supported/canvas-mapstructure")){
		if(parts.page3.hidden == "true" and parts.page3.show == "false"){
			return;
		}
	
		if(parts.page3.hidden == "false" and parts.page3.show == "false"){
			parts.page3.Map_box.hide();
			foreach(var layer; map_layers){
				parts.page3.Map.getLayer(layer).setVisible(0);	
			}
			parts.page3.hidden = "true";
		}
	
		if(parts.page3.hidden == "true" and parts.page3.show == "true"){
			parts.page3.Map_box.show();
			foreach(var layer; map_layers){
				parts.page3.Map.getLayer(layer).setVisible(1);	
			}
			parts.page3.hidden = "false";
		}
	
		if(parts.page3.hidden == "false" and parts.page3.show == "true"){
			parts.page3.Map.setRange(getprop("instrumentation/hdd/mis-com/range-nm")); 
		}
	}
}

var update = func(){	

	parts.page1.subpage1.show = "false";
	parts.page1.subpage2.show = "false";
	parts.page2.subpage1.show = "false";
	parts.page4.subpage1.show = "false";
	parts.page4.subpage2.show = "false";
	parts.page4.subpage3.show = "false";
	parts.page3.show = "false";
	parts.nav.show = "false";
		
	if(getprop("instrumentation/hdd/volts") > 20){
		update_vars();		
		if(page == 0){
			if(sub_page == 0){
				parts.page1.subpage1.show = "true";
			}elsif(sub_page == 1){
				parts.page1.subpage2.show = "true";
			}
		}elsif(page == 1){
			parts.page2.subpage1.show = "true";
		}elsif(page == 2){
			parts.page3.show = "true";
		}elsif(page == 3){
			if(sub_page == 0){
				parts.page4.subpage1.show = "true";
			}elsif(sub_page == 1){
				parts.page4.subpage2.show = "true";
			}elsif(sub_page == 2){
				parts.page4.subpage3.show = "true";
			}
		}
		parts.nav.show = "true";
	}
	
	page1_1();
	page1_2();
	page2();
	map();
	page4_1();
	page4_2();
	page4_3();
	help();	
}

var hide_page = func(page, subpage = 1){
	if(page == "nav"){
		foreach(var part; keys(parts.nav)){
			if(part != "hidden" and part != "show"){
				parts.nav[part].hide();
			}
		}
	}else{
		foreach(var part; keys(parts["page" ~ page]["subpage" ~ subpage])){
			if(part != "hidden" and part != "show"){
				parts["page" ~ page]["subpage" ~ subpage][part].hide();
			}
		}
	}
}

var show_page = func(page, subpage = 1){
	if(page == "nav"){
		foreach(var part; keys(parts.nav)){
			if(part != "hidden" and part != "show"){
				parts.nav[part].show();
			}
		}
	}else{	
		foreach(var part; keys(parts["page" ~ page]["subpage" ~ subpage])){
			if(part != "hidden" and part != "show"){
				parts["page" ~ page]["subpage" ~ subpage][part].show();
			}
		}
	}
}

var layer = func(name, vis = 1, zindex = nil){
	return caller(0)[0];
}