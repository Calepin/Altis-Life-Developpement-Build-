_veh = _this select 0;

if(side player == civilian) then
{
	waitUntil {(player in _veh)};
	if (player in _veh) then
	{
		_start = time;
		hint "Vous gagnez de l'argent temps que vous êtes dans votre véhicule et que vous bougez !";
		waitUntil {!(player in _veh)};
		_finish = time - _start;
		_pay = ceil(_finish * 20.00);
		_time = ceil(_finish / 60);	
		life_atmcash = life_atmcash + _pay,true;
		hint format['Vous avez gagné %1 euros grace à votre tournée qui a durée %2 minutes.',_pay,_time];
		if (alive _veh) then {[_veh] execvm "core\depanneur\fn_remorquage_gagner_argent.sqf";};
	};
}else
{
sleep 4;
hint "Vous devez être un civil pour gagner de l'argent avec le remorquage !";
};
 