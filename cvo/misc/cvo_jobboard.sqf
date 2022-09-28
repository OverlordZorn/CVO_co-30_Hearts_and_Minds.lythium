
// ########### Civilian AID
_action = ["CivilianAID","Civilian AID","",{},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["civtreatment","Civil Medical Assistance","",{[false, "btc_side_fnc_civtreatment"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CivilianAID"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["mines","Clear Minefield","",{[false, "btc_side_fnc_mines"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CivilianAID"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["supply","Support IDAP Humanitarian Efforts","",{[false, "btc_side_fnc_supply"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CivilianAID"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["vehicle","Roadside Assistance","",{[false, "btc_side_fnc_vehicle"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CivilianAID"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["removeRubbish","Remove Rubbish","",{[false, "btc_side_fnc_removeRubbish"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CivilianAID"], _action] call ace_interact_menu_fnc_addActionToObject;


// ########### Combat Rescue

_action = ["CombatRescue","Combat Rescue","",{},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["rescue","Pilot Mayday","",{[false, "btc_side_fnc_rescue"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CombatRescue"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["hostage","Rescue Hostage","",{[false, "btc_side_fnc_hostage"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CombatRescue"], _action] call ace_interact_menu_fnc_addActionToObject;


// ########### Ambush Convoy

_action = ["AmbushConvoy","Ambush Convoy","",{},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["convoy","Convoy","",{[false, "btc_side_fnc_convoy"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","AmbushConvoy"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["captureOfficer","Capture Officer","",{[false, "btc_side_fnc_capture_officier"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","AmbushConvoy"], _action] call ace_interact_menu_fnc_addActionToObject;


// ########### CBRN/EW

_action = ["CBRNEW","CBRN / EW","",{},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;


_action = ["chemical_leak","Chemical Leak","",{[false, "btc_side_fnc_chemicalLeak"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CBRNEW"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["emp","EMP","",{[false, "btc_side_fnc_emp"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CBRNEW"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Hack","Hack Missle","",{[false, "btc_side_fnc_hack"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CBRNEW"], _action] call ace_interact_menu_fnc_addActionToObject;


// ########### Assault

_action = ["Assault","Assault","",{},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["checkpoint","Checkpoint","",{[false, "btc_side_fnc_checkpoint"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","Assault"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["get_city","Liberate Settlement","",{[false, "btc_side_fnc_get_city"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","Assault"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Tower","Destroy Tower","",{[false, "btc_side_fnc_tower"]	spawn btc_side_fnc_create;},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","Assault"], _action] call ace_interact_menu_fnc_addActionToObject;



