diag_log ("[CVO] [INIT] (cvo_init.sqf) - START");

// Init CVO Music
cvo_fnc_music = compile preprocessFile "cvo\misc\cvo_music.sqf";

// Init SideMission Condition
cvo_side_fnc_distanceCondition = compile preprocessFile "core\fnc\side\cvo_side_fnc_distanceCondition.sqf";


// Init CVO fullHeal at GAZ66 Medical
if (cvo_p_medical_fullHeal) then 	{[compileScript ["cvo\medical\cvo_medical_init_fullHeal.sqf"]] call CBA_fnc_directCall;};


// Init CVO Foritfy Preset
if (cvo_p_logistics_fortify) then 	{[compileScript ["cvo\logistics\cvo_logistics_init_fortify.sqf"]] call CBA_fnc_directCall;};


// Init CVO Logistics Custom Ammo createSimpleObject
if (cvo_p_logistics_crate) then 	{[compileScript ["cvo\logistics\cvo_logistics_init_customSupplyBoxes.sqf"]] call CBA_fnc_directCall;};

// Init CVO Custom Spawnable Objects
//cvo_p_logistics_custom_construction_array
// init to be found in /core/def/mission.sqf

// Init CVO Arsenal Tab
if (cvo_p_arsenal_Tab_custom) then 	{
	[compileScript ["cvo\arsenal\cvo_arsenal_Tab_medical.sqf"]] call CBA_fnc_directCall;
};

// Init CVO Arsenal
if (cvo_p_arsenal) then 			{[compileScript ["cvo\arsenal\cvo_arsenal_basic.sqf"]] call CBA_fnc_directCall;};

// Init CVO Loadout
// core\init_player.sqf around line 31 

// Init CVO Environment Night Time Multiplyer
if (cvo_p_env_fastnight) then 		{[compileScript ["cvo\env\cvo_env_init.sqf"]] call CBA_fnc_directCall;};

// Init CVO Intel - Placeable Flag to Marker
if (cvo_p_intel_flags) then 		{[compileScript ["cvo\intel\cvo_intel_flag_init.sqf"]] call CBA_fnc_directCall;};


// Starts Server Restart Message + Save Script
execVM "cvo\misc\cvo_server_restart.sqf";

// Init JND Debug Console
execVM "cvo\misc\JND_debugv2.sqf";

diag_log ("[CVO] [INIT] (cvo_init.sqf) - END");

 