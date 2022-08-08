/*
 *
 * Author: Dr. Zorn 
 * Adds an Ace Interaction to a vehicle class so players can perform a fullheal with a progressbar (30s) on said vehicle.
 */


_cvo_fullAceHeal = [
	"CVO_FullHeal",
	"Get Full CheckUp",
	"",
	{
		[
			"Get Treated",	// title of progress bar
			30,				// time for the progress bar to complete
			{true},			// Execute every frame. If reports false, close the progress bar
			{[ace_player] call ace_medical_treatment_fnc_fullHealLocal} // Code on completion
		] call CBA_fnc_progressBar;
	},
	{true}
] call ace_interact_menu_fnc_createAction;


[
	UK3CB_KDF_O_Gaz66_Med,		// Object the action should be assigned to
	0,							// Type of action, 0 for action, 1 for self-actionIDs
	["ACE_MainActions"],		// Parent path of the new action <Array>
	_cvo_fullAceHeal
] call ace_interact_menu_fnc_addActionToClass;