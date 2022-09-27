/* WIP
 * Author: Zorn, Targetingsnake
 * Adds Ace Action to spawn an AmmoCrate and fills it with a custom Array.
 *
 * Arguments:
 * 0: Target supplySpawner, where the ace action should be added <OBJECT>
 * 1: Name of the supplyCrateAction <string>
 * 2: Nested Array of content EXCEPT BACKPACKS [["class0", amount], ["classN",#]] <Nested Array>
 * 3: Class of Crate to be used <OBJECT> <Optional - Default: "LandWoodenBox_F">
 * 4: Nested Array of Content BACKPACKS Only [[class0, #], [classN,#]] <Nested Array > <optional - Default: []>
 * 5: Spawn Location - ideally a invisible helipad or Tarp_01_Large_Black_F <Object> <optional - default: objNull>
 * 
 * Return Value:
 * None
 *
 * Example:
 * [btc_create_object, "Monkey Care Package",[["Ace_banana", 100],["ace_maptools",100]]] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToObject;
 * [btc_create_object, "CBRN Package", [["U_C_CBRN_Suit_01_Blue_F",6],["G_RegulatorMask_F",6]],"LandWoodenBox_F",objNull,[["B_SCBA_01_F",6]]] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToObject;
 * 
 *
 * Public: maybe idfk
 *
 *
 * TODO:
 *	- Adapt befor usage outside of HAM: _spawnloc adjust default/fail
 *
*/

params [
	["_spawner", ""],
	["_name", "defaultName", ["String"]],
	["_array",[]],
	["_BoxType","Land_WoodenBox_F", ["String"]],
	["_backpacks", []],
	["_spawnloc", objNull]
];

// Failstate
if (_spawner == "" || _Name == "") exitWith {};

// if (_spawnloc == objNull) then {_spawnloc = "REL"};
_spawnloc = "REL";

// diag_log ("[CVO] [LOGISTICS] (CSC) Adding Ace Action for " + str _name);


// Adapts Names for the Ace action
private _actionname = ("CVO_spawnbox_" + str _name);
private _actionstring =     ("Spawn: " + str _name);

// Creates the Ace Action with the above mentioned code block, and brings the parameters from the function into the code block.
private _action = [
	_actionname,													// Action Name
	_actionstring,													// Name for the ACE Interaction Menu
	"",																// Custom Icon 
	{_this call cvo_logistics_fnc_spawnSupplyCrate},				// Statement
	{true},															// Condition
	{},
	[_BoxType, _spawnloc, _name, _array, _backpacks]
] call ace_interact_menu_fnc_createAction;

// Here we define where we the above mentioned action can be called from
[
	_spawner,										// Class the action should be assigned to
	0,												// Type of action, 0 for action, 1 for self-actionIDs
	["ACE_MainActions"],							// Parent path of the new action <Array>
	_action
] call ace_interact_menu_fnc_addActionToClass;		// Alternative: ace_interact_menu_fnc_addActionToClass 

diag_log ("[CVO] [LOGISTICS] (CSC) - Added Ace Action for " + _name);


