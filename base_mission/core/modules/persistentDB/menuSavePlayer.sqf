// #define DEBUG_MODE_FULL
#include "\ca\editor\Data\Scripts\dikCodes.h"

private ["_menuDef","_params","_menuName","_menuRsc","_menus"];
// _this==[_target, _menuNameOrParams]
//_target = _this select 0;
_params = _this select 1;

_menuName = "";
_menuRsc = "popup";

if (typeName _params == typeName []) then {
	if (count _params < 1) exitWith {diag_log format["Error: Invalid params: %1, %2", _this, __FILE__];};
	_menuName = _params select 0;
	_menuRsc = if (count _params > 1) then {_params select 1} else {_menuRsc};
} else {
	_menuName = _params;
};
//-----------------------------------------------------------------------------

_menus = [
	[
		["main", mso_menuname, _menuRsc],
		[
			["Save Player",
				{ 
				  if (pdb_aim_enabled) then {[player,"Getting player's AIM data"] call PDB_FNC_AIM;};
		      if (pdb_ace_enabled) then {[player,"Getting Player's ACE wounds data"] call PDB_FNC_ACE_WOUNDS;};
					PDB_SAVE_PLAYER = [name player, getplayeruid player, "Manual"]; 
					PublicVariableServer "PDB_SAVE_PLAYER";
				}
			]
		]
	]
];
//-----------------------------------------------------------------------------
_menuDef = [];
{
	if (_x select 0 select 0 == _menuName) exitWith {_menuDef = _x};
} forEach _menus;

if (count _menuDef == 0) then {
	hintC format ["Error: Menu not found: %1\n%2\n%3", str _menuName, if (_menuName == "") then {_this}else{""}, __FILE__];
	diag_log format ["Error: Menu not found: %1, %2, %3", str _menuName, _this, __FILE__];
};

_menuDef // return value
