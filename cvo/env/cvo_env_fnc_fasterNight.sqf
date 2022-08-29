/*
*	Author: MrZorn
*
*	Description:
*		Continous change of timeMultiplier at SunSet and SunRise 
*
*	Parameter(s):
*		0: <number> <range: 0.1 to 120> - (Optional, default 6)  Time Multiplier during Day
*		1: <number> <range: 0.1 to 120> - (Optional, default 60) Time Multiplier during Night
*		2: <Array of Strings>  (Optional, Default [""]) Additional modes to be enabled, multiple possible.
*			<"CLEARNIGHT"> - sets Overcast to less then 20% during the night. 
*
*		3: <variable> (Optional, Default "_handle") Stores the Script Handle, so script can be terminated if need be, needs to be global if mission lasts for several cycles.
*
*	Returns:
*		<nothing>
*
*	Examples:
*		[] spawn cvo_env_fnc_fasterNight;
*		fasterNight_handle = [20, 120, ["CLEARNIGHT"], fasterNight_handle] spawn cvo_env_fnc_fasterNight;
*/
scopeName "main";

sleep 5;
diag_log "[CVO] [ENV] (FasterNight) Start";


params [
	["_multiDay", 6],
	["_multiNight", 60],
	["_modes", [""]],
	["_handle", "_handle"]
]; 

// Limit timeMultiplier range 0.1 - 120
{	switch (_x) do {
		case (_x > 120): {_x = 120};
		case (_x < 0.1): {_x = 0.1}; 
	};
} forEach [_multiDay, _multiNight];

// Modes of Operation
_clearNight = false; 			// Removes/Reduces Cloud Cover during night to ensure certain visibility

if (!(count _modes == 1 && _modes select 0 == "")) then {
	{
		switch (_x) do {
			case "CLEARNIGHT": {_clearNight = true; diag_log "[CVO] [ENV] (FasterNight) ClearNight True";};
		};
	} foreach _modes;
};



_sunriseSunset = date call BIS_fnc_sunriseSunsetTime; 
_sunrise = (_sunriseSunset select 0) - 0.5; 
_sunset = (_sunriseSunset select 1) + 0.5; 
_isDay = _sunrise < daytime && daytime < _sunset;

diag_log ("[CVO] [ENV] (FasterNight) _isDay?: " + str _isDay);


if (_isDay) then {
	scopeName "turnToNight";										// Change timeMultiplier when it turns night
	diag_log ("[CVO] [ENV] (FasterNight) currently Day");
	waitUntil {daytime > _sunset};
	diag_log ("[CVO] [ENV] (FasterNight) currently SunSet");
	setTimeMultiplier _multiNight;

	if (_clearNight) then {scopeName "ClearNight executing.";
		diag_log ("[CVO] [ENV] (FasterNight) _ClearNight start");
		3600 setOvercast (random 0.4);
		diag_log ("[CVO] [ENV] (FasterNight) _ClearNight wait begin");
		waitUntil {sleep 3600};
		diag_log ("[CVO] [ENV] (FasterNight) _ClearNight wait end");
		21600 setOvercast (random 0.2);
		diag_log ("[CVO] [ENV] (FasterNight) _ClearNight wait end");
	};

} else {
	
	scopeName "turnToDay";												// Change timeMultiplier when it turns Day

	if (daytime > _sunset) then {
		diag_log ("[CVO] [ENV] (FasterNight) currently Evening");
		waitUntil {daytime < _sunset};
		diag_log ("[CVO] [ENV] (FasterNight) currently Midnight");
		};
	waitUntil {daytime > _sunrise};
	diag_log ("[CVO] [ENV] (FasterNight) currently SunRise");
	setTimeMultiplier _multiDay;

};

diag_log ("[CVO] [ENV] (FasterNight) Complete");
_handle = [_multiDay, _multiNight, _modes, _handle] spawn cvo_env_fnc_fasterNight;
diag_log ("[CVO] [ENV] (FasterNight) Re-Start");
diag_log ("[CVO] [ENV] (FasterNight) new handle: " + str _handle);
