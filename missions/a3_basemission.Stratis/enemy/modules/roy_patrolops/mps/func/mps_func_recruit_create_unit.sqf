// Written by BON_IF
// Adpated by EightySix

if(isDedicated) exitWith{};
if((count (units group player) + count mps_recruit_queue) >= mps_group_maxsize) exitWith {hint "You've reached the max. allowed group size."};

disableSerialization;

_update_queue = {
	_display = findDisplay 86030;
	_queuelist = _display displayCtrl 86034;
	_queuelist ctrlSetText format["Units queued: %1",count mps_recruit_queue];
};

_display = findDisplay 86030;
_listbox = _display displayCtrl 86033;
_sel = lbCurSel _listbox; if(_sel < 0) exitWith{};

_unittype = mps_recruit_unittypes select _sel;
_typename = lbtext [86033,_sel];

_queuepos = 0;
_queuecount = count mps_recruit_queue;
if(_queuecount > 0) then {
	_queuepos = (mps_recruit_queue select (_queuecount - 1)) + 1;
	hint parseText format["<t size='1.0' font='Zeppelin33' color='#ef2525'>%1</t> added to queue.",_typename];
};
mps_recruit_queue = mps_recruit_queue + [_queuepos];

[] call _update_queue;

WaitUntil{_queuepos == mps_recruit_queue select 0};
sleep (1.5 * (_queuepos min 1));
hint parseText format["Processing your <t size='1.0' font='Zeppelin33' color='#ffd800'>%1</t>.",_typename];

if(!mps_debug) then { sleep (6 + random 3); };

_spawnpos = [getPos bon_recruit_barracks,random 360,2] call mps_new_position;

_unit = group player createUnit [_unittype, _spawnpos, [], 0, "FORM"];
_unit setRank "PRIVATE";
[_unit] execVM (mps_path+"func\mps_func_recruit_unit_init.sqf");

hint parseText format["Your <t size='1.0' font='Zeppelin33' color='#008aff'>%1</t> %2 has arrived.",_typename,name _unit];
mps_recruit_queue = mps_recruit_queue - [_queuepos];

[] call _update_queue;