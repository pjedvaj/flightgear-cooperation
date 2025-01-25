#############################################################################
#### Helijah                                                     08-2020 ####
####                                                             03-2021 ####
####                                                             03-2022 ####
####                                                             08-2022 ####
####                                                             09-2022 ####
#### Quelques propriétés utiles                                          ####
#############################################################################

var convert = func {
  ###########################################################################
  var rpm0 = getprop("/engines/engine[0]/rpm") or 0;
  var cht0 = getprop("/engines/engine[0]/cht-degC") or 0;
  var mp0 = getprop("/engines/engine[0]/mp-osi") or 0;
  var run0 = getprop("/engines/engine[0]/running") or 0;
  var flow0 = getprop("/engines/engine[0]/fuel-flow-gph") or 0;
  var oilt0 = getprop("/engines/engine[0]/oil-temperature") or 0;
  ###########################################################################
  var rpm1 = getprop("/engines/engine[1]/rpm") or 0;
  var cht1 = getprop("/engines/engine[1]/cht-degC") or 0;
  var mp1 = getprop("/engines/engine[1]/mp-osi") or 0;
  var run1 = getprop("/engines/engine[1]/running") or 0;
  var flow1 = getprop("/engines/engine[1]/fuel-flow-gph") or 0;
  var oilt1 = getprop("/engines/engine[1]/oil-temperature") or 0;
  ###########################################################################
  var oat = getprop("/environment/temperature-degc") or 0;
  var ias = getprop("/instrumentation/airspeed-indicator/indicated-speed-kt") or 0;
  var mb0 = getprop("/engines/engine[0]/torque-ftlb") or 0;
  var mb1 = getprop("/engines/engine[1]/torque-ftlb") or 0;

  var fuel_pres0 = 0.0;
  var oil_pres0 = 0.0;
  var fuel_pres1 = 0.0;
  var oil_pres1 = 0.0;
  ###########################################################################

  if ( mp0 < 10) {
     mp0 = 10;
  }
  if ( mp1 < 10) {
     mp1 = 10;
  }

  #Engine 0
  if (run0) {
    cht0  = cht0 + (mp0 * 8 + oat - ias/3 - cht0) / 250;
    oilt0 = oilt0 +(rpm0 / 25 + oat - oilt0) / 250;
  } else {
    if ( ! cht0  ) {
      cht0 = oat;
    }
    if ( ! oilt0 ) {
      oilt0 = oat;
    }
    cht0 = cht0 + (oat - cht0)/100;
    oilt0 = oilt0 + (oat - oilt0)/100;
  }
  #Engine 1
  if (run1) {
    cht1  = cht1 + (mp1 * 8 + oat - ias/3 - cht1) / 250;
    oilt1 = oilt1 +(rpm1 / 25 + oat - oilt1) / 250;
  } else {
    if ( ! cht1  ) {
      cht1 = oat;
    }
    if ( ! oilt1 ) {
      oilt1 = oat;
    }
    cht1 = cht1 + (oat - cht1)/100;
    oilt1 = oilt1 + (oat - oilt1)/100;
  }

  #Engine 0
  if (rpm0 > 100.0) {
    fuel_pres0 = rpm0 / 100;
    oil_pres0 = rpm0 / 25;
  }
  #Engine 1
  if (rpm1 > 100.0) {
    fuel_pres1 = rpm1 / 100;
    oil_pres1 = rpm1 / 25;
  }

  setprop("/engines/engine[0]/oil-pressure-psi", oil_pres0);
  setprop("/engines/engine[0]/fuel-pressure-psi", fuel_pres0);

  setprop("/engines/engine[1]/oil-pressure-psi", oil_pres1);
  setprop("/engines/engine[1]/fuel-pressure-psi", fuel_pres1);

  setprop("/engines/engine[0]/cht-degC", cht0);
  setprop("/engines/engine[0]/oil-temperature", oilt0);

  setprop("/engines/engine[1]/cht-degC", cht1);
  setprop("/engines/engine[1]/oil-temperature", oilt1);

  setprop("/systems/electrical/amp", (rpm0 + rpm1 ) / 100 );

  ##################################################
  # Torque -> Pourcent by Helijah : Max 4094 -> 100%
  ##################################################
  var torqpourcent = mb0  * 0.0244259892526;
  setprop("/engines/engine[0]/torque-pourcent", torqpourcent);
  var smb = sprintf("%03.f", torqpourcent);

  setprop("/engines/engine[0]/Torque/unit100", chr(smb[0]));
  setprop("/engines/engine[0]/Torque/unit10", chr(smb[1]));
  setprop("/engines/engine[0]/Torque/unit1", chr(smb[2]));

  torqpourcent = mb1  * 0.0244259892526;
  setprop("/engines/engine[1]/torque-pourcent", torqpourcent);
  smb = sprintf("%03.f", torqpourcent);

  setprop("/engines/engine[1]/Torque/unit100", chr(smb[0]));
  setprop("/engines/engine[1]/Torque/unit10", chr(smb[1]));
  setprop("/engines/engine[1]/Torque/unit1", chr(smb[2]));

  ##################################################

  setprop("/engines/engine[0]/egt-degC", convertTemp(getprop("/engines/engine[0]/egt-degf")));
  setprop("/engines/engine[0]/oil-temperature-degC", getprop("/engines/engine[0]/oil-temperature"));

  setprop("/engines/engine[1]/egt-degC", convertTemp(getprop("/engines/engine[1]/egt-degf")));
  setprop("/engines/engine[1]/oil-temperature-degC", getprop("/engines/engine[1]/oil-temperature"));

  setprop("/engines/engine[0]/itt-norm", getprop("/engines/engine[0]/cht-degC") / 100);
  setprop("/engines/engine[1]/itt-norm", getprop("/engines/engine[1]/cht-degC") / 100);
}

var convertTemp = func(degF) {
  var degC = 0;
  if ( degF != nil ) {
    #print(degF);
    degC = (degF - 32) * 5/9;
  }
  return degC;
}

###  Main loop ###
var update_convert = func {
  convert();
  settimer(update_convert, 0);
}
setlistener("/sim/signals/fdm-initialized", update_convert);
