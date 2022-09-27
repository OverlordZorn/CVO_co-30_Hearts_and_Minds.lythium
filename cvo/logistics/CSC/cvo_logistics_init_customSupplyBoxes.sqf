cvo_logistics_fnc_addCustomSupplyBoxAceActionToObject = compileScript ["cvo\logistics\csc\cvo_logistics_fnc_addCustomSupplyBoxAceActionToObject.sqf", false, ""];
cvo_logistics_fnc_addCustomSupplyBoxAceActionToClass = compileScript ["cvo\logistics\csc\cvo_logistics_fnc_addCustomSupplyBoxAceActionToClass.sqf", false, ""];
cvo_logistics_fnc_spawnSupplyCrate = compileScript ["cvo\logistics\csc\cvo_logistics_fnc_spawnSupplyCrate.sqf", false, ""];

/* 
// ################
// adds the packages to a specific object

cvo_csc_source_object = btc_create_object
[
	cvo_csc_source_object, 
	"Monkey Care Package",
	[
		["Ace_banana", 100],
		["Ace_banana", 100]
	],
	"Land_WoodenCrate_01_F"
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToObject;
*/

/*

[
	cvo_csc_source_object, 
	"Basic Ammo Package",
	[
		["rhs_10Rnd_762x54mmR_7N1", 30],
		["rhs_30Rnd_545x39_7N10_AK", 30],
		["rhs_100Rnd_762x54mmR_green", 6]
	],
	"rhs_3Ya40_1_single"
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToObject;


[
	cvo_csc_source_object, 
	"Combat Patrol Package",
	[
		["ACE_bodyBag", 10],
		["ACE_personalAidKit", 5],
		["ACE_salineIV_500", 5],
		["ACE_Humanitarian_Ration", 10],
		["ace_marker_flags_red", 25],
		["ace_marker_flags_green", 25],
		["ACE_EarPlugs", 10],
		["ACE_SpraypaintRed", 2],
		["ACE_CableTie", 20],
		["ACE_HandFlare_White", 10],
		["rhs_30Rnd_545x39_7N10_AK", 10],
		["rhs_weap_rsp30_white", 20],
		["rhs_VG40OP_white", 20]
	],
	"rhs_7ya37_1_single",
	[
		["B_Respawn_TentDome_F",1]
	]
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToObject;

[
	cvo_csc_source_object, 
	"Night Fight Package",
	[
		["ACE_HandFlare_White", 50],
		["rhs_30Rnd_545x39_AK_green", 10],
		["rhs_weap_rsp30_white", 50],
		["rhs_VG40OP_white", 50],
		["rhs_weap_ak74m_gp25", 1]

	],
	"rhs_7ya37_1_single"
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToObject;

[
	cvo_csc_source_object, 
	"PKM Package",
	[
		["rhs_weap_pkm",1],
		["rhs_100Rnd_762x54mmR", 10],
		["rhs_100Rnd_762x54mmR_green", 10]
	],
	"rhs_7ya37_1_single"
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToObject;



[
	cvo_csc_source_object, 
	"Metis HAT Package",
	[
		["ACE_EntrenchingTool",1],
		["ace_compat_rhs_afrf3_metis_carry", 1],
		["ace_compat_rhs_afrf3_mag_9M131F", 3],
		["ace_compat_rhs_afrf3_mag_9M131M", 7]
	],
	"Land_WoodenCrate_01_F"							 
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToObject;


[
	cvo_csc_source_object, 
	"CBRN Package",
	[
		["U_C_CBRN_Suit_01_Blue_F", 4],
		["G_RegulatorMask_F", 4]
	],
	"Land_PlasticCase_01_large_CBRN_F",									
	[
		["B_SCBA_01_F",4]
	]
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToObject;

*/


// ################
// adds the packages to a specific className, in this case, ammo truck
cvo_csc_source_class = "UK3CB_CW_SOV_O_LATE_Gaz66_Ammo";


[
	cvo_csc_source_class, 
	"Basic Ammo Package",
	[
		["rhs_10Rnd_762x54mmR_7N1", 30],
		["rhs_30Rnd_545x39_7N10_AK", 30],
		["rhs_100Rnd_762x54mmR_green", 6]
	],
	"rhs_3Ya40_1_single"
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToClass;


[
	cvo_csc_source_class, 
	"Combat Patrol Package",
	[
		["ACE_bodyBag", 10],
		["ACE_personalAidKit", 5],
		["ACE_salineIV_500", 5],
		["ACE_Humanitarian_Ration", 10],
		["ace_marker_flags_red", 25],
		["ace_marker_flags_green", 25],
		["ACE_EarPlugs", 10],
		["ACE_SpraypaintRed", 2],
		["ACE_CableTie", 20],
		["ACE_HandFlare_White", 10],
		["rhs_30Rnd_545x39_7N10_AK", 10],
		["rhs_weap_rsp30_white", 20],
		["rhs_VG40OP_white", 20]
	],
	"rhs_7ya37_1_single",
	[
		["B_Respawn_TentDome_F",1]
	]
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToClass;

[
	cvo_csc_source_class, 
	"Night Fight Package",
	[
		["ACE_HandFlare_White", 50],
		["rhs_30Rnd_545x39_AK_green", 10],
		["rhs_weap_rsp30_white", 50],
		["rhs_VG40OP_white", 50],
		["rhs_weap_ak74m_gp25", 1]

	],
	"rhs_7ya37_1_single"
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToClass;

[
	cvo_csc_source_class, 
	"PKM Package",
	[
		["rhs_weap_pkm",1],
		["rhs_100Rnd_762x54mmR", 10],
		["rhs_100Rnd_762x54mmR_green", 10]
	],
	"rhs_7ya37_1_single"
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToClass;



[
	cvo_csc_source_class, 
	"Metis HAT Package",
	[
		["ACE_EntrenchingTool",1],
		["ace_compat_rhs_afrf3_metis_carry", 1],
		["ace_compat_rhs_afrf3_mag_9M131F", 3],
		["ace_compat_rhs_afrf3_mag_9M131M", 7]
	],
	"Land_WoodenCrate_01_F"							 
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToClass;


[
	cvo_csc_source_class, 
	"CBRN Package",
	[
		["U_C_CBRN_Suit_01_Blue_F", 4],
		["G_RegulatorMask_F", 4]
	],
	"Land_PlasticCase_01_large_CBRN_F",									
	[
		["B_SCBA_01_F",4]
	]
] call cvo_logistics_fnc_addCustomSupplyBoxAceActionToClass;

