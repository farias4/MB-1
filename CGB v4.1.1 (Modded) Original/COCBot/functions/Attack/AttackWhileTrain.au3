; #FUNCTION# ====================================================================================================================
; Name ..........: AttackWhileTrain
; Description ...: During the idle loop, if $chkAttackWhileTrain is checked, the bot will attack with a partial army
;                  and return after 20 searches to profit from idle time.
;                  VillageSearch() was modified to break search after 20 loops.
;                  2 variables are used for this function.
;                  Global $chkAttackWhileTrain, $isAttackWhileTrain
; Syntax ........:
; Parameters ....: None
; Return values .: False if not enough troops, True if 20 searches was successfully done.
; Author ........: farias
; Modified ......:
; Remarks .......: This file is part of ClashGameBot. Copyright 2015
;                  ClashGameBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........:
; Example .......:
; ===============================================================================================================================

Func AttackWhileTrain()
  If $fullArmy = True Then
	  SetLog("AttackWhileTrain() called incorrectly, army is full!")
	EndIf
  ; Attempt only when army has reached set limit
  If $TotalCamp * $fulltroop < 1 Then
 Return False
  EndIf

  ; go to search for 20 times
  SetLog("Attacking with partial army", $COLOR_RED)
  $isAttackWhileTrain = True
  $Is_ClientSyncError = Fals
  AttackMain()
  $Restart = False ; Sets $Restart as True to end search after 10 attempts
  $Is_ClientSyncError = False
  $isAttackWhileTrain = False
  SetLog("End attacking with partial army", $COLOR_RED)

  Return True

EndFunc