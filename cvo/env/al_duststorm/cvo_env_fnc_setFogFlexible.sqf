cvo_env_fnc_setFogFlexible.sqf

// Executes a gradual change, with flexible targetValue.

params [
	["_duration", 60, [0]],
	["_target", [0,0,0], [[]], [2,3]]
	];

private _cycle = 20;								// Duration of each "cycle", in which the fog is applied.
private _stepsTotal = floor (_duration / _cycle);	// total count of "steps"
private _current;									// var for current 
private _arr;										// intermediate target for fog Parms during that cycle.

for "_i" from 1 to _stepsTotal do {
	_fogASL = call cvo_env_fnc_al_getAvgASL;
	_target set [2, _fogASL];
	_current = fogParams;
	_arr = [];

	for "_j" from 0 to 2 do {
		_arr pushBack (	(_current # _j ) + (	((_target # _j)-(_current # _j)) / _stepsTotal * _i 	)	);
	};

	_cycle setFog _arr;
	sleep _cycle;
};
