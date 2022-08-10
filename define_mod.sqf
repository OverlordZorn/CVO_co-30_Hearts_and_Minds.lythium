btc_custom_loc = [
/*
    DESCRIPTION: [POS(Array),TYPE(String),NAME(String),RADIUS (Number),IS OCCUPIED(Bool)]
    Possible types: "NameVillage","NameCity","NameCityCapital","NameLocal","Hill","Airport","NameMarine", "StrongpointArea", "BorderCrossing", "VegetationFir"
    EXAMPLE: [[13132.8,3315.07,0.00128174],"NameVillage","Mountain 1",800,true]
*/
];

/*
    Here you can tweak spectator view during respawn screen.
*/
BIS_respSpecAi = false;                  // Allow spectating of AI
BIS_respSpecAllowFreeCamera = false;     // Allow moving the camera independent from units (players)
BIS_respSpecAllow3PPCamera = false;      // Allow 3rd person camera
BIS_respSpecShowFocus = false;           // Show info about the selected unit (dissapears behind the respawn UI)
BIS_respSpecShowCameraButtons = true;    // Show buttons for switching between free camera, 1st and 3rd person view (partially overlayed by respawn UI)
BIS_respSpecShowControlsHelper = true;   // Show the controls tutorial box
BIS_respSpecShowHeader = true;           // Top bar of the spectator UI including mission time
BIS_respSpecLists = true;                // Show list of available units and locations on the left hand side

/*
    Here you can specify which equipment should be added or removed from the arsenal.
    Please take care that there are different categories (weapons, magazines, items, backpacks) for different pieces of equipment into which you have to classify the classnames.
    In all cases, you need the classname of an object.

    Attention: The function of these lists depends on the setting in the mission parameter (Restrict arsenal).
        - "Full": here you have only the registered items in the arsenal available.
        - "Remove only": here all registered items are removed from the arsenal. This only works for the ACE3 arsenal!

    Example(s):
        private _weapons = [
            "arifle_MX_F",          //Classname for the rifle MX
            "arifle_MX_SW_F",       //Classname for the rifle MX LSW
            "arifle_MXC_F"          //Classname for the rifle MXC
        ];

        private _items = [
            "G_Shades_Black",
            "G_Shades_Blue",
            "G_Shades_Green"
        ];
*/
private _weapons = [
/*  "rhs_weap_ak105",
    "rhs_weap_ak104",
    "rhs_weap_ak103",
    "rhs_weap_ak74m_fullplum_gp25",
    "rhs_weap_ak74m_gp25",
    "rhs_weap_ak74m_fullplum",
    "rhs_weap_ak74m_desert",
    "rhs_weap_ak74m_camo",
    "rhs_weap_ak74m"
*/];

private _attachments = [
/*    "tsp_meleeweapon_ak_pointer",
   "rhs_acc_pgo7v2",
    "rhs_acc_dtk3",
    "rhs_acc_2dpzenit_ris"
*/];

private _magazines = [
/*    "rhs_mag_9x19_17",
    "rhs_100Rnd_762x54mmR",
    "rhs_100Rnd_762x54mmR_green",
    "rhs_10Rnd_762x54mmR_7N1",
    "rhs_30Rnd_545x39_7N10_desert_AK",
    "rhs_30Rnd_545x39_7N10_camo_AK",
    "rhs_30Rnd_545x39_7N10_plum_AK",
    "rhs_30Rnd_545x39_7N10_AK",
    "rhs_30Rnd_545x39_AK_plum_green",
    "rhs_30Rnd_762x39mm_polymer_89",
    "rhs_30Rnd_762x39mm_polymer_tracer",
    "rhs_rpg7_PG7VL_mag",
    "rhs_rpg7_PG7V_mag",
    "rhs_rpg7_OG7V_mag",
    "rhs_mag_9k38_rocket"
*/];

private _items = [
/*    "ACE_wirecutter",
    "ACE_UAVBattery",
    "ACE_SpraypaintRed",
    "ACE_SpareBarrel_Item",
    "tsp_paperclip",
    "ACE_MapTools",
    "ACE_Humanitarian_Ration",
    "ACE_Fortify",
    "ACE_EntrenchingTool",
    "ACE_EarPlugs",
    "ACE_DefusalKit",
    "ACE_CableTie",
    "immersion_pops_poppack",
    "murshun_cigs_lighter",
    "murshun_cigs_cigpack",
    "murshun_cigs_matches",
    "acex_intelitems_notepad"
*/];

private _radio = ["tf_anprc152", "ACRE_BF888S"] select (isClass(configFile >> "cfgPatches" >> "acre_main"));

private _itemsMedical = [
/*    "ACE_bodyBag",
    "ACE_surgicalKit",
    "ACE_tourniquet",
    "ACE_splint",
    "ACE_morphine",
    "ACE_epinephrine",
    "ACE_salineIV",
    "ACE_salineIV_250",
    "ACE_salineIV_500",
    "ACE_quikclot",
    "ACE_packingBandage",
    "ACE_elasticBandage",
    "ACE_fieldDressing"
*/];

private _uniforms = [
    "UK3CB_TKP_B_U_CIB_CombatUniform_BLK",
    "UK3CB_TKP_B_U_CIB_CombatUniform_Shortsleeve_BLK",
    "UK3CB_TKP_I_U_CIB_CombatUniform_DBLU",
    "UK3CB_TKP_O_U_CIB_CombatUniform_Ten_1",
    "UK3CB_TKP_I_U_CombatUniform_BLK",
    "UK3CB_TKP_I_U_QRF_CombatUniform_BLK",
    "UK3CB_TKP_I_U_Officer_BLK",
    "UK3CB_TKP_O_U_Officer_Blk",
    "UK3CB_TKP_O_U_QRF_CombatUniform_Blk",
    "UK3CB_TKP_O_U_CombatUniform_Blk"
    ];

private _uniformsCBRN = ["U_C_CBRN_Suit_01_Blue_F", "U_B_CBRN_Suit_01_White_F"];
private _uniformsSniper = [];

private _vests = [
/*    "UK3CB_TKP_B_V_TacVest_Tan",
    "UK3CB_TKP_B_V_TacVest_Blk",
    "UK3CB_TKP_B_V_GA_HEAVY_BLK",
    "UK3CB_TKP_B_V_GA_LITE_BLK",
    "UK3CB_TKP_I_V_6Sh92_Radio_Tan",
    "UK3CB_TKP_I_V_6Sh92_Tan",
    "UK3CB_TKP_I_V_6Sh92_Radio_Des",
    "UK3CB_TKP_I_V_6Sh92_Des",
    "UK3CB_TKP_I_V_6Sh92_Radio_Khk",
    "UK3CB_TKP_I_V_6Sh92_Khk",
    "UK3CB_TKP_I_V_6Sh92_Radio_Blk",
    "UK3CB_TKP_I_V_6Sh92_Blk",
    "UK3CB_TKP_O_V_6b23_medic_BLK",
    "UK3CB_TKP_O_V_6b23_ML_6sh92_radio_BLK",
    "UK3CB_TKP_O_V_6b23_ml_BLK"
*/];

private _helmets = [
/*    "UK3CB_TKP_O_H_Beret",
    "UK3CB_TKP_I_H_Beret",
    "UK3CB_TKP_B_H_Beret",
    "UK3CB_TKP_O_H_Patrolcap_Off_Blk",
    "UK3CB_TKP_B_H_Patrolcap_Off_TAN",
    "UK3CB_TKP_O_H_Patrolcap_Blk",
    "UK3CB_TKP_B_H_Patrolcap_TAN",
    "UK3CB_TKA_O_H_6b7_1m_bala1_TAN",
    "UK3CB_TKA_O_H_6b7_1m_ess_bala1_TAN",
    "UK3CB_TKA_O_H_6b7_1m_bala2_DES",
    "rhs_cossack_visor_cap"
/*/];

private _hoods = [
/*    "rhsusf_shemagh_od",
    "rhsusf_shemagh2_od",
    "rhsusf_shemagh_tan",
    "rhsusf_shemagh2_tan",
  
    "rhs_scarf",
    "G_Bandanna_blk",
    "G_Bandanna_oli",
    "G_Bandanna_khk",
    "UK3CB_G_Balaclava2_BLK",
    "UK3CB_G_Balaclava2_DES",
    "G_Balaclava_blk",
    "G_Aviator"
/*/];

private _hoodCBRN = ["G_AirPurifyingRespirator_01_F"];
private _laserdesignators = [];
private _night_visions = [];
private _weapons_machineGunner = [];
private _weapons_sniper = [];
private _bipods = [];

private _pistols = [
/*    "rhs_weap_pya",
    "tsp_meleeWeapon_okc",
    "tsp_meleeWeapon_mpl50_black",
    "tsp_meleeWeapon_ak"
/*/];

private _launcher_AT = [/*"rhs_weap_rpg7"/*/];
private _launcher_AA = [/*"rhs_weap_igla"/*/];

private _backpacks = [
/*    "UK3CB_TKA_O_B_ENG_Khk",
    "UK3CB_TKA_O_B_RIF_Khk",
    "UK3CB_TKP_I_B_ASS_MED_TAN",
    "UK3CB_TKP_O_B_ASS_MED_BLK",
    "UK3CB_TKP_O_B_ASS_BLK",
    "B_LegStrapBag_black_F",
    "B_Messenger_Black_F",
    "B_Messenger_Coyote_F",
    "B_Messenger_Gray_F",
    "rhs_rpg_empty",
    "rhs_rpg_2",
    "rhs_rpg_6b2",
    "rhs_rpg_6b3"
/*/];

private _backpacks_big = [
/*    "rhs_tortila_grey",
    "rhs_tortila_black"
/*/];

private _backpacksUAV = [
/*    
/*/];
private _backpackCBRN = [/*"B_SCBA_01_F"/*/];

btc_custom_arsenal = [_weapons, _attachments, _magazines, _items, _radio, _itemsMedical, _uniforms, _uniformsCBRN, _vests, _helmets, _hoods, _hoodCBRN, _weapons_machineGunner, _weapons_sniper, _pistols, _launcher_AT, _launcher_AA, _backpacks, _backpacks_big, _backpacksUAV,_backpackCBRN];
btc_arsenal_loadout = [_uniforms, _uniformsCBRN, _uniformsSniper, _vests, _helmets, _hoods, [_hoodCBRN, _hoodCBRN, _hoodCBRN, _hoodCBRN], _laserdesignators, _night_visions, _weapons, _weapons_sniper, _weapons_machineGunner, _bipods, _pistols, _launcher_AT, _launcher_AA, _backpacks, _backpacks_big, [_backpackCBRN, _backpackCBRN, _backpackCBRN, _backpackCBRN], [_radio, _radio, _radio, _radio]];
