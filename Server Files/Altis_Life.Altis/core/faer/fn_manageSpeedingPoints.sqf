/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* manageSpeedingPoints.sqf
* observes the players speeding points and handles the punishment and warnings
*
* Please feel free to use and modify it, but remember to credit the author.
*
*/

diag_log "manageSpeedingPoints";

if (isServer) exitWith {};
diag_log speeding_points;

//5 to 9 points
if (speeding_points > 4 && speeding_points < 10) then {
	hint format["Fahr vorsichtiger! Du hast bereits %1 Strafpunkte erhalten.",speeding_points];
};

//10 - 14 points
if (speeding_points > 9 && speeding_points < 15) then {
	hint format["Du hast jetzt %1 Strafpunkte. Noch %2 Punkte und deine Führerscheine werden eingezogen.",speeding_points,(15 - speeding_points)];
};

//15+
if (speeding_points > 14) then {
	//remove licenses
	license_civ_driver = false;
	license_civ_air = true;
	license_civ_truck = false;
	license_civ_boat = true;

	//wanted add
	["life_fnc_MP_packet",[0,[getPlayerUID player,name player,"907"],"life_fnc_wantedAdd",false,false]] spawn life_fnc_MP;

	hint format["Deine Führerscheine wurden eingezogen. Du stehst zudem auf der Fahndungsliste. Melde dich bei der Polizei und zahle 50000$ Strafe."];

	//reset speeding_points;
	speeding_points = 0;


};