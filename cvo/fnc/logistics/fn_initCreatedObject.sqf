params ["_object"];

private _action = [
    "CVO_Logistics_Action",
    localize "STR_BTC_HAM_ACTION_LOC_MAIN",
    "\A3\ui_f\data\igui\cfg\simpleTasks\letters\L_ca.paa",
    {},
    { 
		params ["_cargo"];
		isNull isVehicleCargo _cargo;
	}
] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = [
    "CVO_Logistics_LoadInCargo_Action",
    "Load in cargo",
    "",
    {
    	params ["_cargo"];
    	[_cargo] call CVO_fnc_logistics_loadInCargo;
    },
    { 
		params ["_cargo"];
		isNull isVehicleCargo _cargo;
    },
    {},
    [_object]
] call ace_interact_menu_fnc_createAction;
[_object, 0, ["ACE_MainActions", "CVO_Logistics_Action"], _action] call ace_interact_menu_fnc_addActionToObject;