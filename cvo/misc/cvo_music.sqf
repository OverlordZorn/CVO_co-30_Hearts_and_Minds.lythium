/* WIP
 * Author: Zorn
 * Plays random music from premade playlists
 *
 * Arguments:
 * 0: premade playlist <string>
 * Return Value:
 * None
 *
 * Example:
 * ["INITZEUS"] call cvo_fnc_music;
 * ["leaveBase"] call cvo_fnc_music;
 *
 * Public: i guess so?
*/


params [	["_playlist", "", [""]]];


if (_playlist == "") exitWith {diag_log "[CVO] [MUSIC] - no playlist defined"};
if (_playlist isEqualTo "INITZEUS") exitWith {

	_action = ["cvo_music_zeus_node","CVO Music","\A3\ui_f\data\igui\cfg\simpleTasks\types\m_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction;
	[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

	_action = ["cvo_music_zeus_playlists","Playlists","\A3\ui_f\data\igui\cfg\simpleTasks\types\documents_ca.paa",{},{true}] call ace_interact_menu_fnc_createAction;
	[["ACE_ZeusActions","cvo_music_zeus_node"], _action] call ace_interact_menu_fnc_addActionToZeus;

	_action = ["cvo_music_zeus_pl_leaveBase","Leave Base","\A3\ui_f\data\igui\cfg\simpleTasks\types\takeoff_ca.paa",{["leaveBase"] call cvo_fnc_music},{true}] call ace_interact_menu_fnc_createAction;
	[["ACE_ZeusActions","cvo_music_zeus_node","cvo_music_zeus_playlists"], _action] call ace_interact_menu_fnc_addActionToZeus;

	diag_log ("[CVO] [MUSIC] - Zeus Actions Established");
};


diag_log format ["[CVO] [MUSIC] - playlist: %1", _playlist];

private _song;
private _selection;

_selection = switch (_playlist) do {
	case "leaveBase": {
		[	
			"papers",
			"CVO1",
			"AmbientTrack01_F",
			"AmbientTrack01a_F",
			"AmbientTrack01b_F",
			"AmbientTrack03_F",
			"AmbientTrack04_F",
			"LeadTrack02a_F_EPB",
			"LeadTrack03a_F_EPB",
			"EventTrack01_F_EPB",
			"EventTrack01a_F_EPB",
			"EventTrack04_F_EPB",
			"EventTrack04a_F_EPB",
			"AmbientTrack01_F_EPB",
			"BackgroundTrack01_F_EPB",
			"LeadTrack01_F_EPC",
			"LeadTrack06_F_EPC",
			"LeadTrack06b_F_EPC",
			"EventTrack01_F_EPC",
			"BackgroundTrack01_F_EPC",
			"BackgroundTrack02_F_EPC",
			"BackgroundTrack03_F_EPC",
			"BackgroundTrack04_F_EPC",
			"MAD",
			"SkyNet",
			"Wasteland",
			"Defcon",
			"Fallout",
			"LeadTrack02_F_Jets",
			"LeadTrack01_F_Orange",
			"AmbientTrack02_F_Orange",
			"AmbientTrack01_F_Orange",
			"AmbientTrack01_F_EXP",
			"AmbientTrack01a_F_EXP",
			"LeadTrack01_F_Tacops",  
			"LeadTrack02_F_Tacops",
			"LeadTrack03_F_Tacops"
		];
	};
}; 
diag_log format ["[CVO] [MUSIC] - Selection: %1.",_selection];

_song = _selection call BIS_fnc_selectRandom;


_song remoteExec ["playMusic", -2, false]; 
diag_log format ["[CVO] [MUSIC] - playing song: %1.",_song];
