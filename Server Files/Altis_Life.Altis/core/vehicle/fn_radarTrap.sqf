/* author: preller @ freudenhaus <codepreller@gmail.com> & alex aka |BB|Stone
* for Freudenhaus Altis Life
*
* radarTrap.sqf
* a simple script to check if a vehicle is faster then the legal maximum limit. 
*
* Please feel free to use and modify it, but remember to credit the author.
*
* PARAMS:
* _this select 0: OBJECT - the npc radar trap
* _this select 1: INTEGER - defines the speed limit the target gets trapped
*
*/
private["_RADAR_RADIUS","_SLEEP_TIME","_speed_limit","_DEBUG_MODE","_trapped","_targets","_trappedTime","_tmpI","_vehicle_speed","_driver","_player","_radar"];

//params
_radar = _this select 0;
_speed_limit = _this select 1;  //Geschwindigkeitslimit

//const
_RADAR_RADIUS = 30;  //radius in meter
_SLEEP_TIME = 17; //

_DEBUG_MODE = false;

//var
_targets = [[]];
_trapped = [];
_trappedTime = [];

if (!isServer) exitWith {};
	
while {true} do {
	_targets = ((position _radar) nearEntities ["Car",_RADAR_RADIUS]);
	
	//Heartbeat
	if (_DEBUG_MODE) then {
		_radar globalChat ".";
	};
	
	//Clean the trapped list
	_tmpI = 0;
	{
		if ((time - _x) > _SLEEP_TIME) then {
			_trappedTime set [_tmpI,0];
			_trapped set [_tmpI,0];
		};
		_tmpI = + 1;
	}forEach _trappedTime;
	
	if ((0 in _trapped) || (0 in _trappedTime)) then {
		_trapped = _trapped - [0];
		_trappedTime = _trappedTime - [0];
	};
	
	//check every _targets speed and handle
	{
		_vehicle_speed = speed _x;		

		if (_vehicle_speed > _speed_limit) then {
			_driver = driver _x;

			//check faction. west = police
			if (side _driver != west) then {
													
				if ( !((name _driver) in _trapped)) then {
					//handle speeding
					_tmpTime = time;
					
					diag_log "Displaying Radar Flash";
					{
						//flash, flash, bling, bling
						[[],"life_fnc_radarFlashnSound",_x,false] spawn life_fnc_MP;
					} forEach (crew _x);
					
					diag_log "Radar Flash finished";
					
					//no, no, no, dont punish them right now
					/* if (_speed_limit > 70) then {
					*	["life_fnc_MP_packet",[0,[getPlayerUID _driver,name _driver,"905"],"life_fnc_wantedAdd",false,false]] spawn life_fnc_MPexec;
					* } else {
					*	["life_fnc_MP_packet",[0,[getPlayerUID _driver,name _driver,"900"],"life_fnc_wantedAdd",false,false]] spawn life_fnc_MPexec;
					* };
					*/

					[[1],"life_fnc_addSpeedingPoints",_driver,false] spawn life_fnc_MP;

					_trapped = _trapped + [(name _driver)];
					_trappedTime = _trappedTime + [_tmpTime];
				};
				
			//cop
			} else {
				

			};
		};
	} forEach _targets;
	sleep 0.5;
};
	