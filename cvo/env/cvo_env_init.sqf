// #### Start FasterNight
cvo_env_fnc_fasterNight 		= compileScript ["cvo\env\cvo_env_fnc_fasterNight.sqf", false, ""];
cvo_env_fasterNight_handle 		= [btc_p_acctime, cvo_p_env_fastnightmulti] spawn cvo_env_fnc_fasterNight;
 
// #### Start Sandstorm Environment Init
execVM "cvo\env\cvo_sandstorm\cvo_ss_init.sqf";