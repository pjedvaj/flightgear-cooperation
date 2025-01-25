var engstartstop = func
{
if (getprop("/controls/electric/battery-switch"))
  {
    setprop("/controls/engines/engine[0]/cutoff", 1);
    setprop("/controls/engines/engine[1]/cutoff", 1);
    screen.log.write("*** Engine start 1 left ***",1,1,1);
    setprop("/controls/engines/engine[0]/starter", 1);
    settimer(func{setprop("/controls/engines/engine[0]/cutoff", 0);}, 7);
    settimer(func
    {
      setprop("/controls/engines/engine[0]/starter", 0);
      setprop("/engines/engine[0]/rpm", 2500);
      setprop("/engines/engine[0]/oilp-norm", 0.7);
    }, 28);
    settimer(func{screen.log.write("*** Engine start 2 right ***",1,1,1);}, 28);
    settimer(func{setprop("/controls/engines/engine[1]/starter", 1);}, 28);
    settimer(func{setprop("/controls/engines/engine[1]/cutoff", 0);}, 35);
    settimer(func
    {
      setprop("/controls/engines/engine[1]/starter", 0);
      setprop("/engines/engine[1]/rpm", 2500);
      setprop("/engines/engine[1]/oilp-norm", 0.7);
    }, 56);
    settimer(func{screen.log.write("*** Engines started ***",1,1,1);}, 56);
  }
else
  {
    setprop("/controls/engines/engine[0]/cutoff", 1);
    setprop("/controls/engines/engine[1]/cutoff", 1);
    setprop("/controls/engines/engine[0]/starter", 0);
    setprop("/controls/engines/engine[1]/starter", 0);
    setprop("/engines/engine[0]/rpm", 0);
    setprop("/engines/engine[0]/oilp-norm", 0);
    setprop("/engines/engine[1]/rpm", 0);
    setprop("/engines/engine[1]/oilp-norm", 0);
    screen.log.write("*** Engines shut down ***",1,1,1);
  }
}