// Define PLayers additional loadout

private _individualKit = [];


switch (true) do		// i hope you choke on a horsecock, callum.
{
	case (player getVariable ["Officer",false]): 		{systemChat "Officer detected";		_individualKit append CVO_A_Officer; _individualKit append CVO_A_TeamLeader; _individualKit append CVO_A_RTO;};
	case (player getVariable ["Interpreter",false]): 	{systemChat "Interpreter detected";	_individualKit append CVO_A_Officer;};
	case (player getVariable ["TeamLeader",false]):		{systemChat "TeamLeader detected"; 	_individualKit append CVO_A_TeamLeader;};
	case (player getVariable ["Medic",false]):			{systemChat "Medic detected";		_individualKit append CVO_A_Medic;};
	case (player getVariable ["MG",false]):				{systemChat "MG detected";			_individualKit append CVO_A_MG;};
	case (player getVariable ["AT",false]):				{systemChat "AT detected";			_individualKit append CVO_A_AT;};
	case (player getVariable ["AA",false]):				{systemChat "AA detected";			_individualKit append CVO_A_AA;};
	case (player getVariable ["Marksman",false]):		{systemChat "Marksman detected";	_individualKit append CVO_A_Marksman;};
	case (player getVariable ["Rifleman",false]):		{systemChat "Rifleman detected";	_individualKit append CVO_A_Rifleman;};
	case (player getVariable ["EW",false]):				{systemChat "EW detected";			_individualKit append CVO_A_EW; 	_individualKit append CVO_A_RTO;};
	case (player getVariable ["CBRN",false]):			{systemChat "CBRN detected";		_individualKit append CVO_A_CBRN;};
	case (player getVariable ["Engineer",false]):	 	{systemChat "Engineer detected";	_individualKit append CVO_A_Engineer;};
};

systemChat str (count _individualKit);

{[_x, _individualKit, false] call ace_arsenal_fnc_addVirtualItems;} forEach CVO_arsenal_array;