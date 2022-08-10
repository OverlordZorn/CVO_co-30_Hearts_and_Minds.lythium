// Enables cvo custom Arsenal, based on Role, defined by setVariable / getVariable.

// Adding a custom sub item category
//// Adding a Medical Tab
private _medicalTab = [
	"ACE_quikclot", "ACE_packingBandage","ACE_elasticBandage", "ACE_fieldDressing",
	"ACE_tourniquet", "ACE_splint",
    "ACE_morphine","ACE_epinephrine", "ACE_adenosine", 
	"ACE_salineIV", "ACE_salineIV_500","ACE_salineIV_250",
	"ACE_plasmaIV","ACE_plasmaIV_500","ACE_plasmaIV_250",
    "ACE_bloodIV","ACE_bloodIV_500","ACE_bloodIV_250",
    "ACE_surgicalKit","ACE_personalAidKit","ACE_bodyBag"
];

[_medicalTab, "Medical", "cvo\img\redCrystal.paa"] call ace_arsenal_fnc_addRightPanelButton;

// Defining Custom Arsenal Pools
//// Basic Kit, for everyone

_CVO_A_Basic = [] + _CVO_A_Basic_Medical;

_CVO_A_Basic_Medical = [
	//"ACE_quikclot", 
	"ACE_packingBandage",
	//"ACE_elasticBandage", 
	"ACE_fieldDressing",
	"ACE_tourniquet", 
	"ACE_splint",
    "ACE_morphine",
	"ACE_epinephrine", 
	//"ACE_adenosine", 
	"ACE_salineIV", 
	"ACE_salineIV_500",
	"ACE_salineIV_250",
	//"ACE_plasmaIV",
	//"ACE_plasmaIV_500",
	//"ACE_plasmaIV_250",
    //"ACE_bloodIV",
	//"ACE_bloodIV_500",
	//"ACE_bloodIV_250",
    "ACE_surgicalKit",
	"ACE_personalAidKit",
	"ACE_bodyBag"
];



//// Specific Kit, for certain "Roles" only

_CVO_A_Officer = [];

_CVO_A_Interpreter = [];

_CVO_A_TeamLeader = [];

_CVO_A_Medic = [];

_CVO_A_MG = [];

_CVO_A_Marksman = [];

_CVO_A_AT = [];

_CVO_A_AA = [];

_CVO_A_Engineer = [];

_CVO_A_CBRN = [];





/*
 * Author: Alganthe, Dedmen
 * Add virtual items to the provided target.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Items <ARRAY of strings> <BOOL>
 * 2: Add globally <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_box, ["item1", "item2", "itemN"]] call ace_arsenal_fnc_addVirtualItems
 * [_box, true, false] call ace_arsenal_fnc_addVirtualItems
 *
 * Public: Yes
*/

_cvo_addToArsenal = _CVO_A_Basic

[cvo_test_crate, _cvo_addToArsenal, false] call ace_arsenal_fnc_addVirtualItems;



// if (cvo_p_custom_ace_arsenal) exitWith {};