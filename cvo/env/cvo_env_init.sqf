cvo_env_fnc_fasterNight = compileScript ["cvo\env\cvo_env_fnc_fasterNight.sqf", false, ""];

// cvo_env_fasterNight_handle = [btc_p_acctime, cvo_p_env_fastnightmulti, ["CLEARNIGHT"], cvo_env_fasterNight_handle] spawn cvo_env_fnc_fasterNight;



cvo_env_fasterNight_handle = [90, 120, [""], cvo_env_fasterNight_handle] spawn cvo_env_fnc_fasterNight;

