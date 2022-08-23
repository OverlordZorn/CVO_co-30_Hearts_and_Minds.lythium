// https://ace3.acemod.org/wiki/framework/fortify-framework.html

// ################################################
// 1. Define current Fortify Budget, Objects and Prices

if (isServer) then {
[west, 5000, [
	["Land_HBarrier_3_F", 15],
	["Land_HBarrier_5_F", 25],
	["Land_HBarrier_Big_F", 10],
	["Land_HBarrier_1_F", 50],
	["Land_HBarrierWall_corridor_F", 50],
	["Land_HBarrierWall_corner_F", 50],
	["Land_HBarrierWall_corner_F", 50],
	["Land_HBarrierWall6_F", 50],
	["Land_HBarrierWall4_F", 50],
	["Land_HBarrierTower_F", 50],
	["Land_BagBunker_Tower_F", 100],
	["Land_BagBunker_Large_F", 100],
	["Land_BagBunker_Small_F", 50],
	["Land_BagFence_Long_F", 50],
	["Land_BagFence_Short_F", 25],
	["Land_SandbagBarricade_01_half_F", 25],
	["Land_SandbagBarricade_01_F", 25],
	["Land_SandbagBarricade_01_hole_F", 25],
	["Land_BagFence_Round_F", 25],
	["Land_Razorwire_F", 15],
	["Land_CncWall1_F", 50],
	["Land_CncWall4_F", 200],
	["Land_CncBarrierMedium4_F", 100],
	["Land_CncBarrierMedium_F", 20],
	["Land_CncBarrier_F", 10],
	["Land_Concrete_SmallWall_4m_F", 10],
	["Land_Concrete_SmallWall_8m_F", 20]
]] call ace_fortify_fnc_registerObjects;
};

// ################################################
// 2. Define Additional Conditions to use Fortify 

cvo_engineerVehicleClass = "UK3CB_KRG_B_MTLB_PKT";

[{
	params ["_unit", "_object", "_cost"];

	private _condition1 = (_unit) getVariable ["Engineer", false];
	
	private _condition2 = 1 >= cvo_engineerVehicleClass countType (_unit nearEntities ["Tank",100]); // scans near entities, filtered by tanks. Then counts the amount of 

	private _case1 = if (_condition1) then {true}
		else {"You're not an engineer" remoteExec ["hint", _unit];false};

	private _case2 = if (_condition2) then {true}
		else {"You're to far away from the Engineering Vehicle" remoteExec ["hint", _unit];false};

	_case1 && _case2;
}] call ace_fortify_fnc_addDeployHandler;


// ################################################
// 3. Replenish building supplies when fortify_vehicle is close enough to tbc_create_object, current maximum loaded: 5000

private _code = {
	[{
		[
			"Replenish the Fortify Budget",	// Title of progressBar
			10,								// Duration of progressBar in secounds
			{true},							// Condition, will check every frame
			{
				_currentBudget = [west] call ace_fortify_fnc_getBudget;	
				if (_currentBudget > 4000) then {											// if current Fortify Budget is more then MAX - refillQuantity, top off until max.
					[west,(5000 - _currentBudget), true] call ace_fortify_fnc_updateBudget;
				} else { [west, 1000, true] call ace_fortify_fnc_updateBudget; }			// if current FortifyBudget is less then MAX - RefillQuantity, add refillQuantity.
			}								// codeblock to be executed on completion
		] call CBA_fnc_progressBar;			// Executing a CBA progressBar from an Ace Interaction results in crash. Delay execution by 1 frame!!!
	}] call CBA_fnc_execNextFrame;			// <- this will delay the execution by 1 Frame. 
}; 											// This is the code you want the interaction to execute.


// Here we create the action which we later attach to something
_cvo_Fort_refillVehicle = [
	"CVO_Fort_refillVehicle",				// Action Name
	"Replenish the Building Supplies",		// Name for the ACE Interaction Menu
	"",										// Statement - i have no fucking clue what that is supposed to mean
	_code,									// the code you're executing
	{
		(1 >= cvo_engineerVehicleClass countType (btc_create_object_point nearEntities ["Tank",15])) && ([west] call ace_fortify_fnc_getBudget < 5000);
	}										// Condition for action to be shown:
] call ace_interact_menu_fnc_createAction;

// Here we define where we want this action that we created to be attached to
[
	btc_create_object,						// Object the action should be assigned to
	0,										// Type of action, 0 for action, 1 for self-actionIDs
	["ACE_MainActions","Fortify"],					// Parent path of the new action <Array>
	_cvo_Fort_refillVehicle							// The Ace_action to be attached
] call ace_interact_menu_fnc_addActionToObject;		// Alternative: ace_interact_menu_fnc_addActionToObject 




// ################################################
// 4. Change Presets to have 2 short lists instead of 1 long.

// -> HBarrier Preset 
private _code_p1 = {
	[{
		[
			"Switching Fortify Blueprints",	// Title of progressBar
			3,								// Duration of progressBar in secounds
			{true},							// Condition, will check every frame
			{
				_currentBudget = [west] call ace_fortify_fnc_getBudget;	

				[west, _currentBudget, [
					["Land_HBarrier_1_F", 10],
					["Land_HBarrier_3_F", 15],
					["Land_HBarrier_5_F", 25],
					["Land_HBarrier_Big_F", 20],
					["Land_HBarrierWall_corridor_F", 50],
					["Land_HBarrierWall_corner_F", 50],
					["Land_HBarrierWall_corner_F", 50],
					["Land_HBarrierWall6_F", 50],
					["Land_HBarrierWall4_F", 50],
					["Land_HBarrierTower_F", 200]
				]] remoteExec  ["ace_fortify_fnc_registerObjects", 2];
			}								// codeblock to be executed on completion
		] call CBA_fnc_progressBar;			// Executing a CBA progressBar from an Ace Interaction results in crash. Delay execution by 1 frame!!!
	}] call CBA_fnc_execNextFrame;			// <- this will delay the execution by 1 Frame. 
}; 											// This is the code you want the interaction to execute.


_cvo_Fort_preset1 = [
	"CVO_Fort_preset1",						// Action Name
	"Get Sandbag Blueprints",				// Name for the ACE Interaction Menu
	"",										// Statement - i have no fucking clue what that is supposed to mean
	_code_p1,									// the code you're executing
	{true}										// Condition for action to be shown:
] call ace_interact_menu_fnc_createAction;

// -> Sandbag Preset
private _code_p2 = {
	[{
		[
			"Switching Fortify Blueprints",	// Title of progressBar
			3,								// Duration of progressBar in secounds
			{true},							// Condition, will check every frame
			{
				_currentBudget = [west] call ace_fortify_fnc_getBudget;	

				[west, _currentBudget, [
					["Land_BagBunker_Tower_F", 100],
					["Land_BagBunker_Large_F", 100],
					["Land_BagBunker_Small_F", 50],
					["Land_BagFence_Long_F", 50],
					["Land_BagFence_Short_F", 25],
					["Land_SandbagBarricade_01_half_F", 25],
					["Land_SandbagBarricade_01_F", 25],
					["Land_SandbagBarricade_01_hole_F", 25],
					["Land_BagFence_Round_F", 25]
				]] remoteExec ["ace_fortify_fnc_registerObjects", 2];
			}								// codeblock to be executed on completion
		] call CBA_fnc_progressBar;			// Executing a CBA progressBar from an Ace Interaction results in crash. Delay execution by 1 frame!!!
	}] call CBA_fnc_execNextFrame;			// <- this will delay the execution by 1 Frame. 
}; 											// This is the code you want the interaction to execute.


// Here we create the action which we later attach to something
_cvo_Fort_preset2 = [
	"CVO_Fort_preset2",						// Action Name
	"Get Sand Back Blueprints",				// Name for the ACE Interaction Menu
	"",										// Statement - i have no fucking clue what that is supposed to mean
	_code_p2,									// the code you're executing
	{true}										// Condition for action to be shown:
] call ace_interact_menu_fnc_createAction;


// -> Concrete n Shit Preset
private _code_p3 = {
	[{
		[
			"Switching Fortify Blueprints",	// Title of progressBar
			3,								// Duration of progressBar in secounds
			{true},							// Condition, will check every frame
			{
				_currentBudget = [west] call ace_fortify_fnc_getBudget;	

				[west, _currentBudget, [
					["Land_Razorwire_F", 15],
					["Land_CncWall1_F", 50],
					["Land_CncWall4_F", 200],
					["Land_CncBarrierMedium4_F", 100],
					["Land_CncBarrierMedium_F", 20],
					["Land_CncBarrier_F", 10],
					["Land_Concrete_SmallWall_4m_F", 10],
					["Land_Concrete_SmallWall_8m_F", 20],
					["Land_Sawmill_01_illuminati_tower_F", 250],
					["Land_LampShabby_F",50],
					["Land_LampHarbour_F",50],
					["Land_LampHalogen_F",50]

				]] remoteExec  ["ace_fortify_fnc_registerObjects", 2];
			}								// codeblock to be executed on completion
		] call CBA_fnc_progressBar;			// Executing a CBA progressBar from an Ace Interaction results in crash. Delay execution by 1 frame!!!
	}] call CBA_fnc_execNextFrame;			// <- this will delay the execution by 1 Frame. 
}; 											// This is the code you want the interaction to execute.


// Here we create the action which we later attach to something
_cvo_Fort_preset3 = [
	"CVO_Fort_preset3",						// Action Name
	"Get Concrete and Other Blueprints",	// Name for the ACE Interaction Menu
	"",										// Statement - i have no fucking clue what that is supposed to mean
	_code_p3,									// the code you're executing
	{true}										// Condition for action to be shown:
] call ace_interact_menu_fnc_createAction;




// Here we define where we want this action that we created to be attached to
{[
	cvo_engineerVehicleClass,						// Object the action should be assigned to
	0,												// Type of action, 0 for action, 1 for self-actionIDs
	["ACE_MainActions"],							// Parent path of the new action <Array>
	_x												// The Ace_action to be attached
] call ace_interact_menu_fnc_addActionToClass;		// Alternative: ace_interact_menu_fnc_addActionToObject 
} forEach [_cvo_Fort_preset1,_cvo_Fort_preset2,_cvo_Fort_preset3];
