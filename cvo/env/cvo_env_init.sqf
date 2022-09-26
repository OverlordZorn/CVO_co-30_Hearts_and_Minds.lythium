

// #### Define Duststorm Function
cvo_env_fnc_cvo_duststorm 		= compileScript ["cvo\env\cvo_duststorm\cvo_duststorm.sqf", false, ""];

cvo_env_fnc_al_getAvgASL 		= compileScript ["cvo\env\cvo_duststorm\cvo_env_fnc_getAvgASL.sqf", false, ""];
cvo_env_fnc_setFogFlexible 		= compileScript ["cvo\env\cvo_duststorm\cvo_env_fnc_setFogFlexible.sqf", false, ""];

// #### Start FasterNight
cvo_env_fnc_fasterNight 		= compileScript ["cvo\env\cvo_env_fnc_fasterNight.sqf", false, ""];
cvo_env_fasterNight_handle 		= [btc_p_acctime, cvo_p_env_fastnightmulti] spawn cvo_env_fnc_fasterNight;
