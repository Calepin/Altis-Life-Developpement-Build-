/*
                File: fn_BipBipCamion.sqf
                Author: Jennova
*/

private["_Automobile","_vitesseX"];

if (!BipBipOn) then {

                _Automobile = _this select 0;

                if (isNil "_Automobile" OR isNull _Automobile) exitWith {
                               hint format ["Vous n'êtes pas dans un véhicule !"];
                };
               
                while {(alive _Automobile)} do {

                               _VitesseX = speed _Automobile;

                               if (_VitesseX > 0) exitWith {};
                              
                               _Automobile say3D "bipbip_camion";

                               sleep (_this select 1); 
                };

                BipBipOn = true;
                publicVariable "BipBipOn";
};