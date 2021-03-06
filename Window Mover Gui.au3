#include <StaticConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#Include <GuiButton.au3>
#include <GuiListView.au3>
#include <EditConstants.au3>

$hGUI = GUICreate(StringTrimRight(@ScriptName, 4),500,470,-1,-1,-1,$WS_EX_TOPMOST)
GUISetOnEvent($GUI_EVENT_CLOSE, "_Exit", $hGUI)
$listWinTable = GUICtrlCreatelistview("Enabled|Title|X|Y|W|H",0,0,500,152,$LVS_SINGLESEL,BitOr($LVS_EX_FULLROWSELECT,$WS_EX_CLIENTEDGE))
GUICtrlSetOnEvent(-1,"_EditSelectedListItem")
GUICtrlSetState(-1,BitOr($GUI_SHOW,$GUI_ENABLE,$GUI_NOFOCUS,$GUI_BKCOLOR_LV_ALTERNATE))
GUICtrlSetBkColor(-1,"0xE0E0E0")
GUICtrlSetTip(-1,"Select a window from the list then click on a header to edit below.")
$btnEnableToggle = GUICtrlCreateButton("Enable/Disable",101,160,100,30,-1,-1)
GUICtrlSetOnEvent(-1,"_ToggleEnabled")
$btnRemove = GUICtrlCreateButton("Remove",309,160,100,30,-1,-1)
GUICtrlSetOnEvent(-1,"_RemoveWindowFromList")
$btnGetWin = GUICtrlCreateButton("Click here once then on window to get it's info",135,218,230,30,-1,-1)
GUICtrlSetOnEvent(-1,"_GetWinInfo")
$inputTitle = GUICtrlCreateInput("",149,270,198,20,$ES_CENTER,$WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1,"Does not have to be full title. i.e. 'Internet Explorer' vs the URL of active page.")
$inputX = GUICtrlCreateInput("",120,307,50,20,$ES_CENTER,$WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1,"Top Left X Coordinate")
$inputY = GUICtrlCreateInput("",198,307,50,20,$ES_CENTER,$WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1,"Top Left Y Coordinate")
$inputW = GUICtrlCreateInput("",279,307,50,20,$ES_CENTER,$WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1,"Optional: Window Width")
$inputH = GUICtrlCreateInput("",359,307,50,20,$ES_CENTER,$WS_EX_CLIENTEDGE)
GUICtrlSetTip(-1,"Optional: Window Height")
$btnAddWindow = GUICtrlCreateButton("Add Window",200,331,100,30,-1,-1)
GUICtrlSetOnEvent(-1,"_AddWindowToList")
$btnTestSettings = GUICtrlCreateButton("Test",399,331,38,30,-1,-1)
GUICtrlSetOnEvent(-1,"_TestWinMove")
$radioMenu = GUICtrlCreateRadio("Open Menu",23,422,100,20,-1,-1)
GUICtrlSetState(-1,BitOr($GUI_CHECKED,$GUI_SHOW,$GUI_ENABLE))
$radioMoveWindows = GUICtrlCreateRadio("Move Windows",23,446,100,20,-1,-1)
GUICtrlSetState(-1,BitOr($GUI_UNCHECKED,$GUI_SHOW,$GUI_ENABLE))
GUICtrlSetTip(-1,"Will require editing the config manually to reopen this menu")
$btnSave = GUICtrlCreateButton("Save",154,400,100,30,-1,-1)
GUICtrlSetOnEvent(-1,"_SaveToConfig")
$btnClose = GUICtrlCreateButton("Close",259,400,100,30,-1,-1)
GUICtrlSetOnEvent(-1,"_CloseGui")
GUICtrlCreateGroup("",49,206,400,164,-1,-1)
GUICtrlSetBkColor(-1,"0xF0F0F0")
GUICtrlCreateLabel("Title:",238,255,23,15,$SS_CENTER,-1)
GUICtrlSetBkColor(-1,"-2")
GUICtrlCreateLabel("X:",100,310,20,15,$SS_CENTER,-1)
GUICtrlSetBkColor(-1,"-2")
GUICtrlCreateLabel("Y:",178,310,20,15,$SS_CENTER,-1)
GUICtrlSetBkColor(-1,"-2")
GUICtrlCreateLabel("W:",259,310,20,15,$SS_CENTER,-1)
GUICtrlSetBkColor(-1,"-2")
GUICtrlCreateLabel("H:",339,310,20,15,$SS_CENTER,-1)
GUICtrlSetBkColor(-1,"-2")
GUICtrlCreateLabel("Default Run Option:",23,381,80,33,$SS_CENTER,-1)
GUICtrlSetFont(-1,10,700,0,"")
GUICtrlSetTip(-1,"Double click action")
GUICtrlCreateLabel("Made by Amraki",410,431,82,15,$SS_CENTER,-1)
GUICtrlSetOnEvent(-1,"_CopyGithubToClipboard")
GUICtrlSetBkColor(-1,"-2")
GUICtrlSetTip(-1,"github.com/Amraki")
GUICtrlCreateLabel("with AutoIt",410,451,82,15,$SS_CENTER,-1)
GUICtrlSetOnEvent(-1,"_CopyAutoItURLToClipboard")
GUICtrlSetBkColor(-1,"-2")
GUICtrlSetTip(-1,"autoitscript.com")
$labelStatus = GUICtrlCreateLabel("",125,442,250,25,$SS_CENTER,-1)
GUICtrlSetState(-1,BitOr($GUI_SHOW,$GUI_ENABLE,$GUI_NOFOCUS))
GUICtrlSetBkColor(-1,"-2")
