// Written by BON_IF
// Adpated by EightySix

private ["_Grp","_type","_side","_vec","_unit","_pos","_radius","_count","_spawnpos"]; 

_type = _this select 0;
_side = _this select 1;
_pos = _this select 2;
_radius = _this select 3;

_x = _pos select 0;
_y = _pos select 1;

_Grp = createGroup (SIDE_B select 0);

_spawnpos = [0,0];
_count = 0;
While{(surfaceIsWater _spawnpos || count (_spawnpos - [0]) == 0) && _count < 100} do {
	_spawnpos = [_x + _radius - random (_radius*2), _y + _radius - random (_radius*2)];
	_count = _count + 1;
};
if(_count == 100) exitWith{_Grp};
_spawnpos set [2,0];

_vec = _type createVehicle _spawnpos;

_crewtype = getArray (configFile >> "CfgVehicles" >> _type >> "typicalCargo");
_max = (count _crewtype)-1;

if(count(_crewtype - ["Soldier"])==0) then{
	if(_side==EAST) then{_crewtype = ["O_helipilot_F"]}
	else {_crewtype = ["B_Helipilot_F"]};
};

if((_vec emptyPositions "commander") > 0) then {
	_unit = _grp createUnit [_crewtype select (round random _max), _pos, [], _radius, "NONE"];
	_unit moveinCommander _vec;
};

if((_vec emptyPositions "gunner") > 0) then {
	_unit = _grp createUnit [_crewtype select (round random _max), _pos, [], _radius, "NONE"];
	_unit moveinGunner _vec;
};		

if((_vec emptyPositions "driver") > 0) then {
	_unit = _grp createUnit [_crewtype select (round random _max), _pos, [], _radius, "NONE"];
	_unit moveinDriver _vec;
};

// Cleanup

[_Grp,_vec] spawn {
	_grp = _this select 0;
	_units = units _grp;
	_veh = _this select 1;

	_vehpos = position _veh;

	While{ damage _veh < 1 && ({alive _x} count _units) > 0 } do { sleep 20; };

	while{ { alive _x && side _x == (SIDE_A select 0) } count nearestObjects[_vehpos,["CAManBase","LandVehicle"],800] > 0 } do { sleep 15; };

	deleteVehicle _veh;

	{
		hidebody _x;
		sleep 3;
		deleteVehicle _x;
	} foreach _units;

	sleep 5;

	deleteGroup _grp;
};

_Grp