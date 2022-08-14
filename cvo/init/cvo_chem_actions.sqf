CVO_chemDetector_sound_mode = 2;

private _action = [
	"CVO_chemDetector_sound_mode", 
	"Chemical Detector", 
	"\A3\Weapons_F_Enoch\Items\data\ui\gear_ChemicalDetector_01_CA.paa", 
	{}, 
	{"ChemicalDetector_01_watch_F" in (assignedItems player)}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_Equipment"], _action] call ace_interact_menu_fnc_addActionToObject;

private _action = [
	"CVO_chemDetector_sound_mode_2", 
	"Enable Speakers", 
	"", 
	{CVO_chemDetector_sound_mode = 2}, 
	{CVO_chemDetector_sound_mode != 2}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_Equipment", "CVO_chemDetector_sound_mode"], _action] call ace_interact_menu_fnc_addActionToObject;


_action = [
	"CVO_chemDetector_sound_mode_1", 
	"Connect Headphones", 
	"", 
	{CVO_chemDetector_sound_mode = 1}, 
	{CVO_chemDetector_sound_mode != 1}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_Equipment", "CVO_chemDetector_sound_mode"], _action] call ace_interact_menu_fnc_addActionToObject;


_action = [
	"CVO_chemDetector_sound_mode_0", 
	"Disable Sound", 
	"", 
	{CVO_chemDetector_sound_mode = 0}, 
	{CVO_chemDetector_sound_mode != 0}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions", "ACE_Equipment", "CVO_chemDetector_sound_mode"], _action] call ace_interact_menu_fnc_addActionToObject;