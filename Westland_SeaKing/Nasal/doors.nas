# =====
# Doors
# =====

Doors = {};

Doors.new = func {
   obj = { parents : [Doors],
           crew : aircraft.door.new("instrumentation/doors/crew", 4.0),
		   crewup : aircraft.door.new("instrumentation/doors/crewup", 3.0),
           cargo : aircraft.door.new("instrumentation/doors/cargo", 5.0),
		   stow : aircraft.door.new("instrumentation/doors/stow", 15.0)
         };
   return obj;
};

Doors.crewexport = func {
   me.crew.toggle();
}

Doors.crewupexport = func {
   me.crewup.toggle();
}

Doors.cargoexport = func {
   me.cargo.toggle();
}

Doors.stowexport = func {
   me.stow.toggle();
}


# ==============
# Initialization
# ==============

# objects must be here, otherwise local to init()
doorsystem = Doors.new();

