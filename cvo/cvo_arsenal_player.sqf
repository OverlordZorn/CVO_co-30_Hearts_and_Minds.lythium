// Define PLayers additional loadout

private _individualKit = [];

if (player getVariable ["Officer",false]) then {
	systemChat "Officer detected";
	_individualKit append CVO_A_Officer;
	_individualKit append CVO_A_TeamLeader;
	_individualKit append CVO_A_RTO;
};
if (player getVariable ["Interpreter",false]) then {
	systemChat "Interpreter detected";
	_individualKit append CVO_A_Officer;
};


if (player getVariable ["TeamLeader",false]) then {
	systemChat "TeamLeader detected";
	_individualKit append CVO_A_TeamLeader;
};
if (player getVariable ["Medic",false]) then {
	systemChat "Medic detected";
	_individualKit append CVO_A_Medic;
};
if (player getVariable ["MG",false]) then {
	systemChat "MG detected";
	_individualKit append CVO_A_MG;
};
if (player getVariable ["AT",false]) then {
	systemChat "AT detected";
	_individualKit append CVO_A_AT;
};
if (player getVariable ["AA",false]) then {
	systemChat "AA detected";
	_individualKit append CVO_A_AA;
};
if (player getVariable ["Marksman",false]) then {
	systemChat "Marksman detected";
	_individualKit append CVO_A_Marksman;
};
if (player getVariable ["Rifleman",false]) then {
	systemChat "Rifleman detected";
	_individualKit append CVO_A_Rifleman;
};


if (player getVariable ["EW",false]) then {
	systemChat "EW detected";
	_individualKit append CVO_A_EW;
	_individualKit append CVO_A_RTO;
};


if (player getVariable ["CBRN",false]) then {
	systemChat "CBRN detected";
	_individualKit append CVO_A_CBRN;
};
if (player getVariable ["Engineer",false]) then {
	systemChat "Engineer detected";
	_individualKit append CVO_A_Engineer;
};

systemChat str (count _individualKit);
[CVO_arsenal, _individualKit, false] call ace_arsenal_fnc_addVirtualItems;
[CVO_arsenal_1, _individualKit, false] call ace_arsenal_fnc_addVirtualItems;
[CVO_arsenal_2, _individualKit, false] call ace_arsenal_fnc_addVirtualItems;