// Init CVO fullHeal at GAZ66 Medical
if (cvo_p_medical_fullHeal) then 	{[compileScript ["cvo\cvo_medical_fullHeal.sqf"]] call CBA_fnc_directCall;};

// Init CVO Foritfy Preset
if (cvo_p_logistics_fortify) then 	{[compileScript ["cvo\cvo_logistics_init_fortify.sqf"]] call CBA_fnc_directCall;};

// Init CVO Logistics Custom Ammo createSimpleObject
if (cvo_p_logistics_crate) then 	{[compileScript ["cvo\cvo_logistics_init_customSupplyBoxes.sqf"]] call CBA_fnc_directCall;};

// Init CVO Custom Spawnable Objects
//cvo_p_logistics_custom_construction_array
// init to be found in /core/def/mission.sqf

// Init CVO Arsenal Tab
if (cvo_p_arsenal_medicalTab) then 	{[compileScript ["cvo\cvo_arsenal_medTab.sqf"]] call CBA_fnc_directCall;};

// Init CVO Arsenal
if (cvo_p_arsenal) then 			{[compileScript ["cvo\cvo_arsenal_basic.sqf"]] call CBA_fnc_directCall;};

// Init CVO Loadout
// core\init_player.sqf around line 31 

// Init CVO Environment Night Time Multiplyer
if (cvo_p_env_fastnight) then 		{[compileScript ["cvo\env\cvo_env_init.sqf"]] call CBA_fnc_directCall;};