#include <macro.h>
/*
	File: fn_initSkin.sqf
	Author : Gordon
	Description:
	Init the skin for BluFor and Adac Side !
*/
while {true} do
	{
	if(license_civ_adac) then
	{
        player setObjectTextureGlobal[0,"textures\adac_uniform.paa"];
        
        };
    };
	sleep 2;//safe some cpu
};