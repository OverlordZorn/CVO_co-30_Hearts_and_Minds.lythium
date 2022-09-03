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
 * ["leaveBase"] call cvo_fnc_music;
 *
 * Public: i guess so?
*/


params [
	["_playlist", "", [""]]
	];


if (_playlist == "") exitWith {diag_log "[CVO] [MUSIC] - no playlist defined"};

diag_log ("[CVO] [MUSIC] - playlist: "+ str _playlist);

private _song;
private _selection;

_selection = switch (_playlist) do {
	case "leavebase": {
		[
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

_song = _selection call BIS_fnc_selectRandom;
diag_log ("[CVO] [MUSIC] - song: "+ str _song);
_song remoteExec ["playMusic", -2, false]; 
diag_log ("[CVO] [MUSIC] - playing.");
