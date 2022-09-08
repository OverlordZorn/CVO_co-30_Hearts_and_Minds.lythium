#include "cvo\init\cvo_cbrn.sqf"

[compileScript ["cvo\arsenal\cvo_arsenal_player.sqf"]] call CBA_fnc_directCall;

if (cvo_p_acre_unconcious) then {
	[compileScript ["cvo\misc\cvo_acre_unconcious.sqf"]] call CBA_fnc_directCall;
};