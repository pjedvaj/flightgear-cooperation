

#On verifie et on largue
var dropTanks = func(){
        for(var i = 2 ;i < 5 ; i = i + 1 ){
           var select = getprop("sim/weight["~ i ~"]/selected");
           if(select == "droptank"){ load.dropLoad(i);}

        }
}


var clean = func() {
       
        setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);
        



        setprop("sim/weight[0]/selected", "none");
        setprop("sim/weight[1]/selected", "none");
        setprop("sim/weight[2]/selected", "none");
        setprop("sim/weight[3]/selected", "none");
		setprop("sim/weight[4]/selected", "none");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "none");
		setprop("sim/weight[7]/selected", "none");
		
		
		


}


var Ferry = func() {
        setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);


        setprop("sim/weight[0]/selected", "AIM-9L Sidewinder");
        setprop("sim/weight[1]/selected", "190 Gallon Fuel Tank");
        setprop("sim/weight[2]/selected", "none");
        setprop("sim/weight[3]/selected", "none");
		setprop("sim/weight[4]/selected", "none");
		setprop("sim/weight[5]/selected", "190 Gallon Fuel Tank");
        setprop("sim/weight[6]/selected", "AIM-9L Sidewinder");
		setprop("sim/weight[7]/selected", "Refueling boom attached");
		
		
		setprop("consumables/fuel/tank[1]/selected", 1);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 228);
        setprop("consumables/fuel/tank[1]/level-gal_us", 228);
		setprop("consumables/fuel/tank[2]/selected", 1);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 228);
        setprop("consumables/fuel/tank[2]/level-gal_us", 228);
		

}



var CAP = func(){

        setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM-9L Sidewinder");
        setprop("sim/weight[1]/selected", "190 Gallon Fuel Tank");
        setprop("sim/weight[2]/selected", "ADEN 30mm Cannon");
        setprop("sim/weight[3]/selected", "none");
		setprop("sim/weight[4]/selected", "ADEN 30mm Cannon");
		setprop("sim/weight[5]/selected", "190 Gallon Fuel Tank");
        setprop("sim/weight[6]/selected", "AIM-9L Sidewinder");
		setprop("sim/weight[7]/selected", "none");
		
       
        
		setprop("consumables/fuel/tank[1]/selected", 1);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 228);
        setprop("consumables/fuel/tank[1]/level-gal_us", 228);
		setprop("consumables/fuel/tank[2]/selected", 1);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 228);
        setprop("consumables/fuel/tank[2]/level-gal_us", 228);
       
		

}

var CAP1 = func(){

        setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM-120 AMRAAM");
        setprop("sim/weight[1]/selected", "190 Gallon Fuel Tank");
        setprop("sim/weight[2]/selected", "ADEN 30mm Cannon");
        setprop("sim/weight[3]/selected", "none");
		setprop("sim/weight[4]/selected", "ADEN 30mm Cannon");
		setprop("sim/weight[5]/selected", "190 Gallon Fuel Tank");
        setprop("sim/weight[6]/selected", "AIM-120 AMRAAM");
		setprop("sim/weight[7]/selected", "none");
		
       
        
		setprop("consumables/fuel/tank[1]/selected", 1);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 228);
        setprop("consumables/fuel/tank[1]/level-gal_us", 228);
		setprop("consumables/fuel/tank[2]/selected", 1);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 228);
        setprop("consumables/fuel/tank[2]/level-gal_us", 228);
       
		

}



var bomb = func() {
        setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);




        setprop("sim/weight[0]/selected", "500lb bomb");
        setprop("sim/weight[1]/selected", "500lb bomb");
        setprop("sim/weight[2]/selected", "ADEN 30mm Cannon");
        setprop("sim/weight[3]/selected", "500lb bomb");
		setprop("sim/weight[4]/selected", "ADEN 30mm Cannon");
		setprop("sim/weight[5]/selected", "500lb bomb");
        setprop("sim/weight[6]/selected", "500lb bomb");
		setprop("sim/weight[7]/selected", "Refueling boom attached");
		
        


}

var bombext = func() {
         setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);




        setprop("sim/weight[0]/selected", "500lb bomb");
        setprop("sim/weight[1]/selected", "190 Gallon Fuel Tank");
        setprop("sim/weight[2]/selected", "ADEN 30mm Cannon");
        setprop("sim/weight[3]/selected", "500lb bomb");
		setprop("sim/weight[4]/selected", "ADEN 30mm Cannon");
		setprop("sim/weight[5]/selected", "190 Gallon Fuel Tank");
        setprop("sim/weight[6]/selected", "500lb bomb");
		setprop("sim/weight[7]/selected", "none");
		
		setprop("consumables/fuel/tank[1]/selected", 1);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 228);
        setprop("consumables/fuel/tank[1]/level-gal_us", 228);
		setprop("consumables/fuel/tank[2]/selected", 1);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 228);
        setprop("consumables/fuel/tank[2]/level-gal_us", 228);

}

var bombheavy = func() {
        setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);




        setprop("sim/weight[0]/selected", "1000lb bomb");
        setprop("sim/weight[1]/selected", "1000lb bomb");
        setprop("sim/weight[2]/selected", "ADEN 30mm Cannon");
        setprop("sim/weight[3]/selected", "1000lb bomb");
		setprop("sim/weight[4]/selected", "ADEN 30mm Cannon");
		setprop("sim/weight[5]/selected", "1000lb bomb");
        setprop("sim/weight[6]/selected", "1000lb bomb");
		setprop("sim/weight[7]/selected", "Refueling boom attached");
		
        


}

var bombheavyext = func() {
         setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);




        setprop("sim/weight[0]/selected", "1000lb bomb");
        setprop("sim/weight[1]/selected", "190 Gallon Fuel Tank");
        setprop("sim/weight[2]/selected", "ADEN 30mm Cannon");
        setprop("sim/weight[3]/selected", "1000lb bomb");
		setprop("sim/weight[4]/selected", "ADEN 30mm Cannon");
		setprop("sim/weight[5]/selected", "190 Gallon Fuel Tank");
        setprop("sim/weight[6]/selected", "1000lb bomb");
		setprop("sim/weight[7]/selected", "none");
		
		setprop("consumables/fuel/tank[1]/selected", 1);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 228);
        setprop("consumables/fuel/tank[1]/level-gal_us", 228);
		setprop("consumables/fuel/tank[2]/selected", 1);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 228);
        setprop("consumables/fuel/tank[2]/level-gal_us", 228);

}


var rocket = func() {
         setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);




        setprop("sim/weight[0]/selected", "SNEB rocket pod");
        setprop("sim/weight[1]/selected", "SNEB rocket pod");
        setprop("sim/weight[2]/selected", "ADEN 30mm Cannon");
        setprop("sim/weight[3]/selected", "none");
		setprop("sim/weight[4]/selected", "ADEN 30mm Cannon");
		setprop("sim/weight[5]/selected", "SNEB rocket pod");
        setprop("sim/weight[6]/selected", "SNEB rocket pod");
		setprop("sim/weight[7]/selected", "Refueling boom attached");

}

var rocketext = func() {
        setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);




        setprop("sim/weight[0]/selected", "SNEB rocket pod");
        setprop("sim/weight[1]/selected", "190 Gallon Fuel Tank");
        setprop("sim/weight[2]/selected", "ADEN 30mm Cannon");
        setprop("sim/weight[3]/selected", "none");
		setprop("sim/weight[4]/selected", "ADEN 30mm Cannon");
		setprop("sim/weight[5]/selected", "190 Gallon Fuel Tank");
        setprop("sim/weight[6]/selected", "SNEB rocket pod");
		setprop("sim/weight[7]/selected", "none");
		
		setprop("consumables/fuel/tank[1]/selected", 1);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 228);
        setprop("consumables/fuel/tank[1]/level-gal_us", 228);
		setprop("consumables/fuel/tank[2]/selected", 1);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 228);
        setprop("consumables/fuel/tank[2]/level-gal_us", 228);

}

var cas = func() {
         setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);




        setprop("sim/weight[0]/selected", "500lb bomb");
        setprop("sim/weight[1]/selected", "SNEB rocket pod");
        setprop("sim/weight[2]/selected", "ADEN 30mm Cannon");
        setprop("sim/weight[3]/selected", "1000lb bomb");
		setprop("sim/weight[4]/selected", "ADEN 30mm Cannon");
		setprop("sim/weight[5]/selected", "SNEB rocket pod");
        setprop("sim/weight[6]/selected", "500lb bomb");
		setprop("sim/weight[7]/selected", "Refueling boom attached");
		
		
}





var ship = func() {
       setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);




        setprop("sim/weight[0]/selected", "AIM-9L Sidewinder");
        setprop("sim/weight[1]/selected", "Sea Eagle Anti-ship Missile");
        setprop("sim/weight[2]/selected", "ADEN 30mm Cannon");
        setprop("sim/weight[3]/selected", "none");
		setprop("sim/weight[4]/selected", "ADEN 30mm Cannon");
		setprop("sim/weight[5]/selected", "Sea Eagle Anti-ship Missile");
        setprop("sim/weight[6]/selected", "AIM-9L Sidewinder");
		setprop("sim/weight[7]/selected", "Refueling boom attached");
		
		
}

	



var radar = func() {
        setprop("consumables/fuel/tank[1]/selected", 0);
        setprop("consumables/fuel/tank[1]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[1]/level-gal_us", 0);
		setprop("consumables/fuel/tank[2]/selected", 0);
        setprop("consumables/fuel/tank[2]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[2]/level-gal_us", 0);




        setprop("sim/weight[0]/selected", "AIM-9L Sidewinder");
        setprop("sim/weight[1]/selected", "ALARM Anti-radar Missile");
        setprop("sim/weight[2]/selected", "ADEN 30mm Cannon");
        setprop("sim/weight[3]/selected", "none");
		setprop("sim/weight[4]/selected", "ADEN 30mm Cannon");
		setprop("sim/weight[5]/selected", "ALARM Anti-radar Missile");
        setprop("sim/weight[6]/selected", "AIM-9L Sidewinder");
		setprop("sim/weight[7]/selected", "Refueling boom attached");
		
		
}











