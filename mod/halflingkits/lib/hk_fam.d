// Find Familiar: the familiar's dialogue (built by HK_FAMILIAR). Its
// master can pick it up and carry it in the pack.
BEGIN ~%hk_fm_cre%F~

IF ~True()~ THEN BEGIN hk_fm_talk
  SAY #%hk_fm_say%
  IF ~IsGabber(Player1)~ THEN REPLY #%hk_fm_take%
    DO ~SetGlobal("%hk_fm_global%","GLOBAL",2) GiveItemCreate("%hk_fm_cre%I",Player1,1,0,0) DestroySelf()~ EXIT
  IF ~~ THEN REPLY #%hk_fm_leave% EXIT
END
