
// ########### Civilian AID
_action = ["CivilianAID","Civilian AID","",{},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["civtreatment","Civil Medical Assistance","",{[false, "btc_side_fnc_civtreatment"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CivilianAID"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["mines","Clear Minefield","",{[false, "btc_side_fnc_mines"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CivilianAID"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["supply","Support IDAP Humanitarian Efforts","",{[false, "btc_side_fnc_supply"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CivilianAID"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["vehicle","Roadside Assistance","",{[false, "btc_side_fnc_vehicle"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CivilianAID"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["removeRubbish","Remove Rubbish","",{[false, "btc_side_fnc_removeRubbish"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CivilianAID"], _action] call ace_interact_menu_fnc_addActionToObject;

// ########### Combat Rescue

_action = ["CombatRescue","Combat Rescue","",{},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["rescue","Pilot Mayday","",{[false, "btc_side_fnc_rescue"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CombatRescue"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["hostage","Rescue Hostage","",{[false, "btc_side_fnc_hostage"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CombatRescue"], _action] call ace_interact_menu_fnc_addActionToObject;


// ########### Ambush Convoy

_action = ["AmbushConvoy","Ambush Convoy","",{},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["convoy","Convoy","",{[false, "btc_side_fnc_convoy"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","AmbushConvoy"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["captureOfficer","Capture Officer","",{[false, "btc_side_fnc_capture_officier"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","AmbushConvoy"], _action] call ace_interact_menu_fnc_addActionToObject;


// ########### CBRN/EW

_action = ["CBRNEW","CBRN / EW","",{},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;


_action = ["chemical_leak","Chemical Leak","",{[false, "btc_side_fnc_chemicalLeak"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CBRNEW"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["emp","EMP","",{[false, "btc_side_fnc_emp"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CBRNEW"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Hack","Hack Missle","",{[false, "btc_side_fnc_hack"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","CBRNEW"], _action] call ace_interact_menu_fnc_addActionToObject;


// ########### Assault

_action = ["Assault","Assault","",{},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["checkpoint","Checkpoint","",{[false, "btc_side_fnc_checkpoint"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","Assault"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["get_city","Liberate Settlement","",{[false, "btc_side_fnc_get_city"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","Assault"], _action] call ace_interact_menu_fnc_addActionToObject;

_action = ["Tower","Destroy Tower","",{[false, "btc_side_fnc_tower"] remoteExec ["btc_side_fnc_create", 2];},{true}] call ace_interact_menu_fnc_createAction;
[cvo_jobboard, 0, ["ACE_MainActions","Assault"], _action] call ace_interact_menu_fnc_addActionToObject;



