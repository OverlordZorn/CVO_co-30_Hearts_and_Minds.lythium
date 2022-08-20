
[compileScript ["core\init.sqf"]] call CBA_fnc_directCall;


[compileScript ["cvo\cvo_init.sqf"]] call CBA_fnc_directCall;


cvo_fnc_music = compile preprocessFile "cvo\cvo_music.sqf";