if(isNil "mps_civilian_intel") then {mps_civilian_intel = ["The civilians don't appear to be able to help"]};
if(count mps_civilian_intel == 0) then {mps_civilian_intel = ["The civilians don't appear to be able to help"]};

_person = (_this select 0);

_badresponse = [
	"This person is confused about what your asking",
	"This person is becoming frustrated due to the language barrier",
	"This person does not appear to understand what your asking"
] call mps_getRandomElement;

if(!alive _person) exitWith{ hint "The dead won't talk to the living"; };

_infcount = ( {_x in (playableunits+switchableunits) && (side _x == (SIDE_A select 0)) } count nearestObjects[position player,["Man"],10]) / mps_ref_playercount;

_rndfactor = random 1;

_factor = 1 - (_infcount*_rndfactor);

_alreadygathered = _person getVariable "mps_questioned";

if(if(isNil "_alreadygathered") then {true} else {not _alreadygathered}) then{

	if(_factor > 0.93 && (random 1 > 0.5)) then {


		_intel_loc = mps_civilian_intel call mps_getRandomElement;
		_intel_loc = (_intel_loc) call mps_get_position;

		_dirn = "NORTH"; if( ( position player select 1 ) > (_intel_loc select 1) ) then {_dirn = "SOUTH"};
		_dire = "EAST"; if( ( position player select 0 ) > (_intel_loc select 0) ) then {_dire = "WEST"};
		_distintel = ( position player ) distance _intel_loc;

		_intel = [
			format["This person is indicating to your map at Grid Ref: %1", mapGridPosition _intel_loc],

			format["This person is indicating your target is roughly %1 %2",_dirn,_dire],
			format["This person is indicating your target is roughly %1",_dirn],
			format["This person is indicating your target is roughly %1",_dire],

			format["This person is indicating your target is roughly %1 %2",_dirn,_dire],
			format["This person is indicating your target is roughly %1",_dirn],
			format["This person is indicating your target is roughly %1",_dire],

			format["This person is indicating roughly %1 %2",_dirn,_dire],
			format["This person is indicating roughly %1",_dirn],
			format["This person is indicating roughly %1",_dire],

			format["This person is indicating roughly %1 %2",_dirn,_dire],
			format["This person is indicating roughly %1",_dirn],
			format["This person is indicating roughly %1",_dire]
		];

		_hint =  _intel call mps_getRandomElement;

		hint format["%1",_hint];

		_person setVariable ["mps_questioned",true,true];

	}else{

		hint _badresponse;

	};

}else{

	hint "This person has already been questioned";

};

if(true) exitWith {};