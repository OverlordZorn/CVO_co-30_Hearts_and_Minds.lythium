#include "cvo\init\cvo_chem_actions.sqf"

[compileScript ["cvo\cvo_arsenal_player.sqf"]] call CBA_fnc_directCall;

if (cvo_p_acre_unconcious) then {
	[compileScript ["cvo\cvo_acre_unconcious.sqf"]] call CBA_fnc_directCall;
	};