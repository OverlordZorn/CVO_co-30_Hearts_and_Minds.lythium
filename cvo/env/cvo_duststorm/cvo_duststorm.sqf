// by Zorn - Based on ALIAS' Duststorm Script
// Gradual Dust Storm SCRIPT 

if (!isServer) exitWith {};
if (!canSuspend) exitWith {_this spawn cvo_env_fnc_cvo_duststorm};

if (isNil "cvo_env_ds_running") then 	{cvo_env_ds_running = false; publicVariable "cvo_env_ds_running";};
if (cvo_env_ds_running) exitWith 	{diag_log "[CVO] [ENV] [DS] (Start) - Exit: Duststorm already running!";};

params [
	["_duration", 30, [0]],
	["_direction", windDir, [0]] //,
//	["_vizibility", 0.3, [0]],
//	["_effect_on_objects", false, [false]]
];


// converts _duration from minutes into secounds.

_duration = _duration * 60;

diag_log ("[CVO] [ENV] [DS] (Start) - " + format ["Duration: %1 - Direction: %2", _duration, _direction]);


// ######### 
// Establish Killswitch
cvo_env_ds_running = true;
publicVariable "cvo_env_ds_running";

diag_log ("[CVO] [ENV] [DS] (Init) - " + format ["Starting Duststorm: %1 ", cvo_env_ds_running]);

sleep 5;


// ######### 
// Phase Definition
cvo_env_ds_phasetime = (_duration / 10);
publicVariable "cvo_env_ds_phasetime";

cvo_env_ds_phase = 0;


// ######### 
// Pace Maker

[_duration] spawn {
	params ["_duration"];

		diag_log ("[CVO] [ENV] [DS] (PaceMaker) - Init");

	
	while { cvo_env_ds_running && ( cvo_env_ds_phase <= 10 ) } do {
		cvo_env_ds_phase = cvo_env_ds_phase + 1;
		publicVariable "cvo_env_ds_phase";
		sleep cvo_env_ds_phasetime;
		diag_log ("[CVO] [ENV] [DS] (Phase) - " + format ["Current Phase: %1 ", cvo_env_ds_phase]);
	};

	cvo_env_ds_running = false;
	publicVariable "cvo_env_ds_running";

	diag_log ("[CVO] [ENV] [DS] (Phase) - " + format ["Current Phase: %1 ", cvo_env_ds_running]);

	sleep 10;
	cvo_env_ds_phase = nil;
	diag_log ("[CVO] [ENV] [DS] (PaceMaker) - Exit");
};

// ####################################
// INIT CVO_Duststorm_Effects.sqf for local effects

[[],"cvo\env\cvo_duststorm\cvo_duststorm_effects.sqf"] remoteExec ["execVM",0,true];


// ####################################
// Weather Control



// ######### 
// Store Pre-Storm Weather Data

ds_foglevel			= fogParams;
ds_overcast			= overcast;
ds_rainlevel		= rain;
ds_thundlevel		= lightnings;
ds_wind				= wind;
ds_windstr			= windStr;
ds_windgusts		= gusts;


// ######### 
// Simple Weather Control during the Storm


(cvo_env_ds_phasetime * 4) setOvercast ((5 + floor random 5)/10);
(cvo_env_ds_phasetime * 8) setRain 0;
[] spawn {
	waitUntil {sleep (8 * cvo_env_ds_phasetime); true};
	if (!cvo_env_ds_running) 	exitWith {};
	(cvo_env_ds_phasetime * 8) setRain ((5 + floor random 5)/10);
};


// #########
// FOG CONTROL

[] spawn {
	diag_log ("[CVO] [ENV] [DS] (FogControl) - Init");

	//  ######## Definition
	_ds_fog_stage	= [0.03, 0.005, 200];
	_ds_fog_max 	= [0.03, 0.006, 600];
	_ds_fog_post	= [0.03, 0.005, 400];
	
	//  ######## Execution
	[(2 * cvo_env_ds_phasetime), _ds_fog_stage, true] 	spawn cvo_env_fnc_setFogFlexible;

	waitUntil {sleep (2 * cvo_env_ds_phasetime); true};
	if (!cvo_env_ds_running) 	exitWith {};


	[(2 * cvo_env_ds_phasetime), _ds_fog_max,true] 		spawn cvo_env_fnc_setFogFlexible;
	waitUntil {sleep (2 * cvo_env_ds_phasetime);true};
	if (!cvo_env_ds_running) 	exitWith {};


	[(2 * cvo_env_ds_phasetime), _ds_fog_max,true] 		spawn cvo_env_fnc_setFogFlexible;

	waitUntil {sleep (4 * cvo_env_ds_phasetime);true};
	if (!cvo_env_ds_running) 	exitWith {};

	[(3 * cvo_env_ds_phasetime), _ds_fog_post,true] 	spawn cvo_env_fnc_setFogFlexible;
	diag_log ("[CVO] [ENV] [DS] (FogControl) - Exit");
};

// #########
//  WIND CONTROL ## This is some Blackmagic voodoo shit taken directly from Alias' Sandstorm script. Only addition is is the 1. Line to avoid Devide by Zero error.

[_direction] spawn {
	waitUntil {sleep 1; cvo_env_ds_phase >= 3};

	diag_log ("[CVO] [ENV] [DS] (WindControl) - Init"); 			
	params ["_direction"];

	//  ######## Definition
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
 
	//  ######## Execution
	while {incr && cvo_env_ds_running} do 
	{
		sleep 0.1;
		if (inx < abs vx) then {inx = inx+0.01;} else {incrx = true};
		if (iny < abs vy) then {iny = iny+0.01} else {incry = true};
		if (incrx and incry) then {incr=false};
		winx = floor (inx*fctx/2);
		winy = floor (iny*fcty/2);
		setWind [winx,winy,true];
	};

	diag_log ("[CVO] [ENV] [DS] (WindControl) - Exit");
};

[] spawn {	// Wind Control @ EXIT
	//  ######## Waiting
	waitUntil {sleep 1; ((cvo_env_ds_phase >= 7) || !cvo_env_ds_running ) };
	diag_log ("[CVO] [ENV] [DS] (WindExit) - Init");

	setWind		[0,0,false];
	//  ######## Execution
	cvo_env_ds_phasetime setWindStr		ds_windstr;
	cvo_env_ds_phasetime setGusts		ds_windgusts;
	//  ######## Cleanup
	ds_wind 		= nil;
	ds_windstr 		= nil;
	ds_windgusts	= nil;
	diag_log ("[CVO] [ENV] [DS] (WindExit) - End");
};

[] spawn {			// Weather Control @ EXIT
	//  ######## Waiting
	diag_log ("[CVO] [ENV] [DS] (WeatherExit) - Init");
	waitUntil {sleep 1; !cvo_env_ds_running};

	//  ######## Execution
	(2 * cvo_env_ds_phasetime) setOvercast 		ds_overcast;
	(2 * cvo_env_ds_phasetime) setFog 			ds_foglevel;
	(2 * cvo_env_ds_phasetime) setRain 			ds_rainlevel;
	(2 * cvo_env_ds_phasetime) setLightnings 	ds_thundlevel;

	//  ######## Cleanup
	ds_overcast		= nil;
	ds_foglevel 	= nil;
	ds_rainlevel 	= nil;
	ds_thundlevel 	= nil;
	diag_log ("[CVO] [ENV] [DS] (WeatherExit) - End");
};

// ####################################
// AI SKILL CONTROL

[] spawn {
	diag_log ("[CVO] [ENV] [DS] (AISkill) - Init");

	// Definition of Variables
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

	//  ######## Waiting for Start
	waitUntil {sleep 10; cvo_env_ds_phase >= 2};								/// EXECUTE @ Phase 2

	//  ######## Execution
	{[_x] call btc_mil_fnc_set_skill;} forEach allUnits;
	diag_log ("[CVO] [ENV] [DS] (AISkill) - AI Skill Debuff Applied");
	

	//  ######## Waiting for End
	waitUntil {sleep 1; (!cvo_env_ds_running || cvo_env_ds_phase >= 9)};		/// REVERT @ Phase 9 or when Killswitch

	btc_AI_skill = _btc_ai_skill_backup;
	//  ######## Execution
	{[_x] call btc_mil_fnc_set_skill;} forEach allUnits;
	diag_log ("[CVO] [ENV] [DS] (AISkill) - AI Skill normal");
	diag_log ("[CVO] [ENV] [DS] (AISkill) - Exit");
};

// ##################################
// SOUND - WIND 1 (Phase 1 to 10)

[] spawn {
	
	diag_log ("[CVO] [ENV] [DS] (Wind 2) - Init");
	
	while {cvo_env_ds_running} do {
		["strong_wind"] remoteExec ["playSound"];
		sleep 67;
	};

	diag_log ("[CVO] [ENV] [DS] (Wind 2) - End");
};

// #########
// SOUND - WIND 1 (Phase 3 to 8)

[] spawn {
	waitUntil {sleep 1; cvo_env_ds_phase >= 3};
	diag_log ("[CVO] [ENV] [DS] (Wind 1) - Init");

	while {cvo_env_ds_running && (cvo_env_ds_phase <= 8)} do {
		_rafale = ["windburst_1","windburst_2","windburst_3_dr","windburst_4_st"] call BIS_fnc_selectRandom;
		[_rafale] remoteExec ["playSound"];
		sleep 15+random 60;
	};
	diag_log ("[CVO] [ENV] [DS] (Wind 1) - End");
};

// #########
// SOUND - WIND 3 (Phase 5,6,7)

[] spawn {
	diag_log ("[CVO] [ENV] [DS] (Wind 3) - Init");
	waitUntil {sleep 1; (cvo_env_ds_phase >= 5)};

	while {cvo_env_ds_running && (cvo_env_ds_phase <= 7)} do {
		["hurricane"] remoteExec ["playSound"];
		sleep 50;
	};

	diag_log ("[CVO] [ENV] [DS] (Wind 3) - End");
};



// ##################################
// DEBUG Viewer

/*
[_duration] spawn {
	diag_log ("[CVO] [ENV] [DS] (DebugHint) - Init");
	params ["_duration"];
	private _cvo_env_ds_startTime = time;


	while {cvo_env_ds_running} do {
		sleep 0.5;
		private _pastTime = round (time - _cvo_env_ds_startTime);
		hintSilent (format ["Time: %4s / %5s - Phase: %6\nFogParams:\nValue: %1\nDecay: %2\nFogBase: %3", fogParams#0, fogParams#1, fogParams#2,_pastTime, _duration, cvo_env_ds_phase]);
		sleep 1;
	};
	diag_log ("[CVO] [ENV] [DS] (DebugHint) - End");
};
*/