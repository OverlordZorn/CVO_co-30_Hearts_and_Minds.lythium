// by ALIAS
// Dust Storm SCRIPT 
// Tutorial: https://www.youtube.com/user/aliascartoons
// example: [300] spawn cvo_env_fnc_al_duststorm_New;
// example: [600, 0.3, windDir] spawn cvo_env_fnc_al_duststorm_New;

private ["_vizibility","_stormsource","_x_dev","_y_dev"];

if (!isServer) exitWith {};

params [
	["_duration_duststorm", 300, [0]],
	["_vizibility", 0.3, [0]],
	["_direction_duststorm", windDir, [0]],
	["_effect_on_objects", false, [false]],
	["_dust_wall", false, [false]],
	["_lethal_wall", false, [false]]
];
 
/* old
_direction_duststorm	= _this select 0;
_duration_duststorm		= _this select 1;
_effect_on_objects		= _this select 2;
_dust_wall				= _this select 3;
_lethal_wall			= _this select 4;
_vizibility				= _this select 5;
*/ 


//hint str _direction_duststorm;

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

[_duration_duststorm] spawn {
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

[_duration_duststorm] spawn {
	private ["_duration_duststorm"];
	_duration_duststorm = _this select 0;

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
	
	sleep _duration_duststorm * 1.25;

	btc_AI_skill = _btc_ai_skill_backup;

	{[_x] call btc_mil_fnc_set_skill;} forEach allUnits;
};


// ###############################
// Controls FOG
// Server Only


[_vizibility, _duration_duststorm] spawn {
	private ["_vizibility", "_duration_duststorm"];
	_vizibility = _this select 0;
	_duration_duststorm = _this select 1;

	private _startTime = time;

	while {(_startTime + (2 * _duration_duststorm / 4)) > time} do {
		private _asl = (call cvo_env_fnc_al_getAvgASL) select 0;
		120 setFog [0.01, 0.005, (600 + _asl)];
		sleep 120;
	};

		while {(_startTime + (3 * _duration_duststorm / 4) > time)} do {
		private _asl = (call cvo_env_fnc_al_getAvgASL) select 0;
		120 setFog [0.02, 0.005, (850 + _asl)];
		sleep 120;
	};

	while {(_startTime + (4 * _duration_duststorm / 4) > time)} do {
		private _asl = (call cvo_env_fnc_al_getAvgASL) select 0;
		120 setFog [0.01, 0.005, (600 + _asl)];
		sleep 120;
	};


};

// #############
// Spawns the Alias Duststorm effect script
// RemoteExecute due to it being local to every client as the particles are spawned around the player locally

[[],"cvo\env\al_duststorm\alias_duststorm_effect.sqf"] remoteExec ["execVM",0,true];

// ##############
// Dustwall script

if (_dust_wall) then 
{
	_rand_pl = [] execVM "cvo\env\al_duststorm\alias_hunt.sqf";
	waitUntil {scriptDone _rand_pl};
	_pozobcj = hunt_alias getRelPos [800,(_direction_duststorm-180)];
	_stormsource = "Land_HelipadEmpty_F" createVehicle _pozobcj;
	_stormsource setDir _direction_duststorm;//_alpha = getDir _sursa_storm;
	if ((_direction_duststorm>315)or(_direction_duststorm<45)) then {_x_dev=600; _y_dev = 60};
	if ((_direction_duststorm<225)or(_direction_duststorm>135)) then {_x_dev=600; _y_dev = 60};
	if ((_direction_duststorm<=135)&&(_direction_duststorm>=45)) then {_x_dev=60; _y_dev = 600};
	if ((_direction_duststorm>=225)&&(_direction_duststorm<=315)) then {_x_dev=60; _y_dev = 600};
	[[_stormsource,_duration_duststorm,_x_dev,_y_dev],"cvo\env\al_duststorm\alias_dust_wall.sqf"] remoteExec ["execVM",0,true];

	[_stormsource] spawn 
	{
		private ["_stormsource_s"];
		_stormsource_s = _this select 0;
		while {al_duststorm_on} do 
		{
			[_stormsource_s,["hurricane",2000]] remoteExec ["say3d"];
			sleep 40;
		};
	};
	if (_lethal_wall) then {[_stormsource,_x_dev,_y_dev] execvm "cvo\env\al_duststorm\lethal_wall.sqf"};
	[_stormsource,_direction_duststorm] spawn {private ["_stormsource","_direction_duststorm"]; _stormsource = _this select 0; _direction_duststorm = _this select 1; while {al_duststorm_on} do {_stormsource setPos (_stormsource getRelPos [10,_direction_duststorm]);sleep 5}};
};

// ############
// sets the wind storm direction depending on input value (default should be windDir really)
// server only

if (_direction_duststorm == 0) then {_direction_duststorm = 360};
raport = 360/_direction_duststorm;
raport = round (raport * (10 ^ 2)) / (10 ^ 2);
if (raport >= 4) then {fctx = 1; fcty = 1;}	else {if (raport >= 2) then {fctx = 1; fcty = -1;}else { if (raport >=1.33) then {fctx = -1; fcty = -1;}else {fctx = -1; fcty = 1;};};};
if ((raport <= 2) and (raport >= 1.33)) then {fctx = -1; fcty = -1;};
_unx	= ((_direction_duststorm - floor (_direction_duststorm/90)*90))*fctx;
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

if (_effect_on_objects) then {

	while {al_duststorm_on} do {
		sleep 1;
		_rand_pl = [] execVM "cvo\env\al_duststorm\alias_hunt.sqf";
		waitUntil {scriptDone _rand_pl};

	// interval object blow
		//sleep 1;
		sleep 60+random 120;
		
		al_nearobjects = nearestObjects [hunt_alias,[],50];
		ar_obj_eligibl = [];
		
		{if((_x isKindOf "LandVehicle") or (_x isKindOf "Man") or (_x isKindOf "Air") or (_x isKindOf "Wreck")) then 
			{ar_obj_eligibl pushBack _x;};
		} foreach al_nearobjects;
		
		sleep 1;
		
		// alege obiect
		_blowobj= ar_obj_eligibl call BIS_fnc_selectRandom;

		//durata_rafala = 1+random 5;	sleep 30+random 120;
		sleep 1;
		[] spawn {
			_rafale = ["windburst_1","sandstorm","windburst_3_dr","windburst_4_st"] call BIS_fnc_selectRandom;
			[_rafale] remoteExec ["playSound"];
		};
		
		if (!isNull _blowobj) then {
			_xblow	= 0.1+random 5;
			_yblow	= 0.1+random 5;
	
			// creste viteza incremental
			_xx=0;
			_yy=0;
			
			while {(_xx< _xblow) or (_yy< _yblow)} do {
				_blowobj setvelocity [_xx*fctx,_yy*fcty,random -1];
				_xx = _xx + 0.01;
				_yy = _yy + 0.01;
				sleep 0.001;
			};
		
		};
	};
};

// #########
// plays additional, randomized sounds during the storm duration
// Global execution, therefore server only
while {al_duststorm_on} do {
	_rafale = ["windburst_1","windburst_2","windburst_3_dr","windburst_4_st", "sandstorm"] call BIS_fnc_selectRandom;
	[_rafale] remoteExec ["playSound"];
	sleep (50 + random 120);
};
if (_dust_wall) then {deleteVehicle _stormsource;}