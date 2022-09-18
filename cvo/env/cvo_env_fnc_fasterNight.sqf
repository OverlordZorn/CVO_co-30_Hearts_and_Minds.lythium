/*
*	Author: MrZorn
*
*	Description:
*		Continous change of timeMultiplier at SunSet and SunRise. 
*
*	Parameter(s):
*		0: <number> <range: 0.1 to 120> - (Optional, default 6)  Time Multiplier during Day
*		1: <number> <range: 0.1 to 120> - (Optional, default 60) Time Multiplier during Night
* 		2: <number> <offset in hours> - (Optional, default 0.75) Time Offset Defines the 
*		2: <Array of Strings>  (Optional, Default [""]) Additional modes to be enabled, multiple possible.
*			<"CLEARNIGHT"> - sets Overcast to less then 20% during the night. 
*
*	Returns:
*		<nothing>
*
*	Examples:
*		[] spawn cvo_env_fnc_fasterNight;
*		cvo_env_fasterNight_handle = [20, 120, ["CLEARNIGHT"]] spawn cvo_env_fnc_fasterNight;
*/
scopeName "main";

waitUntil {sleep 1; time > 0 };

diag_log "[CVO] [ENV] (FasterNight) - Start";


params [
	["_multiDay", 6],
	["_multiNight", 30],
	["_multiSunriseSunSet", 1],
	["_offset", 0.5],
	["_modes", [""]]
]; 

// Limit timeMultiplier range 0.1 - 120
{	_x = 0.1 max (_x min 120);} forEach [_multiDay, _multiNight];

// Modes of Operation
_clearNight = false; 																// Removes/Reduces Cloud Cover during night to ensure certain visibility

if (!(count _modes == 1 && _modes select 0 == "")) then {
	{
		switch (_x) do {
			case "CLEARNIGHT": {_clearNight = true; diag_log "[CVO] [ENV] (FasterNight) ClearNight True";};
		};
	} foreach _modes;
};



private _sunriseSunset = date call BIS_fnc_sunriseSunsetTime; 
private _sunrise = (_sunriseSunset select 0);
private _sunriseStart = _sunrise - _offset;
private _sunriseEnd = _sunrise + _offset;

private _sunset = (_sunriseSunset select 1); 
private _sunsetStart = _sunset - _offset;
private _sunsetEnd = _sunset + _offset;

// Define and Detect Phases
private _isNight = daytime >= _sunsetEnd;
private _isDay = _sunriseStart < daytime && daytime < _sunsetEnd;

private _isSunset = daytime > _sunsetStart && daytime < _sunsetEnd;

diag_log ("[CVO] [ENV] (FasterNight) - CurrentTime: " + str daytime );
diag_log ("[CVO] [ENV] (FasterNight) -   NightTime: " + str _sunsetEnd + 	" --0--> " + str _sunriseStart + 	" Realtime Duration: " + str round ( (24 - _sunsetEnd + _sunriseStart ) / _multiNight * 60)+ " min.");
diag_log ("[CVO] [ENV] (FasterNight) -     Sunrise: " + str _sunriseStart + " -----> " + str _sunriseEnd + 		" Realtime Duration: " + str round ( (_sunriseEnd - _sunriseStart ) / _multiSunriseSunSet * 60)+ " min.");
diag_log ("[CVO] [ENV] (FasterNight) -     DayTime: " + str _sunriseEnd + 	" -----> " + str _sunsetStart + 	" Realtime Duration: " + str round ( (_sunsetStart - _sunriseEnd ) / _multiDay * 60)+ " min.");
diag_log ("[CVO] [ENV] (FasterNight) -      Sunset: " + str _sunsetStart +	" -----> " + str _sunsetEnd + 		" Realtime Duration: " + str round ( (_sunsetEnd - _sunsetStart ) / _multiSunriseSunSet * 60 )+ " min.");


// NightTime Past Midnight
if (daytime <= _sunriseStart) then {
	diag_log ("[CVO] [ENV] (FasterNight) - Past MidNight detected");
	setTimeMultiplier _multiNight;
	diag_log ("[CVO] [ENV] (FasterNight) - Multiplier Night applied");
	diag_log ("[CVO] [ENV] (FasterNight) - Waiting until Next Phase");
	waitUntil {sleep 60; daytime > _sunriseStart};
};

// Sunrise
if (daytime > _sunriseStart && daytime < _sunriseEnd ) then {
	diag_log ("[CVO] [ENV] (FasterNight) - Sunrise detected");
	setTimeMultiplier _multiSunriseSunSet;
	diag_log ("[CVO] [ENV] (FasterNight) - Multiplier Sunrise applied");
	diag_log ("[CVO] [ENV] (FasterNight) - Waiting until Next Phase");
	waitUntil {sleep 60; daytime > _sunriseEnd};

};

// Daytime
if (_sunriseStart < daytime && daytime < _sunsetEnd ) then {
	diag_log ("[CVO] [ENV] (FasterNight) - Sunrise detected");
	setTimeMultiplier _multiDay;
	diag_log ("[CVO] [ENV] (FasterNight) - Multiplier Sunrise applied");
	diag_log ("[CVO] [ENV] (FasterNight) - Waiting until Next Phase");
	waitUntil {sleep 60; daytime > _sunsetStart};
};

// Sunset
if (daytime > _sunsetStart && daytime < _sunsetEnd ) then {
	diag_log ("[CVO] [ENV] (FasterNight) - Sunset detected");
	setTimeMultiplier _multiSunriseSunSet;
	diag_log ("[CVO] [ENV] (FasterNight) - Multiplier Sunset applied");
	diag_log ("[CVO] [ENV] (FasterNight) - Waiting until Next Phase");
	waitUntil {sleep 60; daytime > _sunsetEnd};
};

// NightTime Past Evening
if (daytime > _sunsetEnd) then {
	diag_log ("[CVO] [ENV] (FasterNight) - Night detected");
	setTimeMultiplier _multiNight;
	diag_log ("[CVO] [ENV] (FasterNight) - Multiplier Night applied");
	diag_log ("[CVO] [ENV] (FasterNight) - Waiting until Midnight");
	waitUntil {sleep 60; daytime < _sunriseStart};
};

diag_log ("[CVO] [ENV] (FasterNight) - Midnight passed");

cvo_env_fasterNight_handle = _this spawn cvo_env_fnc_fasterNight;
diag_log ("[CVO] [ENV] (FasterNight) - Re-Started");
