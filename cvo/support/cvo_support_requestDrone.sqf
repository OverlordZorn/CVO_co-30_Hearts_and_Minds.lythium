// ###### Definition

if (isNil "cvo_support_drones") then {cvo_support_drones = []};


if ((count cvo_support_drones) > 0) then {};


_startPos = [14073.1,21245.4,0];

_wp1pos = getPos btc_gear_object;

_wp2pos = getPos cvo_gaz66_radio;


_side = btc_player_side;


_vehicleClass = "rhs_pchela1t_vvs";
_direction = _startPos getDir _firstWaypoint;


private _return = [_startPos, _direction, _vehicleClass, _side] call BIS_fnc_spawnVehicle;
_return params ["_uav", "_crew", "_group"];
cvo_support_drones pushBack _return;

_group deleteGroupWhenEmpty true;
_uav disableTIEquipment true; 
_uav enableUAVWaypoints false;
{ _x disableUAVConnectability [_vehicle, true]; } forEach allPlayers;


_wp1 = _group addWaypoint [_wp1pos, 10];
_wp2 = _group addWaypoint [_wp2pos, 200];
_wp2 setWaypointCompletionRadius 200;
_wp3 = _group addWaypoint [_wp2pos, 10];
_wp3 setWaypointType "LOITER";
_wp3 setWaypointLoiterRadius 300;
_wp3 setWaypointLoiterAltitude 200;

