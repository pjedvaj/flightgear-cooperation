var loads=
[
  ["None",0.00],
  ["AIM-9",0.02],
  ["AIM-120",0.02],
  ["AGM-65",0.04],
  ["AGM-88",0.06],
  ["GBU-16",0.06],
  ["AGM-84",0.08],
  ["AGM-154",0.05],
  ["GBU-10",0.08],
  ["480 Gal Droptank",0.12],
  ["2xAIM-9",0.05],
  ["2xAIM-120",0.05],
  ["LITENING pod",0.10]
];

var update_drag=func
{
  var drag=0;
  for(var i = 0; i <= 10; i += 1)
  {
    var temp=getprop("/sim/multiplay/generic/string[" ~ i ~ "]");
    for(var j = 0; j <= 12; j += 1)
    {
      if ((temp)==(loads[j][0])) {drag=drag+loads[j][1];break;}
    }
  }
  setprop("/controls/flight/drag-stores", drag);
  settimer(update_drag, 1);
}

settimer(update_drag, 10);