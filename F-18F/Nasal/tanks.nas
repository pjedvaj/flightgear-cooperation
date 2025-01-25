var tank = func

{
if ((getprop("/consumables/fuel/tank[6]/level-gal_us")+getprop("/consumables/fuel/tank[10]/level-gal_us"))>10)
	{
	setprop("/consumables/fuel/tank[0]/selected",0);
	setprop("/consumables/fuel/tank[1]/selected",0);
	setprop("/consumables/fuel/tank[2]/selected",0);
	setprop("/consumables/fuel/tank[3]/selected",0);
	setprop("/consumables/fuel/tank[4]/selected",0);
	setprop("/consumables/fuel/tank[5]/selected",0);
	setprop("/consumables/fuel/tank[6]/selected",1);
	setprop("/consumables/fuel/tank[7]/selected",0);
	setprop("/consumables/fuel/tank[8]/selected",0);
	setprop("/consumables/fuel/tank[9]/selected",0);
	setprop("/consumables/fuel/tank[10]/selected",1);
	}
else
	{
	if ((getprop("/consumables/fuel/tank[7]/level-gal_us")+getprop("/consumables/fuel/tank[9]/level-gal_us"))>10)
		{
		setprop("/consumables/fuel/tank[0]/selected",0);
		setprop("/consumables/fuel/tank[1]/selected",0);
		setprop("/consumables/fuel/tank[2]/selected",0);
		setprop("/consumables/fuel/tank[3]/selected",0);
		setprop("/consumables/fuel/tank[4]/selected",0);
		setprop("/consumables/fuel/tank[5]/selected",0);
		setprop("/consumables/fuel/tank[7]/selected",1);
		setprop("/consumables/fuel/tank[8]/selected",0);
		setprop("/consumables/fuel/tank[9]/selected",1);
		}
	else
		{
		if (getprop("/consumables/fuel/tank[8]/level-gal_us")>10)
			{
			setprop("/consumables/fuel/tank[0]/selected",0);
			setprop("/consumables/fuel/tank[1]/selected",0);
			setprop("/consumables/fuel/tank[2]/selected",0);
			setprop("/consumables/fuel/tank[3]/selected",0);
			setprop("/consumables/fuel/tank[4]/selected",0);
			setprop("/consumables/fuel/tank[5]/selected",0);
			setprop("/consumables/fuel/tank[8]/selected",1);
			}
		else
			{
			if (getprop("/consumables/fuel/tank[0]/level-gal_us")>10) {setprop("/consumables/fuel/tank[0]/selected",1);}
			if (getprop("/consumables/fuel/tank[1]/level-gal_us")>10) {setprop("/consumables/fuel/tank[1]/selected",1);}
			if (getprop("/consumables/fuel/tank[2]/level-gal_us")>10) {setprop("/consumables/fuel/tank[2]/selected",1);}
			if (getprop("/consumables/fuel/tank[3]/level-gal_us")>10) {setprop("/consumables/fuel/tank[3]/selected",1);}
			if (getprop("/consumables/fuel/tank[4]/level-gal_us")>10) {setprop("/consumables/fuel/tank[4]/selected",1);}
			if (getprop("/consumables/fuel/tank[5]/level-gal_us")>10) {setprop("/consumables/fuel/tank[5]/selected",1);}
			}
		}
	}
settimer(tank, 1);
}

setlistener("sim/signals/fdm-initialized",tank);
