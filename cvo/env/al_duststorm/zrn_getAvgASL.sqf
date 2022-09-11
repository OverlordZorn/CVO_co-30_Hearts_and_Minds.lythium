/*
*	Author: MrZorn
*
*	Description:
*		x 
*
*	Parameter(s):
* 		none
*
*	Returns:
*		<x>
*
*	Examples:
*		_var = call cvo_env_fnc_fasterNight;
*
*/

private _allPlayers = call BIS_fnc_listPlayers;
private _arr = [];

{
	_arr pushBack (getPosASL _x select 2);
} forEach _allPlayers;

private _min = _arr call CBA_fnc_findMin; 
private _max = _arr call CBA_fnc_findMax;