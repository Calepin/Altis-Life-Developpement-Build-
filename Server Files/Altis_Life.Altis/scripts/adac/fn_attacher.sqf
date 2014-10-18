
hint "! ATTACHER VEHICULE ! \n\n Le fonctionnement est simple : \n\n Pour attacher un véhicule à ta dépanneuse, il te suffit de : \n\n 1) Pointer ta souris vers le véhicule que tu souhaites dépanner.\n 2) Ensuite de (re)pointer ta souris vers ta dépanneuse. \n\n Et te voila maintenant entrain de remorquer ;) \n\n\n Attention, tu ne peux remorquer que des véhicules LEGERS et à moins de 4 mètres de ta dépanneuse !";

waitUntil {(cursortarget isKindOf "Car") && !(cursortarget isKindOf "B_Truck_01_mover_F") && (player distance cursortarget) < 6}; 

_levehiculearemorquer = cursortarget;
_type = typeOf _levehiculearemorquer;
cursortarget setvariable ["jesuisattacher",1,true];

hint format['Ok, véhicule de type %1 à bien été selectionné !',_type];

waitUntil {(cursortarget isKindOf "B_Truck_01_mover_F") && (player distance cursortarget) < 4}; 
_madepanneuse = cursortarget;

hint "Patientes, j'attache ton véhicule";

player playMove "AinvPknlMstpSlayWrflDnon_healed";

_levehiculearemorquer attachTo [_madepanneuse,[0,-6,1]];


hint format['Le véhicule de type %1 à bien été attacher à ta dépanneuse !',_type];

