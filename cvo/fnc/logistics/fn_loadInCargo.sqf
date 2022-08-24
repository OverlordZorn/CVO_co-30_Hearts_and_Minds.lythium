params [
    ["_obj", objNull, [objNull]]
];

private _vehicles = nearestObjects [_obj, ["Car", "Truck"], 10, true];

if (count _vehicles < 1) exitWith { hint "No vehicles in 10 meter radius were found" };

private _nearestVehicle = _vehicles select 0;
private _possibleToLoad = (_nearestVehicle canVehicleCargo _obj) select 0;

if (!_possibleToLoad) exitWith { hint "Closest vehicle doesn't have enough room for this cargo" };

[
	10,
	[_nearestVehicle, _obj],
	{
		params ["_args"];
		_args params ["_vehicle", "_cargo"];
		_vehicle setVehicleCargo _cargo;
	},
	{}
] call ace_common_fnc_progressBar;