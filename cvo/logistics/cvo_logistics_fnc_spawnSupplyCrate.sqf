// Defines the Params
_parameter = _this select 2;
_parameter params["_BoxType", "_spawnloc", "_name", "_array", "_backpacks"];

_spawnPos = getPosATL _spawnloc;
_spawnPos set [2, ((_spawnPos select 2) + 1)];

diag_log ("[CVO] [LOGISTICS] (CSC) - " + _name + " - Start");


// spawn the desired box at the desired location.

_box = createVehicle [_BoxType, _spawnPos,[],2,"CAN_COLLIDE"]; 		
diag_log ("[CVO] [LOGISTICS] (CSC) - " + _name + " - Box Created");


// set the custom name for Ace Cargo
_box setVariable ["ace_cargo_customname", _name, true];


// Empties the inventory of the Box
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;
diag_log ("[CVO] [LOGISTICS] (CSC) - " + _name + " - Cleared Default Inventory");


// Fills the Box with anything in the array that isnt a backpack
if (count _array > 0) then {
	{_box addItemCargoGlobal [_x select 0, _x select 1];} forEach _array;
};

// Fills the Box with with backpacks
if (count _backpacks > 0) then {
	{_box addBackpackCargoGlobal [_x select 0, _x select 1];} forEach _backpacks;
};
diag_log ("[CVO] [LOGISTICS] (CSC) - " + _name + " - Added Custom Inventory");

[_box] remoteExec ["btc_log_fnc_init", 2];

diag_log ("[CVO] [LOGISTICS] (CSC) - " + _name + " - Spawning Complete");
