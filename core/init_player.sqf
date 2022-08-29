btc_map_mapIllumination = ace_map_mapIllumination;
if !(isNil "btc_custom_loc") then {
    {
        _x params ["_pos", "_cityType", "_cityName", "_radius"];
        private _location = createLocation [_cityType, _pos, _radius, _radius];
        _location setText _cityName;
    } forEach btc_custom_loc;
};
btc_intro_done = [] spawn btc_respawn_fnc_intro;

[{!isNull player}, {
    [] call compileScript ["core\doc.sqf"];

    btc_respawn_marker setMarkerPosLocal player;
    player addRating 9999;
    ["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

    [player] call btc_eh_fnc_player;

     private _arsenal_trait = player call btc_arsenal_fnc_trait;
    if (btc_p_arsenal_Restrict isEqualTo 3) then {
        [_arsenal_trait select 1] call btc_arsenal_fnc_weaponsFilter;
    };
    [] call btc_int_fnc_add_actions;
    [] call btc_int_fnc_shortcuts;

    if (player getVariable ["interpreter", false]) then {
        player createDiarySubject ["btc_diarylog", localize "STR_BTC_HAM_CON_INFO_ASKHIDEOUT_DIARYLOG", '\A3\ui_f\data\igui\cfg\simpleTasks\types\talk_ca.paa'];
    };

    if (cvo_p_arsenal_loadout) then {
        player setVariable ["CVO_Loadout", getUnitLoadout player]; systemChat "Loadout saved";                                                           // set default loadout at spawn
        player addEventHandler ["Respawn", { player setUnitLoadout (player getVariable ["CVO_Loadout", []]);diag_log "[CVO] [LOADOUT]" +  (str player + " Loadout loaded"); }];            // adds EH when respawning, using the previously saved loadout 
        [compileScript ["cvo\cvo_arsenal_loadout.sqf"]] call CBA_fnc_directCall;                                                                        // adds Paperwork Interaction
        private _id = ["ace_arsenal_displayClosed", {player setVariable ["CVO_Loadout", getUnitLoadout player];diag_log "[CVO] [LOADOUT]" + (str player + " Loadout saved");}] call CBA_fnc_addEventHandler;     // adds EH setting the loadout when closing the arsenal
        diag_log "[CVO] [LOADOUT]" + (str player + " CVO_Loadout completed");
    } else {
        switch (btc_p_autoloadout) do {
            case 1: {
                player setUnitLoadout ([_arsenal_trait select 0] call btc_arsenal_fnc_loadout);
            };
            case 2: {
                removeAllWeapons player;
            };
            default {
            };
        };
    };

    [] call btc_respawn_fnc_screen;

    if (btc_debug) then {
        addMissionEventHandler ["MapSingleClick", {
            params ["_units", "_pos", "_alt", "_shift"];
            if (
                alive player &&
                !_alt &&
                !_shift
            ) then {
                vehicle player setPos _pos;
            };
        }];
        player allowDamage false;

        [{!isNull (findDisplay 12)}, {
            ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", btc_debug_fnc_marker];
        }] call CBA_fnc_waitUntilAndExecute;
    };
}] call CBA_fnc_waitUntilAndExecute;
