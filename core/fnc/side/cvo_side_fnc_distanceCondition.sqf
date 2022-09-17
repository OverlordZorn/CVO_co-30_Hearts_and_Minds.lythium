
/* ----------------------------------------------------------------------------
Function: cvo_side_fnc_distanceCondition

Description:
    Checks parameter cvo for sidemission distance setting. if sidemission distance is turned off, it will always return true. 
	Otherwise, it will check if the sidemission location is is within range of a FOB / Base.

Parameters:
    <_startPoint>              <object>            <default: objNull>  <object to check condition on, if empty will return nothing>
	<_customDistance>   <number> <optional> <default: 0>        <distance in meters> <if 0, it will take cvo_p_side_distance>      <NOT IMPLEMENTED>
    <_offset>           <number> <optional> <default: 0>        <distance in meters to be added on top of mission-parameter>       <NOT IMPLEMENTED>

Returns:
	boolean

Examples:
    (begin example)
        [_startPoint] spawn cvo_side_fnc_distanceCondition;
    (end)

Author:
    Zorn

---------------------------------------------------------------------------- */

params [
    ["_startPoint", objNull, [objNull]],
    ["_customDistance",0,[0]],
    ["_offset",0,[0]]
];

// Check if Mission Parameter is enabled, if Disabled/0 then exit and always return true
if (cvo_p_side_distance == 0) exitWith {
    diag_log ("[CVO] [SIDE] (disCon) - Parameter is Off");
    true
    }; 




// Param Adjustments
if (isNull _startPoint) exitWith {};
if (_customDistance == 0) then {_customDistance = cvo_p_side_distance}; 


// Define Array of _endPoint
_endPointArray = [];
_endPointArray pushBack ["HQ", btc_gear_object];

// make list of fobs
_fobs = count (btc_fobs select 0);

if (_fobs > 0) then {
    for "_i" from 0 to (_fobs-1) do { 
        _array = []; 
        _array pushBack (btc_fobs select 0 select _i); 
        _array pushBack (btc_fobs select 1 select _i);
        _endPointArray pushBack _array;    
    }; 
};

// get Array of distance from _startPoint to _endpointArray 
// [["FOB 123"],[1edc7616b00# 1172314: bagbunker_tower_f.p3d],[bis_o4]]
// [["FOB 123123","FOB secound"],[1f58f26f580# 1172079: bagbunker_tower_f.p3d,1f595cab580# 1172118: bagbunker_tower_f.p3d],[bis_o4,bis_o5]]

private _result = false;
private _distances = [];
{
    private _name = (_x select 0);

    _pos1 = getPos _startPoint;
    _pos2 = getPos (_x select 1);
    private _dis = round (_pos1 distance _pos2);
    _distances pushBack _dis;

    if (_dis < cvo_p_side_distance) exitWith {
        _result = true;
        };
} forEach _endPointArray;

diag_log ("[CVO] [SIDE] (disCon) - Limit: " + str cvo_p_side_distance  + " vs " + str _distances + " => " + str _result + " - Name: " + (_startPoint getVariable "name") );

_result