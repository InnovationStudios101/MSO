private ["_spawnhouses","_housecount","_positions","_position","_t","_m","_cqb_spawn_intensity","_BuildingTypeStrategic","_base1","_base2","_BL0","_BL1","_BL2","_BL3","_BL4","_BL5","_BL6","_BL7","_BL8","_BL9"];

_Btype = _this select 0;

_center = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_spawnhouses = [_center,CRB_LOC_DIST] call MSO_fnc_getEnterableHouses;

_base1 = markerpos "ammo_1"; if (str(_base1) == "[0,0,0]") then {_base1 = markerpos "respawn_west"};
_base2 = markerpos "ammo"; if (str(_base2) == "[0,0,0]") then {_base2 = markerpos "respawn_west"};

_BL0 = markerpos "CQB_BL0"; if (str(_BL0) == "[0,0,0]") then {_BL0 = nil};
_BL1 = markerpos "CQB_BL1"; if (str(_BL1) == "[0,0,0]") then {_BL1 = nil};
_BL2 = markerpos "CQB_BL2"; if (str(_BL2) == "[0,0,0]") then {_BL2 = nil};
_BL3 = markerpos "CQB_BL3"; if (str(_BL3) == "[0,0,0]") then {_BL3 = nil};
_BL4 = markerpos "CQB_BL4"; if (str(_BL4) == "[0,0,0]") then {_BL4 = nil};
_BL5 = markerpos "CQB_BL5"; if (str(_BL5) == "[0,0,0]") then {_BL5 = nil};
_BL6 = markerpos "CQB_BL6"; if (str(_BL6) == "[0,0,0]") then {_BL6 = nil};
_BL7 = markerpos "CQB_BL7"; if (str(_BL7) == "[0,0,0]") then {_BL7 = nil};
_BL8 = markerpos "CQB_BL8"; if (str(_BL8) == "[0,0,0]") then {_BL8 = nil};
_BL9 = markerpos "CQB_BL9"; if (str(_BL9) == "[0,0,0]") then {_BL9 = nil};

if (isnil "rmm_ep_safe_zone") then {rmm_ep_safe_zone = 500};
if (isnil "cqb_blacklistdist") then {cqb_blacklistdist = 500};

_positions = [];
if (_Btype == "strategic") then {
	_cqb_spawn_intensity = 0.3;
};
if (_Btype == "regular") then {
	_cqb_spawn_intensity = 1 - (cqb_spawn / 100);
};

_BuildingTypeStrategic = [
"Land_A_TVTower_Base",
"Land_Dam_ConcP_20",
"Land_Ind_Expedice_1",
"Land_Ind_SiloVelke_02",
"Land_Mil_Barracks",
"Land_Mil_Barracks_i",
"Land_Mil_Barracks_L",
"Land_Mil_Guardhouse",
"Land_Mil_House",
"Land_Fort_Watchtower",
"Land_Vysilac_FM",
"Land_SS_hangar",
"Land_telek1",
"Land_vez",
"Land_A_FuelStation_Shed",
"Land_watertower1",
"Land_trafostanica_velka",
"Land_Ind_Oil_Tower_EP1",
"Land_A_Villa_EP1",
"Land_Mil_Barracks_EP1",
"Land_Mil_Barracks_i_EP1",
"Land_Mil_Barracks_L_EP1",
"Land_Barrack2",
"Land_fortified_nest_small_EP1",
"Land_fortified_nest_big_EP1",
"Land_Fort_Watchtower_EP1",
"Land_Ind_PowerStation_EP1",
"Land_Ind_PowerStation",

//A3
"Land_Cargo_Patrol_V1_F",
"Land_MilOffices_V1_F",
"Land_dp_smallFactory_F",
"Land_Cargo_HQ_V1_F",
"Land_Radar_F",
"Land_Airport_Tower_F",
"Land_TentHangar_V1_F"
];

switch (worldName) do {		
        case "Panthera2": {
			_BuildingTypeStrategic = _BuildingTypeStrategic + ["land_posed","Land_army_hut3_long_int","land_army_hut2_int","land_army_hut_int","Land_fuelstation_army","Land_Hangar_2"];
			if (_Btype == "strategic") then {_cqb_spawn_intensity = 0.6};
		};
		case "lingor": {
			_BuildingTypeStrategic = _BuildingTypeStrategic + ["land_posed","Land_army_hut3_long_int","land_army_hut2_int","land_army_hut_int","Land_fuelstation_army","Land_Hangar_2"];
			if (_Btype == "strategic") then {_cqb_spawn_intensity = 0.6};
		};
};

{
    if (
        (random 1 > _cqb_spawn_intensity) &&
        (((position (_x select 0)) distance _base1) > rmm_ep_safe_zone) &&
        (((position (_x select 0)) distance _base2) > rmm_ep_safe_zone) &&
        
        if !(isnil "_BL0") then {(((position (_x select 0)) distance _BL0) > cqb_blacklistdist)} else {true} &&
        if !(isnil "_BL1") then {(((position (_x select 0)) distance _BL1) > cqb_blacklistdist)} else {true} &&
        if !(isnil "_BL2") then {(((position (_x select 0)) distance _BL2) > cqb_blacklistdist)} else {true} &&
        if !(isnil "_BL3") then {(((position (_x select 0)) distance _BL3) > cqb_blacklistdist)} else {true} &&
        if !(isnil "_BL4") then {(((position (_x select 0)) distance _BL4) > cqb_blacklistdist)} else {true} &&
        if !(isnil "_BL5") then {(((position (_x select 0)) distance _BL5) > cqb_blacklistdist)} else {true} &&
        if !(isnil "_BL6") then {(((position (_x select 0)) distance _BL6) > cqb_blacklistdist)} else {true} &&
        if !(isnil "_BL7") then {(((position (_x select 0)) distance _BL7) > cqb_blacklistdist)} else {true} &&
        if !(isnil "_BL8") then {(((position (_x select 0)) distance _BL8) > cqb_blacklistdist)} else {true} &&
        if !(isnil "_BL9") then {(((position (_x select 0)) distance _BL9) > cqb_blacklistdist)} else {true}
       ) then {

			if (_Btype == "strategic") then {
				if (typeof (_x select 0) in _BuildingTypeStrategic) then {
    				_positions set [count _positions,_x];
				};
			};
			
			if (_Btype == "regular") then {
				if !(typeof (_x select 0) in _BuildingTypeStrategic) then {
					_positions set [count _positions,_x];
				};
			};
    };
} foreach _spawnhouses;

_positions;