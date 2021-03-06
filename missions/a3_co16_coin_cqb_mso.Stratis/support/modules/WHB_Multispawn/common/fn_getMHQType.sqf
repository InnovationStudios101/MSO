/* ----------------------------------------------------------------------------
Function: MSO_fnc_getMHQType 

Description:
Determines the MHQ Vehicle type or FOB Building type  based on the HQ Object supplied.

Parameters:
- HQ Object 

Returns:
- MHQ Object 

Examples:
(begin example)
[mhqObject] call MSO_fnc_getMHQType;
(end)

See Also:
- <MSO_fnc_deployHQ>
- <MSO_fnc_undeployHQ>

Author:
WobbleyheadedBob aka CptNoPants
---------------------------------------------------------------------------- */

private ["_MHQtype","_mhq"];
_mhq = _this select 0;

switch (typeOf _mhq) do
{
	//BLUFOR
	case "LAV25_HQ_unfolded":	{_MHQtype = "LAV25_HQ";};
	case "LAV25_HQ":	{_MHQtype = "LAV25_HQ_unfolded";};
	
	case "BMP2_HQ_CDF_unfolded":	{_MHQtype = "BMP2_HQ_CDF";};
	case "BMP2_HQ_CDF":	{_MHQtype = "BMP2_HQ_CDF_unfolded";};
	
	case "M1130_HQ_unfolded_EP1":	{_MHQtype = "M1130_CV_EP1";};
	case "M1130_CV_EP1":	{_MHQtype = "M1130_HQ_unfolded_EP1";};
	
	case "M1130_HQ_unfolded_Base_EP1":	{_MHQtype = "M1130_CV_EP1";};
	//case "M1130_CV_EP1":	{_MHQtype = "M1130_HQ_unfolded_Base_EP1";};
	
	case "cwr2_M113_HQ_Unfolded":	{_MHQtype = "cwr2_M113_HQ";};
	case "cwr2_M113_HQ":	{_MHQtype = "cwr2_M113_HQ_Unfolded";};
	
	//OPFOR
	case "BTR90_HQ_unfolded":	{_MHQtype = "BTR90_HQ";};
	case "BTR90_HQ":	{_MHQtype = "BTR90_HQ_unfolded";};
	
	case "BMP2_HQ_INS_unfolded":	{_MHQtype = "BMP2_HQ_INS";};
	case "BMP2_HQ_INS":	{_MHQtype = "BMP2_HQ_INS_unfolded";};
	
	case "BMP2_HQ_TK_unfolded_EP1":	{_MHQtype = "BMP2_HQ_TK_EP1";};
	case "BMP2_HQ_TK_EP1":	{_MHQtype = "BMP2_HQ_TK_unfolded_EP1";};
	
	case "BMP2_HQ_TK_unfolded_Base_EP1":	{_MHQtype = "BMP2_HQ_TK_EP1";};
	//case "BMP2_HQ_TK_EP1"	{_MHQtype = "BMP2_HQ_TK_unfolded_Base_EP1";};
	
	//Independent
	case "BRDM2_HQ_Gue_unfolded":	{_MHQtype = "BRDM2_HQ_Gue";};
	case "BRDM2_HQ_Gue":	{_MHQtype = "BRDM2_HQ_Gue_unfolded";};
	
	case "BRDM2_HQ_TK_GUE_unfolded_EP1":	{_MHQtype = "BRDM2_HQ_TK_GUE_EP1";};
	case "BRDM2_HQ_Gue":	{_MHQtype = "BRDM2_HQ_Gue_unfolded";};
	
	case "BRDM2_HQ_TK_GUE_unfolded_Base_EP1":	{_MHQtype = "BRDM2_HQ_TK_GUE_EP1";};
	case "BRDM2_HQ_TK_GUE":	{_MHQtype = "BRDM2_HQ_TK_GUE_unfolded_EP1";};	
	//case "BRDM2_HQ_TK_GUE":	{_MHQtype = "BRDM2_HQ_TK_GUE_unfolded_Base_EP1";};
//-------------------------------------------------------------------------------------------------
	Default 
	{
		//Do nothing for all other vehicles
		_MHQtype = "non_mhq_vehicle";
	};
};

_MHQtype