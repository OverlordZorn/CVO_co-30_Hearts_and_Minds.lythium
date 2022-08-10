// Init CVO fullHeal at GAZ66 Medical
if (cvo_fullHeal == 1) then {[compileScript ["cvo\cvo_fullHeal.sqf"]] call CBA_fnc_directCall;};

// Init CVO Foritfy Preset
if (cvo_p_fortify == 1) then {[compileScript ["cvo\cvo_fortify_preset.sqf"]] call CBA_fnc_directCall;};
