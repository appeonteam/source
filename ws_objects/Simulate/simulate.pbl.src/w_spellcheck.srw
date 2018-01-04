$PBExportHeader$w_spellcheck.srw
forward
global type w_spellcheck from w_sheet
end type
type pb_spellcheck from picturebutton within w_spellcheck
end type
type mle_text from multilineedit within w_spellcheck
end type
type cb_initialize from commandbutton within w_spellcheck
end type
end forward

global type w_spellcheck from w_sheet
string title = "SpellCheck API Test"
pb_spellcheck pb_spellcheck
mle_text mle_text
cb_initialize cb_initialize
end type
global w_spellcheck w_spellcheck

type prototypes
//32-Bit Spell Checker Functions
Protected Function integer SSCE_SetKey32(ulong key) library "SSCE5532.DLL" alias for "SSCE_SetKey;Ansi"
Protected Function integer SSCE_SetRegTreeName32(String regTreeName) library "SSCE5532.DLL"  alias for "SSCE_SetRegTreeName;Ansi"
Protected Function integer SSCE_OpenSession32() library "SSCE5532.DLL" alias for "SSCE_OpenSession;Ansi"
Protected Function integer SSCE_CheckCtrlDlg32(ulong parentWin, ulong ctrlWin, integer selectedOnly) library "SSCE5532.DLL"  alias for "SSCE_CheckCtrlDlg;Ansi"
Protected Function integer SSCE_GetSid32() library "SSCE5532.DLL" alias for "SSCE_GetSid;Ansi"
Protected Function integer SSCE_CheckString32(integer sid, ref String str, ref long strcursor, ref String errWord, integer errWordSz, ref String otherWord, integer otherWordSz) library "SSCE5532.DLL"  alias for "SSCE_CheckString;Ansi"
Protected Function long SSCE_CheckBlockDlg32(ulong parentWin, ref String TextBlock, long TextLen,  long TextSize, integer showContext) library "SSCE5532.DLL" alias for "SSCE_CheckBlockDlg;Ansi"
Protected Function integer SSCE_SetMainLexPath32(String path) library "SSCE5532.DLL"  alias for "SSCE_SetMainLexPath;Ansi"
Protected Function integer SSCE_SetMainLexFiles32(String fileList) library "SSCE5532.DLL"  alias for "SSCE_SetMainLexFiles;Ansi"
Protected Function integer SSCE_SetUserLexPath32(String path) library "SSCE5532.DLL"  alias for "SSCE_SetUserLexPath;Ansi"
Protected Function integer SSCE_SetUserLexFiles32(String fileList) library "SSCE5532.DLL"  alias for "SSCE_SetUserLexFiles;Ansi"

//64-Bit Spell Checker Functions
Protected Function integer SSCE_SetKey64(ulong key) library "SSCE5564.DLL" alias for "SSCE_SetKey;Ansi"
Protected Function integer SSCE_SetRegTreeName64(String regTreeName) library "SSCE5564.DLL"  alias for "SSCE_SetRegTreeName;Ansi"
Protected Function integer SSCE_SetMainLexPath64(String path) library "SSCE5564.DLL"  alias for "SSCE_SetMainLexPath;Ansi"
Protected Function integer SSCE_SetMainLexFiles64(String fileList) library "SSCE5564.DLL"  alias for "SSCE_SetMainLexFiles;Ansi"
Protected Function integer SSCE_SetUserLexPath64(String path) library "SSCE5564.DLL"  alias for "SSCE_SetUserLexPath;Ansi"
Protected Function integer SSCE_SetUserLexFiles64(String fileList) library "SSCE5564.DLL"  alias for "SSCE_SetUserLexFiles;Ansi"
Protected Function integer SSCE_OpenSession64() library "SSCE5564.DLL" alias for "SSCE_OpenSession;Ansi"
Protected Function integer SSCE_CheckCtrlDlg64(ulong parentWin, ulong ctrlWin, integer selectedOnly) library "SSCE5564.DLL"  alias for "SSCE_CheckCtrlDlg;Ansi"
Protected Function integer SSCE_GetSid64() library "SSCE5564.DLL" alias for "SSCE_GetSid;Ansi"
Protected Function integer SSCE_CheckString64(integer sid, ref String str, ref long strcursor, ref String errWord, integer errWordSz, ref String otherWord, integer otherWordSz) library "SSCE5564.DLL"  alias for "SSCE_CheckString;Ansi"
Protected Function long SSCE_CheckBlockDlg64(ulong parentWin, ref String TextBlock, long TextLen,  long TextSize, integer showContext) library "SSCE5564.DLL" alias for "SSCE_CheckBlockDlg;Ansi"

end prototypes

type variables
Protected:

boolean ib_spellcheck_init = FALSE
CONSTANT long license_key = 401630562
CONSTANT String reg_path = "HKEY_LOCAL_MACHINE\SOFTWARE\Wintertree\SSCE"

CONSTANT String LEX_FILES = "ssceam.tlx,ssceam2.clx,accent.tlx,tech.tlx,userdic.tlx,userdic2.tlx,correct.tlx,clinical.tlx"
end variables

forward prototypes
public subroutine wf_spell_check ()
end prototypes

public subroutine wf_spell_check ();integer li_sid, li_rtn, li_err_size, li_sug_size
string ls_text, ls_sug_word, ls_err_word
long ll_start, ll_rtn, ll_len, ll_size
GraphicObject lgo_parent_object
int li_runtime_platform

ls_text = mle_text.text
IF TRIM(ls_text) = "" THEN RETURN

lgo_parent_object = this

li_runtime_platform = am.of_get_runtime_platform()
ll_start = 0
ls_text = ls_text + "0"
ls_err_word = ls_err_word + Space(81) + "0"
li_err_size = 82
ls_sug_word = ls_sug_word + Space(81) + "0"
li_sug_size = 82
ll_len = Len (ls_text)

IF li_runtime_platform = am.PLATFORM_64 THEN
	li_sid = SSCE_GetSid64()
	li_rtn = SSCE_CheckString64(li_sid, ls_text, ll_start, ls_err_word, li_err_size, ls_sug_word, li_sug_size)
ELSE
	li_sid = SSCE_GetSid32()
	li_rtn = SSCE_CheckString32(li_sid, ls_text, ll_start, ls_err_word, li_err_size, ls_sug_word, li_sug_size)
END IF

ls_text = trim(ls_text)
IF (ll_start >= 0) AND (ll_start <= Len(ls_text)) THEN
	mle_text.SelectText(1, ll_len - 1)
	mle_text.SetFocus()	
	ls_text = Mid(ls_text, 1, Len(ls_text) - 1)
	ls_text = ls_text + Space(1000)
	ll_size = Len(ls_text)

	IF li_runtime_platform = am.PLATFORM_64 THEN
		ll_rtn = SSCE_CheckBlockDlg64(Handle(lgo_parent_object), ls_text , ll_len,  ll_size, 1)
	ELSE
		ll_rtn = SSCE_CheckBlockDlg32(Handle(lgo_parent_object), ls_text , ll_len,  ll_size, 1)
	END IF
	
	IF (ll_rtn = -17) THEN
	ELSE
		ls_text = trim(ls_text)
		mle_text.ReplaceText(ls_text)
	END IF
END IF
end subroutine

on w_spellcheck.create
int iCurrent
call super::create
this.pb_spellcheck=create pb_spellcheck
this.mle_text=create mle_text
this.cb_initialize=create cb_initialize
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_spellcheck
this.Control[iCurrent+2]=this.mle_text
this.Control[iCurrent+3]=this.cb_initialize
end on

on w_spellcheck.destroy
call super::destroy
destroy(this.pb_spellcheck)
destroy(this.mle_text)
destroy(this.cb_initialize)
end on

type pb_spellcheck from picturebutton within w_spellcheck
integer x = 3003
integer y = 56
integer width = 110
integer height = 96
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "Custom038!"
alignment htextalign = left!
string powertiptext = "Perform Spell Check"
end type

event clicked;wf_spell_check()
end event

type mle_text from multilineedit within w_spellcheck
integer x = 14
integer y = 152
integer width = 3095
integer height = 1600
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type cb_initialize from commandbutton within w_spellcheck
integer x = 14
integer y = 28
integer width = 585
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Initialize Spell Check"
end type

event clicked;string ls_default_lex_path, ls_app_path
int li_rtn

ls_app_path = am.of_get_app_path()
ls_default_lex_path = ls_app_path + "\lex"
	
IF am.of_get_runtime_platform() = am.PLATFORM_64 THEN
	SSCE_SetKey64(license_key)
	SSCE_SetRegTreeName64(reg_path)
	
	li_rtn = SSCE_SetUserLexPath64(ls_default_lex_path)
	IF li_rtn <> 0 THEN
		MessageBox("SpellCheck Initialization", "SSCE_SetUserLexPath64 API Failed!!!")
		RETURN		
	END IF
	
	li_rtn = SSCE_SetUserLexFiles64(LEX_FILES)
	IF li_rtn <> 0 THEN
		MessageBox("SpellCheck Initialization", "SSCE_SetUserLexFiles64 API Failed!!!")
		RETURN
	END IF
	
	li_rtn = SSCE_SetMainLexPath64(ls_default_lex_path)
	IF li_rtn <> 0 THEN
		MessageBox("SpellCheck Initialization", "SSCE_SetMainLexPath64 API Failed!!!")
		RETURN
	END IF
	
	li_rtn = SSCE_SetMainLexFiles64(LEX_FILES)
	IF li_rtn <> 0 THEN
		MessageBox("SpellCheck Initialization", "SSCE_SetMainLexFiles64 API Failed!!!")
		RETURN
	END IF
ELSE
	SSCE_SetKey32(license_key)
	SSCE_SetRegTreeName32(reg_path)
	
	li_rtn = SSCE_SetUserLexPath32(ls_default_lex_path)
	IF li_rtn <> 0 THEN
		MessageBox("SpellCheck Initialization", "SSCE_SetUserLexPath32 API Failed!!!")
		RETURN
	END IF
	li_rtn = SSCE_SetUserLexFiles32(LEX_FILES)
	IF li_rtn <> 0 THEN
		MessageBox("SpellCheck Initialization", "SSCE_SetUserLexFiles32 API Failed!!!")
		RETURN
	END IF
	
	li_rtn = SSCE_SetMainLexPath32(ls_default_lex_path)
	IF li_rtn <> 0 THEN
		MessageBox("SpellCheck Initialization", "SSCE_SetMainLexPath32 API Failed!!!")
		RETURN
	END IF
	li_rtn = SSCE_SetMainLexFiles32(LEX_FILES)	
	IF li_rtn <> 0 THEN
		MessageBox("SpellCheck Initialization", "SSCE_SetMainLexFiles32 API Failed!!!")
		RETURN
	END IF
END IF

ib_spellcheck_init = TRUE
mle_text.Enabled = true
mle_text.Text = "inconvience"
this.enabled = false

end event

