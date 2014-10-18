/*
	File: fn_setupActions.sqf
	
	Description:
	Master addAction file handler for all client-based actions.
*/
switch (playerSide) do
{
	case civilian:
	{
		//Drop fishing net
		life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		//Rob person
		life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
        //Adac Scripts In Case Civilian
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Reparer le vehicule proche</t>",life_fnc_serviceTruck,"",99,false,false,"",' (typeOf (vehicle player) == "B_Heli_Light_01_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Reparer le vehicule proche</t>",life_fnc_serviceTruck,"",99,false,false,"",' (typeOf (vehicle player) == "O_Heli_Light_02_unarmed_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Reparer le vehicule proche</t>",life_fnc_serviceTruck,"",99,false,false,"",' (typeOf (vehicle player) == "B_Truck_01_mover_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];
life_actions = life_actions + [player addAction["<t color='#0000FF'>Mettre le vehicule en fourriere</t>",life_fnc_dep_impound,"",0,false,false,"",' (typeOf (vehicle player) == "B_Truck_01_mover_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Remorquer le vehicule</t>","scripts\adac\fn_attacher.sqf",[],7,true,true,"",' (typeOf (vehicle player) == "B_Truck_01_mover_F") && ((vehicle player animationPhase "HideServices") == 0) && (_target distance _this) < 12 ']];
life_actions = life_actions + [player addAction["<t color='#0000FF'>Detacher le vehicule</t>","scripts\adac\fn_detacher.sqf",[],7,true,true,"",' (typeOf (vehicle player) == "B_Truck_01_mover_F") && ((vehicle player animationPhase "HideServices") == 0) && (_target distance _this) < 12 ']];
life_actions = life_actions + [player addAction["<t color='#FF0000'>Reparer le vehicule proche</t>",life_fnc_serviceTruck,"",99,false,false,"",' (typeOf (vehicle player) == "B_G_Offroad_01_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];
life_actions = life_actions + [player addAction["<t color='#0000FF'>Mettre le vehicule en fourriere</t>",life_fnc_dep_impound,"",0,false,false,"",' (typeOf (vehicle player) == "B_G_Offroad_01_F") && ((vehicle player animationPhase "HideServices") == 0) && ((vehicle player) in life_vehicles) && (speed vehicle player) < 1 ']];
                                                
	};
};