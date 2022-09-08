/*
    Author: Skippie

    Description:
        Function used in chemical detector userAction event handler. 
        Handles the detector screen update when it is open.

    Parameter(s):
        0: BOOL - user action activated


    Returns:
        NONE

    Examples:
        addUserActionEventHandler ["Watch", "Activate", cvo_cbrn_fnc_eventHandler_uiDetector];
*/

systemChat "handler triggered";

if ((!visibleWatch) && ("ChemicalDetector_01_watch_F" in (assignedItems player))) then {
    private ["_ui", "_uiDetector"];

    systemChat "detector in inventory and watch is not visible";

    _ui = uiNamespace getVariable "RscWeaponChemicalDetector";
    _uiDetector = _ui displayCtrl 101;

    [{visibleWatch},
    {
        params ["_uiDetector"];
        // Update screen
        [{
            params ["_args", "_id"];
            _args params [["_uiDetector", controlNull, [controlNull]]];

            private ["_level"];

            if (!visibleWatch) exitWith {
                [_id] call CBA_fnc_removePerFrameHandler;
            };

            if (btc_chem_contaminated isEqualTo []) exitWith {
                _uiDetector ctrlAnimateModel ["Threat_Level_Source", 0, true];
            };

            _level = selectMin (btc_chem_contaminated apply {player distance _x});

            if (_level < btc_chem_range) then {
                _level = 5.0;
            } else {
                _level = (floor ((btc_chem_range / _level)*50))/10;
            };

            systemChat str _level;

            _uiDetector ctrlAnimateModel ["Threat_Level_Source", _level, true];
        }, 0.3, [_uiDetector]] call CBA_fnc_addPerFrameHandler;

        // Play sound
        [{
            params ["_args", "_id"];

            private ["_level", "_sound"];

            if (!visibleWatch) exitWith {
                [_id] call CBA_fnc_removePerFrameHandler;
            };

            if (btc_chem_contaminated isEqualTo []) exitWith {};

            _level = selectMin (btc_chem_contaminated apply {player distance _x});

            if (_level < btc_chem_range) then {
                _level = 5.0;
            } else {
                _level = (floor (btc_chem_range / _level * 10)) / 2;
            };

            if (_level < 0.5) exitWith {};

            _sound = "cvo_detector_beep_3";
            if (_level < 4.0) then {
                _sound = "cvo_detector_beep_2";
            };
            if (_level < 2.0) then {
                _sound = "cvo_detector_beep_1";
            };

            systemChat _sound;

            switch (CVO_chemDetector_sound_mode) do {
                case 1: { playSoundUI [_sound, 1]; };
                case 2: { [player, _sound, 30] remoteExec ["say3D", -2]; };
                default {};
            };
        }, 1.5, []] call CBA_fnc_addPerFrameHandler;
    }, [_uiDetector]] call CBA_fnc_waitUntilAndExecute;
};