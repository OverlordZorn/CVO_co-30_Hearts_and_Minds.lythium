/*
* Registers the given objects in the given side's player interaction menu.
* Players on that side must have the `Fortify Tool` item in their inventory to access the menu.
* Classnames must be in the format [<classname>, <cost>]
* MUST BE CALLED ON SERVER!
*
* Arguments:
* 0: Side <SIDE>
* 1: Budget <NUMBER>
* 2: Object Classnames <ARRAY>
*
* Return Value:
* None
*
* Example:
* [west, 5000, [["Land_BagFence_Long_F", 5], ["Land_BagBunker_Small_F", 50]]] call ace_fortify_fnc_registerObjects
*
* https://ace3.acemod.org/wiki/framework/fortify-framework.html
*/

[west, 0, [
	["Land_HBarrier_3_F", 0],
	["Land_HBarrier_5_F", 0],
	["Land_HBarrier_Big_F", 0],
	["Land_HBarrier_1_F", 0],
	["Land_HBarrierWall_corridor_F", 0],
	["Land_HBarrierWall_corner_F", 0],
	["Land_HBarrierWall_corner_F", 0],
	["Land_HBarrierWall6_F", 0],
	["Land_HBarrierWall4_F", 0],
	["Land_HBarrierTower_F", 0],
	["Land_BagBunker_Tower_F", 0],
	["Land_BagBunker_Large_F", 0],
	["Land_BagBunker_Small_F", 0],
	["Land_BagFence_Long_F", 0],
	["Land_BagFence_Short_F", 0],
	["Land_SandbagBarricade_01_half_F", 0],
	["Land_SandbagBarricade_01_F", 0],
	["Land_SandbagBarricade_01_hole_F", 0],
	["Land_BagFence_Round_F", 0]
]] call ace_fortify_fnc_registerObjects;

[
	{
		(_this select 0) getVariable ["isEngineer", false]
	} AND {
		100 > ((_this select 0) distance cvo_fortify_vehicle)
	}
] call ace_fortify_fnc_addDeployHandler;