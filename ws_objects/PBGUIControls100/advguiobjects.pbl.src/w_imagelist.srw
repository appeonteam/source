$PBExportHeader$w_imagelist.srw
forward
global type w_imagelist from window
end type
type lv_imagelistsmall from listview within w_imagelist
end type
type lv_imagelistmedium from listview within w_imagelist
end type
type lv_imagelistlarge from listview within w_imagelist
end type
type lv_imagelistxlarge from listview within w_imagelist
end type
end forward

global type w_imagelist from window
boolean visible = false
integer width = 480
integer height = 400
boolean border = false
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
lv_imagelistsmall lv_imagelistsmall
lv_imagelistmedium lv_imagelistmedium
lv_imagelistlarge lv_imagelistlarge
lv_imagelistxlarge lv_imagelistxlarge
end type
global w_imagelist w_imagelist

type variables
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0

n_hashtable in_hashtable

CONSTANT Long SMALL = 16
CONSTANT Long MEDIUM = 24
CONSTANT Long LARGE = 32
CONSTANT Long XLARGE = 48
end variables

forward prototypes
public function long of_addimage (string as_image)
public function long of_getlargehandle ()
public function long of_getsmallhandle ()
public function long of_getxlargehandle ()
public function long of_getmediumhandle ()
public function string of_getpbimages ()
end prototypes

public function long of_addimage (string as_image);
IF Len(Trim(as_image)) = 0 THEN
	RETURN -1
END IF

IF (Right(as_image, 1) = '!' AND Pos(Lower(of_GetPBImages()), Lower(as_image), 1) = 0) THEN
	RETURN -1
END IF

IF in_hashtable.KeyExists(as_image) THEN
	RETURN Long(in_hashtable.Get(as_image))
END IF

Long ll_return

ll_return = lv_imagelistsmall.AddLargePicture ( as_image )

IF ll_return <= 0 THEN
	RETURN -1
END IF

lv_imagelistmedium.AddLargePicture ( as_image )
lv_imagelistlarge.AddLargePicture ( as_image )
lv_imagelistxlarge.AddLargePicture ( as_image )
in_hashtable.Put(as_image, ll_return)

RETURN ll_return

end function

public function long of_getlargehandle ();RETURN Send(Handle(lv_imagelistlarge), LVM_GETIMAGELIST, LVSIL_NORMAL, 0)
end function

public function long of_getsmallhandle ();RETURN Send(Handle(lv_imagelistsmall), LVM_GETIMAGELIST, LVSIL_NORMAL, 0)
end function

public function long of_getxlargehandle ();RETURN Send(Handle(lv_imagelistxlarge), LVM_GETIMAGELIST, LVSIL_NORMAL, 0)
end function

public function long of_getmediumhandle ();RETURN Send(Handle(lv_imagelistmedium), LVM_GETIMAGELIST, LVSIL_NORMAL, 0)
end function

public function string of_getpbimages ();RETURN &
'AddWatch!,'+ &
'AddWatch5!,'+ &
'AlignBottom!,'+ &
'AlignHCenter!,'+ &
'AlignLeft!,'+ &
'AlignRight!,'+ &
'AlignTop!,'+ &
'AlignVCenter!,'+ &
'Animation!,'+ &
'Application!,'+ &
'ApplicationIcon!,'+ &
'ArrangeIcons!,'+ &
'ArrangeTables!,'+ &
'ArrangeTables5!,'+ &
'Arrow!,'+ &
'AutosizeHeight!,'+ &
'Average!,'+ &
'Blob!,'+ &
'Bold!,'+ &
'Border3DLowered!,'+ &
'Border3DRaised!,'+ &
'BorderBox!,'+ &
'BorderNone!,'+ &
'BorderResize!,'+ &
'BorderShadowBox!,'+ &
'BorderUnderline!,'+ &
'BringToFront!,'+ &
'Browse!,'+ &
'BrowseClasses!,'+ &
'BrowseObject!,'+ &
'Cascade!,'+ &
'Center!,'+ &
'CheckBox!,'+ &
'CheckBox1!,'+ &
'CheckBox2!,'+ &
'CheckDiff!,'+ &
'CheckIn!,'+ &
'CheckIn5!,'+ &
'CheckStatus!,'+ &
'CheckStatus5!,'+ &
'Clear!,'+ &
'Close!,'+ &
'CommandButton!,'+ &
'CommandButton1!,'+ &
'CommandButton2!,'+ &
'Comment!,'+ &
'Compile!,'+ &
'Compute5!,'+ &
'ComputePage!,'+ &
'ComputePage5!,'+ &
'ComputeSum!,'+ &
'ComputeToday!,'+ &
'ComputeToday5!,'+ &
'ConfigODBC!,'+ &
'ConfigODBC5!,'+ &
'Continue!,'+ &
'Copy!,'+ &
'Count!,'+ &
'CreateForeignKey!,'+ &
'CreateIndex!,'+ &
'CreateLibrary!,'+ &
'CreateRuntime!,'+ &
'CreateRuntime5!,'+ &
'CreateTable!,'+ &
'CreateTable5!,'+ &
'CrossTab!,'+ &
'Cursor!,'+ &
'Custom001!,'+ &
'Custom002!,'+ &
'Custom003!,'+ &
'Custom004!,'+ &
'Custom005!,'+ &
'Custom006!,'+ &
'Custom007!,'+ &
'Custom008!,'+ &
'Custom009!,'+ &
'Custom010!,'+ &
'Custom011!,'+ &
'Custom012!,'+ &
'Custom013!,'+ &
'Custom014!,'+ &
'Custom015!,'+ &
'Custom016!,'+ &
'Custom017!,'+ &
'Custom018!,'+ &
'Custom019!,'+ &
'Custom020!,'+ &
'Custom021!,'+ &
'Custom022!,'+ &
'Custom023!,'+ &
'Custom024!,'+ &
'Custom025!,'+ &
'Custom026!,'+ &
'Custom027!,'+ &
'Custom028!,'+ &
'Custom029!,'+ &
'Custom030!,'+ &
'Custom031!,'+ &
'Custom032!,'+ &
'Custom033!,'+ &
'Custom034!,'+ &
'Custom035!,'+ &
'Custom036!,'+ &
'Custom037!,'+ &
'Custom038!,'+ &
'Custom039!,'+ &
'Custom040!,'+ &
'Custom041!,'+ &
'Custom042!,'+ &
'Custom043!,'+ &
'Custom044!,'+ &
'Custom045!,'+ &
'Custom046!,'+ &
'Custom047!,'+ &
'Custom048!,'+ &
'Custom049!,'+ &
'Custom050!,'+ &
'Custom051!,'+ &
'Custom052!,'+ &
'Custom053!,'+ &
'Custom054!,'+ &
'Custom055!,'+ &
'Custom056!,'+ &
'Custom057!,'+ &
'Custom058!,'+ &
'Custom059!,'+ &
'Custom060!,'+ &
'Custom061!,'+ &
'Custom062!,'+ &
'Custom063!,'+ &
'Custom064!,'+ &
'Custom065!,'+ &
'Custom066!,'+ &
'Custom067!,'+ &
'Custom068!,'+ &
'Custom069!,'+ &
'Custom070!,'+ &
'Custom071!,'+ &
'Custom072!,'+ &
'Custom073!,'+ &
'Custom074!,'+ &
'Custom075!,'+ &
'Custom076!,'+ &
'Custom077!,'+ &
'Custom078!,'+ &
'Custom079!,'+ &
'Custom080!,'+ &
'Custom081!,'+ &
'Custom082!,'+ &
'Custom083!,'+ &
'Custom084!,'+ &
'Custom085!,'+ &
'Custom086!,'+ &
'Custom087!,'+ &
'Custom088!,'+ &
'Custom089!,'+ &
'Custom090!,'+ &
'Custom091!,'+ &
'Custom092!,'+ &
'Custom093!,'+ &
'Custom094!,'+ &
'Custom095!,'+ &
'Custom096!,'+ &
'Custom097!,'+ &
'Custom098!,'+ &
'Custom099!,'+ &
'Custom100!,'+ &
'Custom101!,'+ &
'Cut!,'+ &
'DatabaseProfile!,'+ &
'DatabaseProfile5!,'+ &
'DataManip!,'+ &
'DataWindoW!,'+ &
'DataWindow1!,'+ &
'DataWindow2!,'+ &
'DatePicker!,'+ &
'DBAdmin!,'+ &
'DBConnect!,'+ &
'DBDisconnect!,'+ &
'Debug!,'+ &
'DeclareProcedure!,'+ &
'DeclareVariable!,'+ &
'DefaultFonts!,'+ &
'DeleteRow!,'+ &
'DeleteWatch!,'+ &
'Deploy!,'+ &
'DesignMode!,'+ &
'Destination!,'+ &
'Destination5!,'+ &
'DosEdit!,'+ &
'DropDownListBox!,'+ &
'DropDownListBox1!,'+ &
'DropDownListBox2!,'+ &
'EditDataFreeForm!,'+ &
'EditDataGrid!,'+ &
'EditDataTabular!,'+ &
'EditFuncDeclare!,'+ &
'EditMask!,'+ &
'EditMask1!,'+ &
'EditMask2!,'+ &
'EditObject!,'+ &
'EditStops!,'+ &
'EditStops5!,'+ &
'EnglishEdit!,'+ &
'EnglishQuery!,'+ &
'EnglishQuery5!,'+ &
'Environment!,'+ &
'ExecuteSQL!,'+ &
'ExecuteSQL5!,'+ &
'Exit!,'+ &
'Export!,'+ &
'Export5!,'+ &
'Find!,'+ &
'FindNext!,'+ &
'FormatDollar!,'+ &
'FormatPercent!,'+ &
'FullBuild!,'+ &
'Globals!,'+ &
'Graph!,'+ &
'Graph1!,'+ &
'Graph2!,'+ &
'Group!,'+ &
'GroupBox!,'+ &
'GroupBox1!,'+ &
'GroupBox2!,'+ &
'Having!,'+ &
'Help!,'+ &
'Horizontal!,'+ &
'HOW!,'+ &
'HProgressBar!,'+ &
'HProgressBar1!,'+ &
'HProgressBar2!,'+ &
'HScrollBar!,'+ &
'HScrollBar1!,'+ &
'HScrollBar2!,'+ &
'HTrackBar!,'+ &
'HTrackBar1!,'+ &
'HTrackBar2!,'+ &
'Import!,'+ &
'Import5!,'+ &
'IncrementalBuild!,'+ &
'Inherit!,'+ &
'InkEdit!,'+ &
'InkPicture!,'+ &
'Insert!,'+ &
'Insert5!,'+ &
'InsertReturn!,'+ &
'Italic!,'+ &
'Join!,'+ &
'Justify!,'+ &
'Layer!,'+ &
'Left!,'+ &
'Library!,'+ &
'LibraryList!,'+ &
'Line!,'+ &
'Line1!,'+ &
'Line2!,'+ &
'ListBox!,'+ &
'ListBox1!,'+ &
'ListBox2!,'+ &
'ListView!,'+ &
'ListView1!,'+ &
'ListView2!,'+ &
'Menu!,'+ &
'MonthCalendar!,'+ &
'MostRecentObject!,'+ &
'Move!,'+ &
'Move5!,'+ &
'MoveMode!,'+ &
'MultiLineEdit!,'+ &
'MultiLineEdit1!,'+ &
'MultiLineEdit2!,'+ &
'MultiLineEdit5!,'+ &
'NestedReport!,'+ &
'NestedReturn!,'+ &
'New!,'+ &
'NewspaperColumns!,'+ &
'Next!,'+ &
'Next5!,'+ &
'NotFound!,'+ &
'Ole!,'+ &
'Ole1!,'+ &
'Ole2!,'+ &
'Ole5!,'+ &
'Open!,'+ &
'Options!,'+ &
'Output!,'+ &
'OutputNext!,'+ &
'OutputPrevious!,'+ &
'OutputSkip!,'+ &
'OutputStop!,'+ &
'Oval!,'+ &
'Oval1!,'+ &
'Oval2!,'+ &
'Parameter!,'+ &
'Paste!,'+ &
'PasteArgument!,'+ &
'PasteFunction!,'+ &
'PasteGlobal!,'+ &
'PasteInstance!,'+ &
'PasteObject!,'+ &
'PasteShared!,'+ &
'PasteSpecial!,'+ &
'PasteSQL!,'+ &
'PasteSQL5!,'+ &
'PasteStatement!,'+ &
'PasteWindow!,'+ &
'Picture!,'+ &
'Picture1!,'+ &
'Picture2!,'+ &
'Picture5!,'+ &
'PictureButton!,'+ &
'PictureButton1!,'+ &
'PictureButton2!,'+ &
'PictureDropDownListBox!,'+ &
'PictureDropDownListBox1!,'+ &
'PictureDropDownListBox2!,'+ &
'PictureHyperLink!,'+ &
'PictureHyperLink1!,'+ &
'PictureHyperLink2!,'+ &
'PictureListBox!,'+ &
'PictureListBox1!,'+ &
'PictureListBox2!,'+ &
'PlaceColumn!,'+ &
'PlaceColumn5!,'+ &
'Preferences!,'+ &
'Preview!,'+ &
'Print!,'+ &
'Prior!,'+ &
'Properties!,'+ &
'Query!,'+ &
'QueryGovernor!,'+ &
'QueryLibraryList!,'+ &
'QueryLibraryList5!,'+ &
'RadioButton!,'+ &
'RadioButton1!,'+ &
'RadioButton2!,'+ &
'Rectangle!,'+ &
'Rectangle1!,'+ &
'Rectangle2!,'+ &
'Redo!,'+ &
'Regenerate!,'+ &
'Regenerate5!,'+ &
'RegistrationDir!,'+ &
'RegistrationDir5!,'+ &
'Replace!,'+ &
'Report!,'+ &
'Retrieve!,'+ &
'Retrieve5!,'+ &
'RetrieveCancel!,'+ &
'RichTextEdit!,'+ &
'RichTextEdit1!,'+ &
'RichTextEdit2!,'+ &
'Right!,'+ &
'RoundRectangle!,'+ &
'RoundRectangle1!,'+ &
'RoundRectangle2!,'+ &
'Run!,'+ &
'RunReport!,'+ &
'RunSCC!,'+ &
'RunToCursor!,'+ &
'RunWindow!,'+ &
'Save!,'+ &
'SaveAs!,'+ &
'ScriptNo!,'+ &
'ScriptYes!,'+ &
'Search!,'+ &
'SelectAll!,'+ &
'SelectAndDebug!,'+ &
'SelectAndRun!,'+ &
'SelectApplication!,'+ &
'SelectLibrary!,'+ &
'SelectObject!,'+ &
'SelectReturn!,'+ &
'SelectScript!,'+ &
'SelectStart!,'+ &
'SelectStartRemote!,'+ &
'SelectTable!,'+ &
'SelectTable5!,'+ &
'SendToBack!,'+ &
'SetDefaultClass!,'+ &
'SetNextStatement!,'+ &
'SetVariable!,'+ &
'ShowVariables!,'+ &
'ShowWatch!,'+ &
'ShowWatch5!,'+ &
'SingleLineEdit!,'+ &
'SingleLineEdit1!,'+ &
'SingleLineEdit2!,'+ &
'SingleLineEdit5!,'+ &
'SingletonReturn!,'+ &
'SizeBoth!,'+ &
'SizeHorizontal!,'+ &
'SlideAllAbove!,'+ &
'SlideDirectlyAbove!,'+ &
'SlideLeft!,'+ &
'SlideNoneAbove!,'+ &
'Sort!,'+ &
'SpaceHorizontal!,'+ &
'SpaceVertical!,'+ &
'SQL!,'+ &
'Start!,'+ &
'Start5!,'+ &
'StartPipeline!,'+ &
'StartRemoteDebugging!,'+ &
'StaticHyperLink!,'+ &
'StaticHyperLink1!,'+ &
'StaticHyperLink2!,'+ &
'StaticText!,'+ &
'staticText1!,'+ &
'StaticText2!,'+ &
'Step!,'+ &
'StepIn!,'+ &
'StepOut!,'+ &
'StepOver!,'+ &
'StopDebugging!,'+ &
'Strikethrough!,'+ &
'Structure!,'+ &
'StyleLibraryList!,'+ &
'StyleLibraryList5!,'+ &
'Synchronizer!,'+ &
'SystemTree!,'+ &
'Tab!,'+ &
'Tab1!,'+ &
'Tab2!,'+ &
'Table!,'+ &
'Tables!,'+ &
'TabOrder!,'+ &
'Tile!,'+ &
'ToDoList!,'+ &
'TreeView!,'+ &
'TreeView1!,'+ &
'TreeView2!,'+ &
'Uncomment!,'+ &
'Underline!,'+ &
'Undo!,'+ &
'UnionReturn!,'+ &
'Update!,'+ &
'Update5!,'+ &
'UpdateReturn!,'+ &
'UserObject!,'+ &
'UserObject1!,'+ &
'UserObject2!,'+ &
'VCRFirst!,'+ &
'VCRLast!,'+ &
'VCRNext!,'+ &
'VCRPrior!,'+ &
'ViewPainter!,'+ &
'VProgressBar!,'+ &
'VProgressBar1!,'+ &
'VProgressBar2!,'+ &
'VScrollBar!,'+ &
'VScrollBar1!,'+ &
'VScrollBar2!,'+ &
'VTrackBar!,'+ &
'VTrackBar1!,'+ &
'VTrackBar2!,'+ &
'Watcom!,'+ &
'Where!'
end function

on w_imagelist.create
this.lv_imagelistsmall=create lv_imagelistsmall
this.lv_imagelistmedium=create lv_imagelistmedium
this.lv_imagelistlarge=create lv_imagelistlarge
this.lv_imagelistxlarge=create lv_imagelistxlarge
this.Control[]={this.lv_imagelistsmall,&
this.lv_imagelistmedium,&
this.lv_imagelistlarge,&
this.lv_imagelistxlarge}
end on

on w_imagelist.destroy
destroy(this.lv_imagelistsmall)
destroy(this.lv_imagelistmedium)
destroy(this.lv_imagelistlarge)
destroy(this.lv_imagelistxlarge)
end on

event open;lv_imagelistmedium.LargePictureHeight = MEDIUM
lv_imagelistmedium.LargePictureWidth = MEDIUM

lv_imagelistxlarge.LargePictureHeight = XLARGE
lv_imagelistxlarge.LargePictureWidth = XLARGE
end event

type lv_imagelistsmall from listview within w_imagelist
boolean visible = false
integer x = 224
integer y = 136
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long largepicturemaskcolor = 12632256
long smallpicturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event constructor;THIS.LargePictureHeight = SMALL
THIS.LargePictureWidth = SMALL
end event

type lv_imagelistmedium from listview within w_imagelist
boolean visible = false
integer x = 224
integer y = 136
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long largepicturemaskcolor = 12632256
long smallpicturemaskcolor = 12632256
long statepicturemaskcolor = 536870912
end type

event constructor;lv_imagelistmedium.LargePictureHeight = MEDIUM
lv_imagelistmedium.LargePictureWidth = MEDIUM
end event

type lv_imagelistlarge from listview within w_imagelist
boolean visible = false
integer x = 224
integer y = 136
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
integer largepicturewidth = 32
integer largepictureheight = 32
long largepicturemaskcolor = 12632256
long smallpicturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event constructor;THIS.LargePictureHeight = LARGE
THIS.LargePictureWidth = LARGE
end event

type lv_imagelistxlarge from listview within w_imagelist
boolean visible = false
integer x = 224
integer y = 136
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
long largepicturemaskcolor = 12632256
long smallpicturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event constructor;THIS.LargePictureHeight = XLARGE
THIS.LargePictureWidth = XLARGE
end event

