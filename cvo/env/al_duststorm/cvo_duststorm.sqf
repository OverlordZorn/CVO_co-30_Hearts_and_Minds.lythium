// by Mr. Zorn - Based on ALIAS' Duststorm Script
// Gradual Dust Storm SCRIPT 

if (!isServer) exitWith {};

if (isNil "cvo_env_ds_running") then 	{cvo_env_ds_running = false; publicVariable "cvo_env_ds_running";};
if (cvo_env_ds_running) exitWith 	{diag_log "[CVO] [ENV] [DS] (Start) - Exit: Duststorm already running!";};

params [
	["_duration", 600, [0]],
	["_direction", windDir, [0]] //,
//	["_vizibility", 0.3, [0]],
//	["_effect_on_objects", false, [false]]
];

sleep 1;

diag_log ("[CVO] [ENV] [DS] (Start) - " + format ["Duration: %1 - Direction: %2", _duration, _direction]);

// ## ## Store Pre Storm Weather Data

ds_foglevel			= fogParams;

ds_overcast			= overcast;
ds_rainlevel		= rain;
ds_thundlevel		= lightnings;

ds_wind				= wind;
ds_windstr			= windStr;
ds_windgusts		= gusts;



// establish killswitch
cvo_env_ds_running = true;
diag_log ("[CVO] [ENV] [DS] (Init) - " + format ["Starting Duststorm: %1 ", cvo_env_ds_running]);


// phase definition
cvo_env_ds_phasetime = _duration / 10;
cvo_env_ds_phase = 0;

// spawns the pace maker
[_duration] spawn {
	params ["_duration"];
	
	while { cvo_env_ds_running && ( cvo_env_ds_phase <= 10 ) } do {
		cvo_env_ds_phase = cvo_env_ds_phase + 1;
		publicVariable "cvo_env_ds_phase";
		sleep cvo_env_ds_phasetime;
		diag_log ("[CVO] [ENV] [DS] (Phase) - " + format ["Current Phase: %1 ", cvo_env_ds_phase]);
	};

	cvo_env_ds_running = false;
	publicVariable "cvo_env_ds_running";
	diag_log ("[CVO] [ENV] [DS] (Phase) - " + format ["Current Phase: %1 ", cvo_env_ds_running]);

	cvo_env_ds_phase = nil;
};

// ### ### ### Controls the weather

// ### ### FOG CONTROL
[] spawn {			// FOG Control

	_ds_fog_stage	= [0.03, 0.005, 200];
	_ds_fog_max 	= [0.03, 0.006, 600];
	_ds_fog_post	= [0.03, 0.005, 400];
	


	[(2 * cvo_env_ds_phasetime), _ds_fog_stage, true] 	spawn cvo_env_fnc_setFogFlexible;

	waitUntil {sleep (2 * cvo_env_ds_phasetime); true};

	[(2 * cvo_env_ds_phasetime), _ds_fog_max,true] 		spawn cvo_env_fnc_setFogFlexible;
	waitUntil {sleep (2 * cvo_env_ds_phasetime);true};

	[(2 * cvo_env_ds_phasetime), _ds_fog_max,true] 		spawn cvo_env_fnc_setFogFlexible;
	waitUntil {sleep (3 * cvo_env_ds_phasetime);true};

	[(3 * cvo_env_ds_phasetime), _ds_fog_post,true] 	spawn cvo_env_fnc_setFogFlexible;

};

[] spawn {			// Weather Control @ EXIT
	waitUntil {sleep 60; !cvo_env_ds_running};

	cvo_env_ds_phasetime setOvercast 	ds_overcast;
	cvo_env_ds_phasetime setFog 		ds_foglevel;
	cvo_env_ds_phasetime setRain 		ds_rainlevel;
	cvo_env_ds_phasetime setLightnings 	ds_thundlevel;
	//					 setWind		ds_wind;
	cvo_env_ds_phasetime setWindStr		ds_windstr;
	cvo_env_ds_phasetime setGusts		ds_windgusts;


	ds_overcast		= nil;
	ds_foglevel 	= nil;
	ds_rainlevel 	= nil;
	ds_thundlevel 	= nil;
	ds_wind 		= nil;
	ds_windstr 		= nil;
	ds_windgusts	= nil;


};

[] spawn { 			// WIND CONTROL
	params ["_duration"];


};


					// DEBUG Viewer
[] spawn {
	while {cvo_env_ds_running} do {
	hintSilent (format ["FogParams:\nValue: %1\nDecay: %2\nFogBase: %3", fogParams#0, fogParams#1, fogParams#2]);
	sleep 1;
}};









/*


// ###############################
// Windsound 1 - can be extended before and after the storm itself
// Server Only

[] spawn {
	while {al_duststorm_on} do {
		["strong_wind"] remoteExec ["playSound"];
		sleep 67;
	};
};

// ###############################
// reduces AI Skill via btc_ai_skill during the storm
// this way, it should affect newly spawned Ai during the storm as well as currently spawned AI.
// Note for future: this needs adaptation when used outside of BTC Hearts and Minds. It could ether
// Server only

[_duration] spawn {
	private ["_duration"];
	_duration = _this select 0;

	// Define New BTC_AI_Skill Array
	private _mod = [
    0.4,      	//general 
    0.15,    	// aimAccuracy
    0.5,    	// aimShake
    0.4,    	// aimSpeed
    0.8,      	// endurance
    0.10,   	// spotDistance
    0.10,   	// spotTime
    0.3,    	// courage
    0.5,    	// reloadSpeed
    0.4     	// Commanding
    ];

	private _array = [];
	private _btc_AI_skill_backup = btc_AI_skill;

	for "_i" from 0 to 9 do {
		_array pushback ((btc_AI_skill select _i) * (_mod select _i));
	};

	btc_AI_skill = _array;

	{[_x] call btc_mil_fnc_set_skill;} forEach allUnits;
	
	sleep _duration * 1.25;

	btc_AI_skill = _btc_ai_skill_backup;

	{[_x] call btc_mil_fnc_set_skill;} forEach allUnits;
};


// ###############################

// #############
// Spawns the Alias Duststorm effect script
// RemoteExecute due to it being local to every client as the particles are spawned around the player locally

[[],"cvo\env\al_duststorm\alias_duststorm_effect.sqf"] remoteExec ["execVM",0,true];


// ############
// sets the wind storm direction depending on input value (default should be windDir really)
// server only

// ############
// Wind control

if (_direction == 0) then {_direction = 360};
raport = 360/_direction;
raport = round (raport * (10 ^ 2)) / (10 ^ 2);
if (raport >= 4) then {fctx = 1; fcty = 1;}	else {if (raport >= 2) then {fctx = 1; fcty = -1;}else { if (raport >=1.33) then {fctx = -1; fcty = -1;}else {fctx = -1; fcty = 1;};};};
if ((raport <= 2) and (raport >= 1.33)) then {fctx = -1; fcty = -1;};
_unx	= ((_direction - floor (_direction/90)*90))*fctx;
vx = floor (_unx * 0.6);
vy = (54 - vx)*fcty;
// mareste incremental vantul  ## Incremental increase of windspeed
inx = 0;
iny = 0;
incr = true;
incrx = false;
incry = false;

while {incr} do 
{
	sleep 0.01;
	if (inx < abs vx) then {inx = inx+0.1;} else {incrx = true};
	if (iny < abs vy) then {iny = iny+0.1} else {incry = true};
	if (incrx and incry) then {incr=false};
	winx = floor (inx*fctx/2);
	winy = floor (iny*fcty/2);
	setWind [winx,winy,true];
};

// #########
// plays additional, randomized sounds during the storm duration
// Global execution, therefore server only

while {al_duststorm_on} do {
	_rafale = ["windburst_1","windburst_2","windburst_3_dr","windburst_4_st"] call BIS_fnc_selectRandom;
	[_rafale] remoteExec ["playSound"];
	sleep 60+random 120;
};

*/