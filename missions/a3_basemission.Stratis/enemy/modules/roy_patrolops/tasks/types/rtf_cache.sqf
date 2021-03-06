diag_log [diag_frameno, diag_ticktime, time, "#PO2 TASK: Destroy 3 Caches Initialise"];

private["_location","_position","_taskid","_cachetype","_cache0","_cache1","_cache2","_cachelocs","_hideout","_house","_buildingpos","_marker","_troops","_b","_stance","_grp","_car_type","_vehgrp"];

/*--------------------CREATE LOCATION---------------------------------*/

	_location = [["towns"]] call mps_getNewLocation;
	_position = [(position _location) select 0,(position _location) select 1, 0];
	_taskid = format["%1%2%3",round (_position select 0),round (_position select 1),(round random 999)];

/*--------------------CREATE TARGETS----------------------------------*/

	_cachetype = "Box_East_WpsSpecial_F";
	if(mps_oa) then {_cachetype = "Box_East_WpsSpecial_F"};
	_cache0 = _cachetype createvehicle (_position);
	_cache1 = _cachetype createvehicle (_position);
	_cache2 = _cachetype createvehicle (_position);

/*--------------------MOVE TARGET TO LOCATION-------------------------*/

	_cachelocs = [_position,300] call mps_getEnterableHouses;

	_hideout = [];

	for "_i" from 1 to 10000 do {
		_house = _cachelocs call mps_getRandomElement;
		_cachelocs = _cachelocs - [_house];
		_buildingpos = round random (_house select 1);
		_house = _house select 0;
		_hideout = (_house buildingPos _buildingpos);
		if(count (_hideout - [0]) > 0) exitWith{};
		_hideout = [(getPos _cache0 select 0) + _size - random (2*_size),(getPos _cache0 select 1) + _size - random (2*_size),0];
	};
	_cache0 setPos _hideout;

	for "_i" from 1 to 10000 do {
		_house = _cachelocs call mps_getRandomElement;
		_cachelocs = _cachelocs - [_house];
		_buildingpos = round random (_house select 1);
		_house = _house select 0;
		_hideout = (_house buildingPos _buildingpos);
		if(count (_hideout - [0]) > 0) exitWith{};
		_hideout = [(getPos _cache1 select 0) + _size - random (2*_size),(getPos _cache1 select 1) + _size - random (2*_size),0];
	};
	_cache1 setPos _hideout;

	for "_i" from 1 to 10000 do {
		_house = _cachelocs call mps_getRandomElement;
		_cachelocs = _cachelocs - [_house];
		_buildingpos = round random (_house select 1);
		_house = _house select 0;
		_hideout = (_house buildingPos _buildingpos);
		if(count (_hideout - [0]) > 0) exitWith{};
		_hideout = [(getPos _cache2 select 0) + _size - random (2*_size),(getPos _cache2 select 1) + _size - random (2*_size),0];
	};
	_cache2 setPos _hideout;

	if(mps_debug) then {
		_marker = createMarkerLocal [format["Debug0%1",_taskid],position _cache0]; _marker setMarkerTypeLocal "mil_dot"; _marker setMarkerColorLocal "ColorGreen"; sleep 1;
		_marker = createMarkerLocal [format["Debug1%1",_taskid],position _cache1]; _marker setMarkerTypeLocal "mil_dot"; _marker setMarkerColorLocal "ColorGreen"; sleep 1;
		_marker = createMarkerLocal [format["Debug2%1",_taskid],position _cache2]; _marker setMarkerTypeLocal "mil_dot"; _marker setMarkerColorLocal "ColorGreen";
	};

/*--------------------CREATE ENEMY AT LOCATION------------------------*/

	_troops = [];
	_b = (3 max (round (random (playersNumber (SIDE_A select 0) / 3)))) * mps_mission_factor;

	for "_i" from 1 to _b do {
		_stance = ["patrol","hide"] call mps_getRandomElement;
		_grp = [_position,"INF",(5 + random 5),50,_stance ] call CREATE_OPFOR_SQUAD;
		if(random 1 > 0.5) then {
			_car_type = (mps_opfor_car+mps_opfor_apc+mps_opfor_armor) call mps_getRandomElement;
			_vehgrp = [_car_type,(SIDE_B select 0),_position,100] call mps_spawn_vehicle;
			sleep 1;
			(units _vehgrp) joinSilent _grp;
		};
		_troops = _troops + (units _grp);
	};

	for "_i" from 1 to 3 do { [_position] call CREATE_OPFOR_STATIC; };

	if( playersNumber (SIDE_A select 0) > (4 + random 4) ) then { [_position] spawn CREATE_OPFOR_TOWER; };
	if( playersNumber (SIDE_A select 0) > (6 + random 4) ) then { [_position] spawn CREATE_OPFOR_SNIPERS; };

/*--------------------CREATE INTEL, RESET DEATHCOUNT---------------------------------*/

	mps_civilian_intel = [ _cache0,_cache1,_cache2 ]; publicVariable "mps_civilian_intel";
	mps_mission_deathcount = mps_mission_deathlimit; publicVariable "mps_mission_deathcount";

/*--------------------CREATE TASK OBJECTIVE---------------------------------*/

	[format["TASK%1",_taskid],
		"Destroy Weapons Cache",
		format["Enemy have stored 3 small weapons caches in %1. Locate and destroy them.", text _location],
		true,
		[format["MARK%1",_taskid],(_position),"hd_objective","ColorRed"," Target"],
		"created",
		_position
	] call mps_tasks_add;

/*--------------------MISSION CRITERIA TO PASS---------------------------------*/

	While { { damage _x < 1 || alive _x } count [_cache0,_cache1,_cache2] > 0 && mps_mission_deathcount > 0 } do { sleep 5 };

/*--------------------CHECK IF SUCCESSFUL---------------------------------*/

	if( mps_mission_deathcount > 0) then {
		[format["TASK%1",_taskid],"succeeded"] call mps_tasks_upd;
	}else{
		[format["TASK%1",_taskid],"failed"] call mps_tasks_upd;
	};

/*--------------------CLEAN UP AFTER MISSION---------------------------------*/

	{ deleteVehicle _x; }forEach [_cache0,_cache1,_cache2];

	[_troops,_position] spawn {
		while{ {isPlayer _x} count nearestObjects[(_this select 1),["CAManBase","LandVehicle","Plane"],1500] > 0} do { sleep 10 };
		{ _x setDamage 1; }forEach (_this select 0);
	};

/*--------------------RESET INTEL---------------------------------*/

	mps_civilian_intel = []; publicVariable "mps_civilian_intel";

/*--------------------FORCE SCRIPT END---------------------------------*/

if(true)exitWith{};