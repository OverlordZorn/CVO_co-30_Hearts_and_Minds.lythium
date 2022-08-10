// Init CVO fullHeal at GAZ66 Medical
if (cvo_fullHeal) then {[compileScript ["cvo\cvo_fullHeal.sqf"]] call CBA_fnc_directCall;};

// Init CVO Foritfy Preset
if (cvo_p_fortify) then {[compileScript ["cvo\cvo_fortify.sqf"]] call CBA_fnc_directCall;};

// Init CVO Custom Spawnable Objects
//cvo_p_custom_construction_array
// init to be found in /core/def/mission.sqf