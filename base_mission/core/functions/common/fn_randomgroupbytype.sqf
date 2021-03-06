private ["_pos","_side","_type","_i","_group","_unit","_leader","_unittype","_newpos"];

_pos = _this select 0;
_side = _this select 1;
_type = _this select 2;

waitUntil {!isNil "bis_fnc_init"};

_group = creategroup _side;

switch(_type) do {
    case "Infantry": {_type = "Man"};
    case "Motorized": {_type = "Car"};
    case "Mechanized": {_type = "Car"};
    case "Armored": {_type = "Tank"};
    case "Air": {_type = "Air"};
    default {_type = "Man"};
};

if (_type == "Man") then {
	_newpos = [(_pos select 0),(_pos select 1),0];
    for "_i" from 0 to (4 + floor(random 2)) do {
		//set some random position
        _newpos = [(_newpos select 0) + 5,(_newpos select 1) + 5,0];
                                         
		//lookup unitclass and default if nothing defined
        _unittype = [0, MSO_FACTIONS,_type] call mso_core_fnc_findVehicleType;
        if (count _unittype < 1) then {
			_unittype = [0, MSO_FACTIONS,"Man"] call mso_core_fnc_findVehicleType;
		};
                                                
        //create the units (first is leader)
        _unittype = _unittype call BIS_fnc_selectRandom;
        if (_i < 1) then {
        	_leader = _group createUnit [_unittype,_newpos,[],0,"NONE"];
        	} else {
		_unit = _group createUnit [_unittype,_newpos,[],0,"NONE"];
        };
    };
} else {
    _newpos = [(_pos select 0),(_pos select 1),0];
	for "_i" from 0 to (2 + floor(random 3)) do {
		//set some random position
        _newpos = [(_newpos select 0) + 7,(_newpos select 1) + 7,0];
                
        //lookup unitclass and default if nothing defined
        _unittype = [0, MSO_FACTIONS,_type] call mso_core_fnc_findVehicleType;
        
        if (count _unittype < 1) then {
        		_unittype = ([0, MSO_FACTIONS,"Man"] call mso_core_fnc_findVehicleType) call BIS_fnc_selectRandom;  
                _unit = _group createUnit [_unittype,_newpos,[],0,"NONE"];
        	} else {
				//else spawn the units
                if (_type == "Air") then {_newpos = [(_newpos select 0)+ floor(random 150),(_newpos select 1)+ floor(random 150),1000]};
                _unittype = _unittype call BIS_fnc_selectRandom;
                
                if (_i < 1) then {
                    	_leader = [_newpos, 0, _unittype, _group] call BIS_fnc_spawnVehicle;
         			} else {
         				_unit = [_newpos, 0, _unittype, _group] call BIS_fnc_spawnVehicle;
                };
		};
	};
};
        
_leader = leader _group;
diag_log format["MSO-%1 group with name %4 and %2 units created at %3.", time, count units _group, _pos, _group];
_group;
                   