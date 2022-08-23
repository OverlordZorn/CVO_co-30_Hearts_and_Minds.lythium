/* WIP
 * Author: Zorn
 * Adds Ace Action to spawn an AmmoCrate and fills it with a custom Array.
 *
 * Arguments:
 * 0: Target supplySpawner <OBJECT>
 * 1: Name of the supplyCrate <string>
 * 2: Nested Array of content EXCEPT BACKPACKS [[class0, amount], [classN,#]] <Nested Array>
 * 3: Class of Crate to be used <OBJECT> <Optional - Default: "LandWoodenBox_F">
 * 4: Spawn Location - ideally a invisible helipad or Tarp_01_Large_Black_F <Object> <optional - default: objNull>
 * 5: Nested Array of Content BACKPACKS Only [[class0, #], [classN,#]] <Nested Array > <optional - Default: []>
 * 
 * Return Value:
 * None
 *
 * Example:
 * [btc_create_object, "Monkey Care Package",[["Ace_banana", 100],["ace_maptools",100]]] call cvo_logistics_fnc_addSupplybox;
 * [btc_create_object, "CBRN Package", [["U_C_CBRN_Suit_01_Blue_F",6],["G_RegulatorMask_F",6]],"LandWoodenBox_F",objNull,[["B_SCBA_01_F",6]]] call cvo_logistics_fnc_addSupplybox;
 * 
 *
 * Public: maybe idfk
*/

params [
	["_spawner", objNull, [objNull]],
	["_name", "defaultName", ["String"]],
	["_array",[], [[]]],
	["_spawnloc", objNull, [objNull]],
	["_BoxType","Land_WoodenBox_F", ["String"]],
	["_backpacks", [],[[]]]
];

if (_spawner == objNull || _Name == "") exitWith {};
if (_spawner == btc_create_object) then {
	_spawnloc = btc_create_object_point;
};


//systemChat ("fnc _BoxType: " + str _BoxType);
//systemChat ("fnc _spawnloc: " + str _spawnloc);
//systemChat ("fnc _array: " + str _array);
//systemChat ("fnc _backpacks: " + str _backpacks);



// This is the code to be executed when the Ace Action is executed
_code = {
	systemChat "Code Start.";

	// Defines the Params
	params["_BoxType", "_spawnloc", "_name", "_array", "_backpacks"];

	//	_BoxType = "Land_WoodenBox_F";
	//	_spawnPos = [12231.1,17316.6,1];
	//	_array = [["Ace_banana", 100],["ace_maptools",100]];

	systemChat ("code _BoxType: " + str _BoxType);
	systemChat ("code _spawnloc: " + str _spawnloc);
	systemChat ("code _array: " + str _array);
	systemChat ("code _backpacks: " + str _backpacks);

	_spawnPos = getPosATL _spawnloc;
	_spawnPos set [2, ((_spawnPos select 2) + 1)];

	// spawn the desired box at the desired location.

	systemChat ("code _spawnPos: " + str _spawnPos);
	_box = createVehicle [_BoxType, _spawnPos,[],2,"CAN_COLLIDE"]; 		
	//_box = _BoxType createVehicle _spawnPos;

	// set the custom name for Ace Cargo
	_box setVariable ["ace_cargo_customname", _name];
	
	systemChat ("code _box: "+ str _box);

	// Empties the inventory of the Box
	clearItemCargoGlobal _box;

	// Fills the Box with anything in the array that isnt a backpack
	if (count _array > 0) then {
		{_box addItemCargoGlobal [_x select 0, _x select 1];} forEach _array;
	};

	// Fills the Box with with backpacks
	if (count _backpacks > 0) then {
		{_box addBackpackCargo [_x select 0, _x select 1];} forEach _backpacks;
	};
};


// Adapts Names for the Ace action
private _actionname = ("CVO_spawnbox_" + str _name);
private _actionstring =     ("Spawn: " + str _name);


// Creates the Ace Action with the above mentioned code block, and brings the parameters from the function into the code block.
private _action = [
	_actionname,													// Action Name
	_actionstring,													// Name for the ACE Interaction Menu
	"",																// Custom Icon 
	[_BoxType, _spawnloc, _name, _array, _backpacks] call _code,	// Statement
	{true}															// Condition
] call ace_interact_menu_fnc_createAction;

// Here we define where we the above mentioned action can be called from
[
	_spawner,										// Class the action should be assigned to
	0,												// Type of action, 0 for action, 1 for self-actionIDs
	["ACE_MainActions"],							// Parent path of the new action <Array>
	_action
] call ace_interact_menu_fnc_addActionToObject;		// Alternative: ace_interact_menu_fnc_addActionToClass 



