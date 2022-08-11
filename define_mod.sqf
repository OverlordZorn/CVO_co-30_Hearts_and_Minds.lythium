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
private _weapons = [];

private _attachments = [];

private _magazines = [];

private _items = [];

private _radio = ["tf_anprc152", "ACRE_BF888S"] select (isClass(configFile >> "cfgPatches" >> "acre_main"));

private _itemsMedical = [];

private _uniforms = [    ];

private _uniformsCBRN = ["U_C_CBRN_Suit_01_Blue_F", "U_B_CBRN_Suit_01_White_F"];
private _uniformsSniper = [];

private _vests = [];

private _helmets = [];

private _hoods = [];

private _hoodCBRN = ["G_AirPurifyingRespirator_01_F"];
private _laserdesignators = [];
private _night_visions = [];
private _weapons_machineGunner = [];
private _weapons_sniper = [];
private _bipods = [];

private _pistols = [];

private _launcher_AT = [];
private _launcher_AA = [];

private _backpacks = [];

private _backpacks_big = [];

private _backpacksUAV = [];
private _backpackCBRN = [];

btc_custom_arsenal = [_weapons, _attachments, _magazines, _items, _radio, _itemsMedical, _uniforms, _uniformsCBRN, _vests, _helmets, _hoods, _hoodCBRN, _weapons_machineGunner, _weapons_sniper, _pistols, _launcher_AT, _launcher_AA, _backpacks, _backpacks_big, _backpacksUAV,_backpackCBRN];
btc_arsenal_loadout = [_uniforms, _uniformsCBRN, _uniformsSniper, _vests, _helmets, _hoods, [_hoodCBRN, _hoodCBRN, _hoodCBRN, _hoodCBRN], _laserdesignators, _night_visions, _weapons, _weapons_sniper, _weapons_machineGunner, _bipods, _pistols, _launcher_AT, _launcher_AA, _backpacks, _backpacks_big, [_backpackCBRN, _backpackCBRN, _backpackCBRN, _backpackCBRN], [_radio, _radio, _radio, _radio]];
