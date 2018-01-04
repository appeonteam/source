$PBExportHeader$w_syntax_sample.srw
forward
global type w_syntax_sample from window
end type
type dw_13 from datawindow within w_syntax_sample
end type
type dw_12 from datawindow within w_syntax_sample
end type
type dw_11 from datawindow within w_syntax_sample
end type
type dw_10 from datawindow within w_syntax_sample
end type
type dw_9 from datawindow within w_syntax_sample
end type
type dw_8 from datawindow within w_syntax_sample
end type
type dw_7 from datawindow within w_syntax_sample
end type
type dw_6 from datawindow within w_syntax_sample
end type
type dw_5 from datawindow within w_syntax_sample
end type
type dw_4 from datawindow within w_syntax_sample
end type
type dw_3 from datawindow within w_syntax_sample
end type
type dw_2 from datawindow within w_syntax_sample
end type
type dw_1 from datawindow within w_syntax_sample
end type
end forward

global type w_syntax_sample from window
integer width = 2258
integer height = 2088
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_13 dw_13
dw_12 dw_12
dw_11 dw_11
dw_10 dw_10
dw_9 dw_9
dw_8 dw_8
dw_7 dw_7
dw_6 dw_6
dw_5 dw_5
dw_4 dw_4
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
end type
global w_syntax_sample w_syntax_sample

forward prototypes
public subroutine wf_syntax (datawindow as_dw)
end prototypes

public subroutine wf_syntax (datawindow as_dw);String		ls_syntax
ls_syntax = 'release 12.5; ~r~n' + &
				'datawindow(units=0 timer_interval=0 color=1073741824 brushmode=0 transparency=0 gradient.angle=0 gradient.color=8421504 gradient.focus=0 gradient.repetition.count=0 gradient.repetition.length=100 gradient.repetition.mode=0 gradient.scale=100 gradient.spread=100 gradient.transparency=0 picture.blur=0 picture.clip.bottom=0 picture.clip.left=0 picture.clip.right=0 picture.clip.top=0 picture.mode=0 picture.scale.x=100 picture.scale.y=100 picture.transparency=0 processing=0 HTMLDW=no print.printername="" print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.canusedefaultprinter=yes print.prompt=no print.buttons=no print.preview.buttons=no print.cliptext=no print.overrideprintjob=no print.collate=yes print.background=no print.preview.background=no print.preview.outline=yes hidegrayline=no showbackcoloronxp=no picture.file="" )~r~n' + &
				'header(height=0 color="536870912" transparency="0" gradient.color="8421504" gradient.transparency="0" gradient.angle="0" brushmode="0" gradient.repetition.mode="0" gradient.repetition.count="0" gradient.repetition.length="100" gradient.focus="0" gradient.scale="100" gradient.spread="100" )~r~n' + &
				'summary(height=0 color="536870912" transparency="0" gradient.color="8421504" gradient.transparency="0" gradient.angle="0" brushmode="0" gradient.repetition.mode="0" gradient.repetition.count="0" gradient.repetition.length="100" gradient.focus="0" gradient.scale="100" gradient.spread="100" )~r~n' + &
				'footer(height=0 color="536870912" transparency="0" gradient.color="8421504" gradient.transparency="0" gradient.angle="0" brushmode="0" gradient.repetition.mode="0" gradient.repetition.count="0" gradient.repetition.length="100" gradient.focus="0" gradient.scale="100" gradient.spread="100" )~r~n' + &
				'detail(height=84 color="536870912" transparency="0" gradient.color="8421504" gradient.transparency="0" gradient.angle="0" brushmode="0" gradient.repetition.mode="0" gradient.repetition.count="0" gradient.repetition.length="100" gradient.focus="0" gradient.scale="100" gradient.spread="100" )~r~n' + &
				'table(column=(type=char(10) updatewhereclause=yes name=no dbname="no" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=no1 dbname="no1" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=no2 dbname="no2" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=no3 dbname="no3" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=no4 dbname="no4" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=no5 dbname="no5" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=no6 dbname="no6" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=no7 dbname="no7" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=no8 dbname="no8" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=no9 dbname="no9" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=on dbname="on" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=on1 dbname="on1" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=on2 dbname="on2" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=on3 dbname="on3" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=on4 dbname="on4" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=on5 dbname="on5" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=on6 dbname="on6" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=on7 dbname="on7" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=on8 dbname="on8" )~r~n' + &
				' column=(type=char(10) updatewhereclause=yes name=on9 dbname="on9" )~r~n' + &
				' )~r~n' + &
				'text(band=detail alignment="1" text="No:" border="0" color="33554432" x="37" y="4" height="56" width="133" html.valueishtml="0"  name=no_t visible="1"  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=1 alignment="0" tabsequence=10 border="0" color="33554432" x="206" y="4" height="56" width="320" format="[general]" html.valueishtml="0"  name=no visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=2 alignment="0" tabsequence=20 border="0" color="33554432" x="608" y="4" height="56" width="229" html.valueishtml="0"  name=no1 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=3 alignment="0" tabsequence=30 border="0" color="33554432" x="882" y="4" height="56" width="229" html.valueishtml="0"  name=no2 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=4 alignment="0" tabsequence=40 border="0" color="33554432" x="1143" y="4" height="56" width="229" html.valueishtml="0"  name=no3 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=6 alignment="0" tabsequence=50 border="0" color="33554432" x="1417" y="4" height="56" width="229" html.valueishtml="0"  name=no5 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=7 alignment="0" tabsequence=60 border="0" color="33554432" x="1696" y="4" height="56" width="229" html.valueishtml="0"  name=no6 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=8 alignment="0" tabsequence=70 border="0" color="33554432" x="1966" y="4" height="56" width="229" html.valueishtml="0"  name=no7 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=9 alignment="0" tabsequence=80 border="0" color="33554432" x="2231" y="4" height="56" width="229" html.valueishtml="0"  name=no8 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=10 alignment="0" tabsequence=90 border="0" color="33554432" x="2496" y="4" height="56" width="229" html.valueishtml="0"  name=no9 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=11 alignment="0" tabsequence=100 border="0" color="33554432" x="2757" y="4" height="56" width="229" html.valueishtml="0"  name=on visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=12 alignment="0" tabsequence=110 border="0" color="33554432" x="3026" y="4" height="56" width="229" html.valueishtml="0"  name=on1 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=13 alignment="0" tabsequence=120 border="0" color="33554432" x="3301" y="4" height="56" width="229" html.valueishtml="0"  name=on2 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=14 alignment="0" tabsequence=130 border="0" color="33554432" x="3570" y="4" height="56" width="229" html.valueishtml="0"  name=on3 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=15 alignment="0" tabsequence=140 border="0" color="33554432" x="3831" y="4" height="56" width="229" html.valueishtml="0"  name=on4 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=16 alignment="0" tabsequence=150 border="0" color="33554432" x="4082" y="4" height="56" width="229" html.valueishtml="0"  name=on5 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=17 alignment="0" tabsequence=160 border="0" color="33554432" x="4343" y="4" height="56" width="229" html.valueishtml="0"  name=on6 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=18 alignment="0" tabsequence=170 border="0" color="33554432" x="4603" y="4" height="56" width="229" html.valueishtml="0"  name=on7 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=19 alignment="0" tabsequence=180 border="0" color="33554432" x="4864" y="4" height="56" width="229" html.valueishtml="0"  name=on8 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'column(band=detail id=20 alignment="0" tabsequence=190 border="0" color="33554432" x="5111" y="4" height="56" width="229" html.valueishtml="0"  name=on9 visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=no  font.face="Tahoma" font.height="-9" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" background.transparency="0" background.gradient.color="8421504" background.gradient.transparency="0" background.gradient.angle="0" background.brushmode="0" background.gradient.repetition.mode="0" background.gradient.repetition.count="0" background.gradient.repetition.length="100" background.gradient.focus="0" background.gradient.scale="100" background.gradient.spread="100" tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0" transparency="0" )~r~n' + &
				'htmltable(border="1" )~r~n' + &
				'htmlgen(clientevents="1" clientvalidation="1" clientcomputedfields="1" clientformatting="0" clientscriptable="0" generatejavascript="1" encodeselflinkargs="1" netscapelayers="0" pagingmethod=0 generatedddwframes="1" )~r~n' + &
				'xhtmlgen() cssgen(sessionspecific="0" )~r~n' + &
				'xmlgen(inline="0" )~r~n' + &
				'xsltgen()~r~n' + &
				'jsgen()~r~n' + &
				'export.xml(headgroups="1" includewhitespace="0" metadatatype=0 savemetadata=0 )~r~n' + &
				'import.xml()~r~n' + &
				'export.pdf(method=0 distill.custompostscript="0" xslfop.print="0" )~r~n' + &
				'export.xhtml()'
 

as_dw.Create(ls_syntax)
end subroutine

on w_syntax_sample.create
this.dw_13=create dw_13
this.dw_12=create dw_12
this.dw_11=create dw_11
this.dw_10=create dw_10
this.dw_9=create dw_9
this.dw_8=create dw_8
this.dw_7=create dw_7
this.dw_6=create dw_6
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.dw_13,&
this.dw_12,&
this.dw_11,&
this.dw_10,&
this.dw_9,&
this.dw_8,&
this.dw_7,&
this.dw_6,&
this.dw_5,&
this.dw_4,&
this.dw_3,&
this.dw_2,&
this.dw_1}
end on

on w_syntax_sample.destroy
destroy(this.dw_13)
destroy(this.dw_12)
destroy(this.dw_11)
destroy(this.dw_10)
destroy(this.dw_9)
destroy(this.dw_8)
destroy(this.dw_7)
destroy(this.dw_6)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;
wf_syntax(dw_1)
wf_syntax(dw_2)
wf_syntax(dw_3)
wf_syntax(dw_4)
wf_syntax(dw_5)
wf_syntax(dw_6)
wf_syntax(dw_7)
wf_syntax(dw_8)
wf_syntax(dw_9)
wf_syntax(dw_10)
wf_syntax(dw_11)
wf_syntax(dw_12)
wf_syntax(dw_13)

dw_1.insertrow(0)
dw_2.insertrow(0)
dw_3.insertrow(0)
dw_4.insertrow(0)
dw_5.insertrow(0)
dw_6.insertrow(0)
dw_7.insertrow(0)
dw_8.insertrow(0)
dw_9.insertrow(0)
dw_10.insertrow(0)
dw_11.insertrow(0)
dw_12.insertrow(0)
dw_13.insertrow(0)

end event

type dw_13 from datawindow within w_syntax_sample
integer x = 1477
integer y = 1452
integer width = 686
integer height = 400
integer taborder = 120
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_12 from datawindow within w_syntax_sample
integer x = 768
integer y = 1452
integer width = 686
integer height = 400
integer taborder = 110
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_11 from datawindow within w_syntax_sample
integer x = 23
integer y = 1452
integer width = 686
integer height = 400
integer taborder = 110
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_10 from datawindow within w_syntax_sample
integer x = 1477
integer y = 1028
integer width = 686
integer height = 400
integer taborder = 100
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_9 from datawindow within w_syntax_sample
integer x = 768
integer y = 1028
integer width = 686
integer height = 400
integer taborder = 90
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_8 from datawindow within w_syntax_sample
integer x = 23
integer y = 1028
integer width = 686
integer height = 400
integer taborder = 80
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_7 from datawindow within w_syntax_sample
integer x = 1477
integer y = 612
integer width = 686
integer height = 400
integer taborder = 70
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_6 from datawindow within w_syntax_sample
integer x = 768
integer y = 612
integer width = 686
integer height = 400
integer taborder = 60
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_syntax_sample
integer x = 23
integer y = 612
integer width = 686
integer height = 400
integer taborder = 50
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_4 from datawindow within w_syntax_sample
integer x = 1477
integer y = 192
integer width = 686
integer height = 400
integer taborder = 40
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within w_syntax_sample
integer x = 768
integer y = 192
integer width = 686
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_2 from datawindow within w_syntax_sample
integer x = 23
integer y = 192
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_syntax_sample
integer x = 32
integer y = 40
integer width = 2126
integer height = 104
integer taborder = 10
string title = "none"
string dataobject = "dw_syntax_cond"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

