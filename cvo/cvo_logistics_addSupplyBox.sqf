/* WIP
 * Author: Zorn
 * Adds custom supplycrate to supply spawner.
 *
 * Arguments:
 * 0: Target supplySpawner <OBJECT>
 * 1: Name of the supplyCrate <string>
 * 2: Nested Array of content EXCEPT BACKPACKS [[class0, #], [classN,#]] <Nested Array>
 * 3: Class of Crate to be used <OBJECT> <Optional>
 * 4: Nested Array of Content BACKPACKS Only [[class0, #], [classN,#]] <Nested Array>
 * Return Value:
 * None
 *
 * Example:
 * [btc_create_object, "Monkey Care Package",["Ace_banana", 100]] call cvo_logistics_addSupplyCrate;
 * [_box, true, false] call ace_arsenal_fnc_addVirtualItems
 *
 * Public: maybe idfk
*/

params [
	["_spawner", objNull, [objNull]],
	["_Name", "defaultName", ["string"]],
	["_items",[[]], [[]]],
	["_BoxType","Land_WoodenBox_F", ["string"]],
	["_backpacks", [[]],[[]]]
];


if (_spawner == objNull || _Name == "") exitWith {};

_code = {
	private _box = createVehicle [_boxType, getPos _current_garage,[],5,"NONE"];
	clearItemCargoGlobal _box;

	if (!_items == [[]]) then {
		{
			_box addItemCargoGlobal [_x select 0, _x select 1];
		} forEach _items;
	};
	if (!_backpacks == [[]]) then {
		{
			_box addBackpackCargo [_x select 0, _x select 1];
		} forEach _backpacks;

	};
};


_cvo_log_supplybox = [
	"CVO_FullHeal",							// Action Name
	"Get Full Health Check",				// Name for the ACE Interaction Menu
	"",										// Statement - i have no fucking clue what that is supposed to mean
	_code,									// the coe you're executing
	{true}									// Condition
] call ace_interact_menu_fnc_createAction;

// Here we define where we want this action that we created to be attached to
[
	"UK3CB_KDF_O_Gaz66_Med",				// Class the action should be assigned to
	0,										// Type of action, 0 for action, 1 for self-actionIDs
	["ACE_MainActions"],					// Parent path of the new action <Array>
	_cvo_log_supplybox
] call ace_interact_menu_fnc_addActionToClass;		// Alternative: ace_interact_menu_fnc_addActionToObject 





/*
cvo_logistics_array = [
	[
		"",											// Display name of the Box					
		[
			["", 0],								//classname of item, amount
		],											// Array of items
		"classname of the box"						// Classname of the Box u're want to put the stuff in (it will be emptied at spawn)	OPTIONAL. Defaults to wooden box					
											
	],
	[


		
	]												
]; 
*/