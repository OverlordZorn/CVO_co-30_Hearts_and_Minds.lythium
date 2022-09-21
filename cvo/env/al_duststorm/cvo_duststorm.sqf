// by Mr. Zorn - Based on ALIAS' Duststorm Script
// Gradual Dust Storm SCRIPT 

if (!isServer) exitWith {};
if (cvo_env_ds_running) exitWith (diag_log ("[CVO] [ENV] [DS] (Start) - Exit: Duststorm already running!";));

params [
	["_duration", 600, [0]],
	["_direction", windDir, [0]] //,
//	["_vizibility", 0.3, [0]],
//	["_effect_on_objects", false, [false]]
];


// establish killswitch
cvo_env_ds_running = true;


// Store Pre Storm Weather Data

ds_foglevel		= fogParams;
ds_rainlevel	= rain;
ds_thundlevel	= lightnings;
ds_windstr		= windStr;
ds_windgusts	= gusts
ds_overcast		= overcast;
publicVariable "ds_foglevel";
publicVariable "ds_rainlevel";
publicVariable "ds_thundlevel";
publicVariable "ds_windlevel";
publicVariable "ds_overcast";



// phase definition
cvo_env_ds_ptime = _duration / 10;
cvo_env_ds_phase = 0;

[_duration] spawn {
	params ["_duration"];
	
	while {cvo_env_ds_running && (cvo_env_ds_phase <= 10)} do {
		publicVariable "cvo_env_ds_phase";
		sleep cvo_env_ds_ptime;
	};
	cvo_env_ds_running = false;
	publicVariable "cvo_env_ds_running";
	cvo_env_ds_phase = nil;
};

// Controls the weather


// controls the fog

ds_fog_stage = [0,0,0];
ds_fog_max 	 = [0,0,0];
ds_fog_post	 = [0,0,0];



ds_fog = ds_fog_stage;


[_duration] spawn {
	params ["_duration"];


	while {cvo_env_ds_running} do {


		
		
	};

	(1 * evo_env_ds_ptime) setFog ds_foglevel;

};


[_duration] spawn {
	params ["_duration"];

	ds_fog_stage = [0,0,0];
	ds_fog_max 	 = [0,0,0];
	ds_fog_post	 = [0,0,0];

	ds_fog = ds_fog_stage;

	(2 * evo_env_ds_ptime) setWindForce 1;
	(2 * cvo_env_ds_ptime) setWindStr 1;
	(2 * cvo_env_ds_ptime) setGusts 1;

	waitUntil {sleep 1; cvo_env_ds_phase >= 3};
	ds_fog = ds_fog_max;

};






















/*





//hint str _direction;

al_duststorm_on = true;
publicVariable "al_duststorm_on";

al_foglevel		= fogParams;
al_rainlevel	= rain;
al_thundlevel	= lightnings;
al_windlevel	= wind;
al_overcast		= overcast;
publicVariable "al_foglevel";
publicVariable "al_rainlevel";
publicVariable "al_thundlevel";
publicVariable "al_windlevel";
publicVariable "al_overpast";

/*
al_overforecast	= overcastForecast;
publicVariable "al_overforecast";
*/
sleep 0.1;

// ###############################
// ## resets the weather parameter
// Server Only

[_duration] spawn {
	x_duration_storm = _this select 0;
	sleep (x_duration_storm * 1.1);
	
	al_duststorm_on = false;
	publicVariable "al_duststorm_on";


	180 setFog al_foglevel;
	180 setRain al_rainlevel;
	180 setLightnings al_thundlevel;
    180 setOvercast al_overforecast;
	setWind [al_windlevel select 0, al_windlevel select 1, true];
	//forceWeatherChange;
};

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
// Controls FOG
// Server Only


[_vizibility, _duration] spawn {
	private ["_vizibility", "_duration"];
	_vizibility = _this select 0;
	_duration = _this select 1;

	private _startTime = time;

	while {(_startTime + (2 * _duration / 4)) > time} do {
		private _asl = (call cvo_env_fnc_al_getAvgASL) select 0;
		120 setFog [0.01, 0.005, (600 + _asl)];
		sleep 120;
	};

		while {(_startTime + (3 * _duration / 4) > time)} do {
		private _asl = (call cvo_env_fnc_al_getAvgASL) select 0;
		120 setFog [0.02, 0.005, (850 + _asl)];
		sleep 120;
	};

	while {(_startTime + (4 * _duration / 4) > time)} do {
		private _asl = (call cvo_env_fnc_aal_getAvgASL) select 0;
		120 setFog [0.01, 0.005, (600 + _asl)];
		sleep 120;
	};


};

// #############
// Spawns the Alias Duststorm effect script
// RemoteExecute due to it being local to every client as the particles are spawned around the player locally

[[],"cvo\env\al_duststorm\alias_duststorm_effect.sqf"] remoteExec ["execVM",0,true];


// ############
// sets the wind storm direction depending on input value (default should be windDir really)
// server only

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