

hint "! DETACHER VEHICULE ! \n\n Le fonctionnement est le même : \n\n Pour detacher un véhicule de ta dépanneuse, il te suffit de : \n\n 1) Pointer ta souris vers le véhicule que tu souhaites detacher.\n 2) C'est tout, rien de plus. \n\n C'est aussi simple que ca !";

waitUntil {(cursortarget isKindOf "Car") && ((cursortarget getvariable "jesuisattacher") == 1) && (player distance cursortarget) < 6}; 

	cursortarget setvariable ["jesuisattacher",0,true];
	detach cursortarget;
	player playMove "AinvPknlMstpSlayWrflDnon_healed";
	hint "Patiente, j'enlève l'attache qui ta permis le remorquage.";
	sleep 0.5;
	hint "Véhicule détaché.";
