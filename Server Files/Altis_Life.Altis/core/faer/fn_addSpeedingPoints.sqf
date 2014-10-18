/* author: preller @ freudenhaus <codepreller@hirnstrom.net> for Freudenhaus Altis Life
*
* addSpeedingPoints.sqf
* adds points to the players speeding points
*
* Please feel free to use and modify it, but remember to credit the author.
*
* PARAMS:
* _this select 0: INTEGER - number of points the player receives
*
*/

//test commit

// asdasd
private ["_points"];

if (isServer) exitWith {};

//Parameter
_points = [_this,0,0,[0]] call BIS_fnc_param;

//add the speeding points
if (_points > 0) then {
	speeding_points = speeding_points + _points;
};

//call the speeding point manager. punishment will be handled there.
[] call life_fnc_manageSpeedingPoints;