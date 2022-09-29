// #### Define Duststorm Function
cvo_ss_fnc_sandstorm 			= compileScript	["cvo\sandstorm\cvo_ss_fnc_sandstorm.sqf", 			false, ""];

cvo_ss_fnc_getAvgASL 			= compileScript	["cvo\sandstorm\cvo_ss_fnc_getAvgASL.sqf", 			false, ""];
cvo_ss_fnc_setFogFlexible 		= compileScript ["cvo\sandstorm\cvo_ss_fnc_setFogFlexible.sqf", 	false, ""];

cvo_ss_fnc_scheduler 			= compileScript	["cvo\sandstorm\cvo_ss_fnc_scheduler.sqf", 			false, ""];

// #### Start the Sandstorm Scheduler
[] spawn cvo_ss_fnc_scheduler;