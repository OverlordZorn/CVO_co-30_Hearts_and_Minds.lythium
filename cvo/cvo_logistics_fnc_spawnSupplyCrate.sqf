// Defines the Params
_parameter = _this select 2;
_parameter params["_BoxType", "_spawnloc", "_name", "_array", "_backpacks"];

_spawnPos = getPosATL _spawnloc;
_spawnPos set [2, ((_spawnPos select 2) + 1)];

// spawn the desired box at the desired location.

_box = createVehicle [_BoxType, _spawnPos,[],2,"CAN_COLLIDE"]; 		

// set the custom name for Ace Cargo
_box setVariable ["ace_cargo_customname", _name];


// Empties the inventory of the Box
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;


// Fills the Box with anything in the array that isnt a backpack
if (count _array > 0) then {
	{_box addItemCargoGlobal [_x select 0, _x select 1];} forEach _array;
};

// Fills the Box with with backpacks
if (count _backpacks > 0) then {
	{_box addBackpackCargo [_x select 0, _x select 1];} forEach _backpacks;
};


[_box] remoteExec ["btc_log_fnc_init", 2];