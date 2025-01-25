

#On verifie et on largue
var dropTanks = func(){
        for(var i = 2 ;i < 5 ; i = i + 1 ){
           var select = getprop("sim/weight["~ i ~"]/selected");
           if(select == "droptank"){ load.dropLoad(i);}

        }
}


var clean = func() {
       



        setprop("sim/weight[0]/selected", "none");
        setprop("sim/weight[1]/selected", "none");
        setprop("sim/weight[2]/selected", "none");
        setprop("sim/weight[3]/selected", "none");
		setprop("sim/weight[4]/selected", "none");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "none");
		setprop("sim/weight[7]/selected", "none");
		setprop("sim/weight[8]/selected", "none");
		setprop("sim/weight[9]/selected", "none");
		setprop("sim/weight[10]/selected", "none");
		
		


}


var Ferry = func() {
        setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);


        setprop("sim/weight[0]/selected", "none");
        setprop("sim/weight[1]/selected", "L Ferrytank");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "L Ferrytank");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "R Ferrytank");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "R Ferrytank");
		setprop("sim/weight[10]/selected", "none");
		
		setprop("consumables/fuel/tank[7]/selected", 1);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 396);
        setprop("consumables/fuel/tank[7]/level-gal_us", 396);
		setprop("consumables/fuel/tank[8]/selected", 1);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 396);
        setprop("consumables/fuel/tank[8]/level-gal_us", 396);
		setprop("consumables/fuel/tank[9]/selected", 1);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 396);
        setprop("consumables/fuel/tank[9]/level-gal_us", 396);
        setprop("consumables/fuel/tank[10]/selected", 1);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 396);
        setprop("consumables/fuel/tank[910]/level-gal_us", 396);

}



var CAP = func(){

       setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



        setprop("sim/weight[0]/selected", "AIM9L");
        setprop("sim/weight[1]/selected", "none");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "L Droptank");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "R Droptank");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "none");
		setprop("sim/weight[10]/selected", "AIM9L");
		
       
        
		setprop("consumables/fuel/tank[8]/selected", 1);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[8]/level-gal_us", 240);
		setprop("consumables/fuel/tank[9]/selected", 1);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[9]/level-gal_us", 240);
       
		

}



var bomb = func() {
        setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



         setprop("sim/weight[0]/selected", "500lb");
        setprop("sim/weight[1]/selected", "MK13");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "MK13");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "MK13");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "MK13");
		setprop("sim/weight[10]/selected", "500lb");
		
        


}

var bombext = func() {
         setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



         setprop("sim/weight[0]/selected", "500lb");
        setprop("sim/weight[1]/selected", "MK13");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "L Droptank");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "R Droptank");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "MK13");
		setprop("sim/weight[10]/selected", "500lb");
		
		
		setprop("consumables/fuel/tank[8]/selected", 1);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[8]/level-gal_us", 240);
		setprop("consumables/fuel/tank[9]/selected", 1);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[9]/level-gal_us", 240);

}


var lgb = func() {
         setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



         setprop("sim/weight[0]/selected", "GBU-12");
        setprop("sim/weight[1]/selected", "GBU-12");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "GBU-12");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "GBU-12");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "GBU-12");
		setprop("sim/weight[10]/selected", "GBU-12");

		}
		
var lgbext = func() {
         setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



         setprop("sim/weight[0]/selected", "GBU-12");
        setprop("sim/weight[1]/selected", "GBU-12");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "L Droptank");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "R Droptank");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "GBU-12");
		setprop("sim/weight[10]/selected", "GBU-12");	

        setprop("consumables/fuel/tank[8]/selected", 1);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[8]/level-gal_us", 240);
		setprop("consumables/fuel/tank[9]/selected", 1);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[9]/level-gal_us", 240);	


}		
		
var lgbheavy = func() {
         setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



         setprop("sim/weight[0]/selected", "none");
        setprop("sim/weight[1]/selected", "GBU-12");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "GBU-24");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "GBU-24");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "GBU-12");
		setprop("sim/weight[10]/selected", "none");	
		
		

}

var lgbheavyext = func() {
         setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



         setprop("sim/weight[0]/selected", "none");
        setprop("sim/weight[1]/selected", "L Droptank");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "GBU-24");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "GBU-24");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "R Droptank");
		setprop("sim/weight[10]/selected", "none");	
		
		setprop("consumables/fuel/tank[7]/selected", 1);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[7]/level-gal_us", 240);
		setprop("consumables/fuel/tank[10]/selected", 1);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[10]/level-gal_us", 240);	

}


var agm = func() {
        setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



         setprop("sim/weight[0]/selected", "Brimstone");
        setprop("sim/weight[1]/selected", "Brimstone");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "Brimstone");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "Brimstone");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "Brimstone");
		setprop("sim/weight[10]/selected", "Brimstone");	

}

var agmext = func() {
        setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



         setprop("sim/weight[0]/selected", "Brimstone");
        setprop("sim/weight[1]/selected", "Brimstone");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "L Droptank");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "R Droptank");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "Brimstone");
		setprop("sim/weight[10]/selected", "Brimstone");	
		
		 setprop("consumables/fuel/tank[8]/selected", 1);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[8]/level-gal_us", 240);
		setprop("consumables/fuel/tank[9]/selected", 1);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[9]/level-gal_us", 240);	

}

var cas = func() {
        setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



         setprop("sim/weight[0]/selected", "Brimstone");
        setprop("sim/weight[1]/selected", "MK13");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "GBU-12");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "GBU-12");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "MK13");
		setprop("sim/weight[10]/selected", "Brimstone");	
		
		
}

var casext = func() {
        setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



         setprop("sim/weight[0]/selected", "Brimstone");
        setprop("sim/weight[1]/selected", "GBU-12");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "L Droptank");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "R Droptank");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "GBU-12");
		setprop("sim/weight[10]/selected", "Brimstone");	
		
		 setprop("consumables/fuel/tank[8]/selected", 1);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[8]/level-gal_us", 240);
		setprop("consumables/fuel/tank[9]/selected", 1);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[9]/level-gal_us", 240);	

}

var strike = func() {
        setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



         setprop("sim/weight[0]/selected", "none");
        setprop("sim/weight[1]/selected", "BL755");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "BL755");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "BL755");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "BL755");
		setprop("sim/weight[10]/selected", "none");	
		
		
}

var strikeext = func() {
        setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);



         setprop("sim/weight[0]/selected", "none");
        setprop("sim/weight[1]/selected", "BL755");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "L Droptank");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "none");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "R Droptank");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "BL755");
		setprop("sim/weight[10]/selected", "none");	
		
		 setprop("consumables/fuel/tank[8]/selected", 1);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[8]/level-gal_us", 240);
		setprop("consumables/fuel/tank[9]/selected", 1);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[9]/level-gal_us", 240);	

}

var recon = func() {
        setprop("consumables/fuel/tank[7]/selected", 0);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[7]/level-gal_us", 0);
		setprop("consumables/fuel/tank[8]/selected", 0);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[8]/level-gal_us", 0);
        setprop("consumables/fuel/tank[9]/selected", 0);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[9]/level-gal_us", 0);
        setprop("consumables/fuel/tank[10]/selected", 0);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 0);
        setprop("consumables/fuel/tank[10]/level-gal_us", 0);


        setprop("sim/weight[0]/selected", "none");
        setprop("sim/weight[1]/selected", "L Droptank");
        setprop("sim/weight[2]/selected", "AIM9L");
        setprop("sim/weight[3]/selected", "L Droptank");
		setprop("sim/weight[4]/selected", "Fin");
		setprop("sim/weight[5]/selected", "Camera Pod");
        setprop("sim/weight[6]/selected", "Fin");
		setprop("sim/weight[7]/selected", "R Droptank");
		setprop("sim/weight[8]/selected", "AIM9L");
		setprop("sim/weight[9]/selected", "R Droptank");
		setprop("sim/weight[10]/selected", "none");
		
		setprop("consumables/fuel/tank[7]/selected", 1);
        setprop("consumables/fuel/tank[7]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[7]/level-gal_us", 240);
		setprop("consumables/fuel/tank[8]/selected", 1);
        setprop("consumables/fuel/tank[8]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[8]/level-gal_us", 240);
		setprop("consumables/fuel/tank[9]/selected", 1);
        setprop("consumables/fuel/tank[9]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[9]/level-gal_us", 240);
        setprop("consumables/fuel/tank[10]/selected", 1);
        setprop("consumables/fuel/tank[10]/capacity-gal_us", 240);
        setprop("consumables/fuel/tank[910]/level-gal_us", 240);

}



#La boite de dialogue
#var ext_loads_dlg = gui.Dialog.new("dialog","Aircraft/F-15-ACTIVE/Dialogs/external-loads.xml");

#Begining of the dropable function.
#It has to be simplified and generic made
#Need to know how to make a table
dropLoad = func (number) {
          var select = getprop("sim/weight["~ number ~"]/selected");
          if(select != "none"){
                if(select == "Droptank"){
                     tank_submodel(number,select);
                     setprop("consumables/fuel/tank["~ number ~"]/selected", 0);
                     settimer(func load.dropLoad_stop(number),2);
                     setprop("controls/armament/station["~ number ~"]/release", 1);
                     setprop("sim/weight["~ number ~"]/selected", "none");
                     setprop("sim/weight["~ number ~"]/weight-lb", 0);
                }else{
                     load.dropMissile(number);
                     settimer(func load.dropLoad_stop(number),0.5);
                }


           }

           
}


#Need to be changed
dropLoad_stop = func(n) {     
         setprop("controls/armament/station["~ n ~"]/release", 0);
}





dropMissile = func (number) { 

  var target  = hud.closest_target();
  if(target == nil){ return;}

  
        #print(typeMissile);


          var typeMissile = getprop("sim/weight["~ number ~"]/selected");
          missile.Loading_missile(typeMissile);
          Current_missile = missile.MISSILE.new(number);
          Current_missile.status = 0;
          Current_missile.search(target);             
          Current_missile.release();
          setprop("controls/armament/station["~ number ~"]/release", 1);
          setprop("sim/weight["~ number ~"]/selected", "none");
          setprop("sim/weight["~ number ~"]/weight-lb", 0);
     

}

#var tank_submodel = func (pylone, select){

        #Drop Tanks
       # if(pylone == 1 and select == "Droptank"){ setprop("controls/armament/station[1]/release-droptank", 1);}
       # if(pylone == 4 and select == "Droptank"){ setprop("controls/armament/station[5]/release-droptank", 1);}
       #if(pylone == 7 and select == "Droptank"){ setprop("controls/armament/station[9]/release-droptank", 1);}







