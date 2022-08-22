/* WIP
 * Author: Zorn
 * Adds custom supplycrate to supply spawner.
 *
 * Arguments:
 * 0: Target supplySpawner <OBJECT>
 * 1: Name of the supplyCrate <string>
 * 2: Nested Array of content EXCEPT BACKPACKS [[class0, amount], [classN,#]] <Nested Array>
 * 3: Class of Crate to be used <OBJECT> <Optional>
 * 4: Spawn Location - ideally a invisible helipad or Tarp_01_Large_Black_F <Object> <optional>
 * 5: Nested Array of Content BACKPACKS Only [[class0, #], [classN,#]] <Nested Array>
 * Return Value:
 * None
 *
 * Example:
 * [btc_create_object, "Monkey Care Package",[["Ace_banana", 100],["ace_maptools",100]]] call cvo_logistics_fnc_addSupplybox;123
 * 
 *
 * Public: maybe idfk
*/

params [
	["_spawner", objNull, [objNull]],
	["_name", "defaultName", ["string"]],
	["_array",[], [[]]],
	["_spawnloc", objNull, [objNull]],
	["_BoxType","Land_WoodenBox_F", ["string"]],
	["_backpacks", [],[[]]]
];

systemChat "test1";
if (_spawner == objNull || _Name == "") exitWith {};
if (_spawner == btc_create_object) then {
	_spawnloc = btc_create_object_point;
};

systemChat "test2";

private _code = {
	private _test1 = _BoxType;
	systemChat "testincode1";
	_box = createVehicle [_test1, getPos _spawnloc,[],5,"NONE"];
	systemChat "testincode2";
	clearItemCargoGlobal _box;
	systemChat "testincode3";

	if (count _array > 0) then {
		{
			_box addItemCargoGlobal [_x select 0, _x select 1];
		} forEach _array;
	};

	if (count _backpacks > 0) then {
		{
			_box addBackpackCargo [_x select 0, _x select 1];
		} forEach _backpacks;

	};
};

systemChat "test3";


private _actionname = ("CVO_spawnbox_"+str _name);
private _actionstring = ("Spawn: " + str _name);

private _action = [
	_actionname,							// Action Name
	_actionstring,							// Name for the ACE Interaction Menu
	"",										// Custom Icon 
	_code,									// Statement
	{true}									// Condition
] call ace_interact_menu_fnc_createAction;

systemChat "test4";


// Here we define where we want this action that we created to be attached to
[
	_spawner,								// Class the action should be assigned to
	0,										// Type of action, 0 for action, 1 for self-actionIDs
	["ACE_MainActions"],					// Parent path of the new action <Array>
	_action
] call ace_interact_menu_fnc_addActionToObject;		// Alternative: ace_interact_menu_fnc_addActionToClass 


systemChat "test5";
