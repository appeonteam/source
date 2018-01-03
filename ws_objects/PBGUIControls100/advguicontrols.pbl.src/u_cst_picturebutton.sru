$PBExportHeader$u_cst_picturebutton.sru
forward
global type u_cst_picturebutton from u_cst_toolbarstrip
end type
end forward

global type u_cst_picturebutton from u_cst_toolbarstrip
end type
global u_cst_picturebutton u_cst_picturebutton

forward prototypes
public function integer of_updatepointsleft ()
public function integer of_getactualwidth ()
end prototypes

public function integer of_updatepointsleft ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_item, ll_childIndex
Long ll_width, ll_height, ll_dc, ll_controlWidth, ll_chevronwidth
boolean lb_SomeHidden = FALSE
point lp_empty[]
n_cst_toolbarstrip_painter ln_gradient
Point p

ll_count = UpperBound(ToolbarItemsLeft)

ll_y = 3
ll_x = 3
ll_height = UnitsToPixels(Height, YUnitsToPixels!)
ll_controlWidth = UnitsToPixels(Width, XUnitsToPixels!)

ll_dc = inv_win32.GetDC(Handle(st_1))
ln_gradient.of_SetHDC(ll_dc)

uo_toolbarchevron.of_ClearItems()

FOR ll_index = 1 TO ll_count
	IF NOT ToolbarItemsLeft[ll_index].Visible OR ToolbarItemsLeft[ll_index].Position = RIGHT OR &
	   ToolbarItemsLeft[ll_index].IsChild THEN
		
		ToolbarItemsLeft[ll_index].PaintRegion = lp_empty
		
		CONTINUE
	END IF
	
	ll_item++
		
	IF ToolbarItemsLeft[ll_index].IsParent AND ToolbarItemsLeft[ll_index].SelectedChild > 0 THEN
		
		IF ToolbarItemsLeft[ll_index].IsLocked THEN
			ll_childIndex = ll_index
		ELSE
			ll_childIndex = ToolbarItemsLeft[ll_index].SelectedChild
		END IF
		
		IF il_CurrentOrientation = VERTICAL THEN
			ll_chevronwidth = 10
		ELSE
			ll_chevronwidth = 12
		END IF
	ELSE
		ll_childIndex = ll_index
		ll_chevronwidth = 0
	END IF
		
	ToolbarItemsLeft[ll_index].PaintRegion = lp_empty
	
	ToolbarItemsLeft[ll_index].BackColor1 = -1
	ToolbarItemsLeft[ll_index].BackColor2 = -1
	
	IF ll_index = il_index THEN
		IF ib_mousedown AND NOT ib_mouseleave AND il_MOIndex = ll_index THEN
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor('SELECTED1')
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor('SELECTED2')
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("HIGHLIGHTBORDER")
		ELSE
			ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HIGHLIGHT1")
			ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HIGHLIGHT2")
			ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("HIGHLIGHTBORDER")
		END IF
	END IF
	
	IF ToolbarItemsLeft[ll_childIndex].Toggle THEN
		ToolbarItemsLeft[ll_index].BackColor1 = of_GetColor("HIGHLIGHT1")
		ToolbarItemsLeft[ll_index].BackColor2 = of_GetColor("HIGHLIGHT2")
		ToolbarItemsLeft[ll_index].BorderColor = of_GetColor("HIGHLIGHTBORDER")				
	ELSE
		
	END IF
	
	IF il_CurrentOrientation = VERTICAL THEN
		
		IF ToolbarItemsLeft[ll_index].Separator THEN
			ToolbarItemsLeft[ll_index].SeparatorColor = of_GetColor('SEPARATOR')
			
			ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x + 3
			ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y
			ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_controlWidth - ll_x - 3 - 1
			ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y
			
			ToolbarItemsLeft[ll_index].Hidden = FALSE
			
			ll_y = ll_y + 4
		ELSE 
			IF ToolbarItemsLeft[ll_index].ObjectType THEN
				ToolbarItemsLeft[ll_index].ObjectReference.Visible = FALSE
			ELSE
				IF ToolbarItemsLeft[ll_index].DisplayText THEN
					
					p = of_GetTextWidth(ToolbarItemsLeft[ll_childIndex].Text, FALSE)
					ll_textwidth = p.PY
					ToolbarItemsLeft[ll_index].TextWidth = p.PX
				ELSE
					ll_textwidth = 0
				END IF
				
				IF Len(ToolbarItemsLeft[ll_childIndex].Image) > 0 THEN
					ToolbarItemsLeft[ll_index].ImageSize = il_CurrentSize
					ll_width = 2 + il_CurrentSize + 2 + ll_textwidth + 2
				ELSE
					ToolbarItemsLeft[ll_index].ImageSize = 0
					ll_width = 2 + ll_textwidth + 2
				END IF
			
				IF ToolbarItemsLeft[ll_index].DisplayText THEN
					ll_width += 5
				END IF
			
				ToolbarItemsLeft[ll_index].TextHeight = ll_textwidth
				
				ll_width += ll_chevronwidth
				
				ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_controlWidth - ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[3].py = ll_width + ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[3].px = ll_controlWidth - ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[4].py = ll_width + ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[4].px = ll_x
			
				IF ToolbarItemsLeft[ll_index].IsParent THEN
					ToolbarItemsLeft[ll_index].ChevronRegion[1].px = ll_x
					ToolbarItemsLeft[ll_index].ChevronRegion[1].py = ll_width + ll_y - ll_chevronwidth
					ToolbarItemsLeft[ll_index].ChevronRegion[2].px = ll_controlWidth - ll_x
					ToolbarItemsLeft[ll_index].ChevronRegion[2].py = ll_width + ll_y - ll_chevronwidth
					ToolbarItemsLeft[ll_index].ChevronRegion[3].px = ll_controlWidth - ll_x
					ToolbarItemsLeft[ll_index].ChevronRegion[3].py = ll_width + ll_y
					ToolbarItemsLeft[ll_index].ChevronRegion[4].px = ll_x
					ToolbarItemsLeft[ll_index].ChevronRegion[4].py = ll_width + ll_y
				END IF
				
				ToolbarItemsLeft[ll_index].Hidden = FALSE
				
				ll_y = ll_y + ll_width + 2
			END IF
		END IF
	ELSE
		
		IF ToolbarItemsLeft[ll_index].Separator THEN
			ToolbarItemsLeft[ll_index].SeparatorColor = of_GetColor('SEPARATOR')
			
			ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
			ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y + 3
			ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_x
			ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_height - ll_y - 1 - 3
			
			ToolbarItemsLeft[ll_index].Hidden = FALSE
			
			ll_x = ll_x + 5
		ELSE 
			IF ToolbarItemsLeft[ll_index].ObjectType THEN
				
				IF Len(Trim(ToolbarItemsLeft[ll_index].Text)) > 0 THEN
					p = of_GetTextWidth(ToolbarItemsLeft[ll_index].Text, FALSE)
					ToolbarItemsLeft[ll_index].TextWidth = p.PX
					ToolbarItemsLeft[ll_index].TextHeight = p.PY
					ToolbarItemsLeft[ll_index].PaintRegion[3].py = UnitsToPixels(Height, YUnitsToPixels!)
					ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
					ll_textwidth = p.PX + 2
				ELSE
					ll_textwidth = 0
				END IF
				
				ToolbarItemsLeft[ll_index].ObjectReference.Move(PixelsToUnits(ll_textwidth + ll_x + 4, XPixelsToUnits!) + THIS.X, &
																				PixelsToUnits(ll_y - 1, XPixelsToUnits!) + THIS.Y)
				
				
				ll_x = ll_x + ll_textwidth + 4 + UnitsToPixels(ToolbarItemsLeft[ll_index].ObjectReference.Width, XUnitsToPixels!) + 4
			ELSE
				IF ToolbarItemsLeft[ll_index].DisplayText THEN
					
					p = of_GetTextWidth(ToolbarItemsLeft[ll_childIndex].Text, FALSE)
					ll_textwidth = p.PX
					ToolbarItemsLeft[ll_index].TextHeight = p.PY
					
				ELSE
					ll_textwidth = 0
				END IF
				
				IF Len(ToolbarItemsLeft[ll_childIndex].Image) > 0 THEN
					ToolbarItemsLeft[ll_index].ImageSize = il_CurrentSize
					ll_width = 2 + il_CurrentSize + 2 + ll_textwidth + 2
				ELSE
					ToolbarItemsLeft[ll_index].ImageSize = 0
					ll_width = 2 + ll_textwidth + 2
				END IF
			
				ToolbarItemsLeft[ll_index].TextWidth = ll_textwidth
			
				ll_width += ll_chevronwidth
			
				ToolbarItemsLeft[ll_index].PaintRegion[1].px = ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[1].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[2].px = ll_width + ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[2].py = ll_y
				ToolbarItemsLeft[ll_index].PaintRegion[3].px = ll_width + ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[3].py = ll_height - ll_y + 1
				ToolbarItemsLeft[ll_index].PaintRegion[4].px = ll_x
				ToolbarItemsLeft[ll_index].PaintRegion[4].py = ll_height - ll_y + 1
				
				IF ToolbarItemsLeft[ll_index].IsParent THEN
					ToolbarItemsLeft[ll_index].ChevronRegion[1].px = ll_width + ll_x - ll_chevronwidth
					ToolbarItemsLeft[ll_index].ChevronRegion[1].py = ll_y
					ToolbarItemsLeft[ll_index].ChevronRegion[2].px = ll_width + ll_x
					ToolbarItemsLeft[ll_index].ChevronRegion[2].py = ll_y
					ToolbarItemsLeft[ll_index].ChevronRegion[3].px = ll_width + ll_x
					ToolbarItemsLeft[ll_index].ChevronRegion[3].py = ll_height - ll_y + 1
					ToolbarItemsLeft[ll_index].ChevronRegion[4].px = ll_width + ll_x - ll_chevronwidth
					ToolbarItemsLeft[ll_index].ChevronRegion[4].py = ll_height - ll_y + 1
				END IF
				
				ToolbarItemsLeft[ll_index].Hidden = FALSE
			
				ll_x = ll_x + ll_width + 2
			END IF
		END IF
	END IF

NEXT

inv_win32.ReleaseDC (Handle(st_1), ll_dc)

uo_toolbarchevron.Visible = FALSE
ib_LeftHidden =FALSE

RETURN 1
end function

public function integer of_getactualwidth ();Long ll_item

ll_item = UpperBound(ToolbarItemsLeft)

RETURN PixelsToUnits(ToolbarItemsLeft[ll_item].PaintRegion[2].px, XPixelsToUnits!) + 12
end function

on u_cst_picturebutton.create
call super::create
end on

on u_cst_picturebutton.destroy
call super::destroy
end on

type uo_toolbarchevron from u_cst_toolbarstrip`uo_toolbarchevron within u_cst_picturebutton
end type

type st_1 from u_cst_toolbarstrip`st_1 within u_cst_picturebutton
end type

