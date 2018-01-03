$PBExportHeader$n_xls_subroutines_v5.sru
forward
global type n_xls_subroutines_v5 from nonvisualobject
end type
end forward

global type n_xls_subroutines_v5 from nonvisualobject
end type
global n_xls_subroutines_v5 n_xls_subroutines_v5

type variables
end variables

forward prototypes
public function string of_str2xls (string as_str)
public function blob of_pack (character ac_conv_type, double ad_val)
public function blob of_pack (character ac_conv_type, unsignedlong al_val)
public function blob of_pack_hex (string as_val)
end prototypes

public function string of_str2xls (string as_str);Long ll_pos
ll_pos = Pos(as_str, Char(13)+"~n")
Do While ll_pos > 0
	as_str = Replace(as_str, ll_pos, 2, "~n")
	ll_pos = Pos(as_str, Char(13)+"~n")
Loop
ll_pos = Pos(as_str, Char(13))
Do While ll_pos > 0
	as_str = Replace(as_str, ll_pos, 2, "~n")
	ll_pos = Pos(as_str, Char(13))
Loop
Return as_str
end function

public function blob of_pack (character ac_conv_type, double ad_val);Blob{8} lb_ret
If ac_conv_type = "d" Then
		BlobEdit(lb_ret,1,ad_val)
Else
	MessageBox("错误","参数类型错误of_pack('"+ac_conv_type+"',double)")
End If
Return lb_ret

end function

public function blob of_pack (character ac_conv_type, unsignedlong al_val);ULong ll_val
Char lc_val
Integer li_byte_count
Integer li_i
Blob{8} lblb_val
Choose Case ac_conv_type
	Case "v", "V", "C", "c"
		Choose Case ac_conv_type
			Case "v"
				li_byte_count = 2
			Case "V"
				li_byte_count = 4
			Case "C", "c"
				li_byte_count = 1
				If al_val < 0 Then
					al_val = 256 - Mod(al_val, 129)
				End If
		End Choose
		ll_val = al_val
		For li_i = 1 TO li_byte_count
			BlobEdit(lblb_val, li_i, Char(Mod(ll_val, 256)))
			ll_val = ll_val / 256
		Next
	Case Else
		MessageBox("错误", "非法的参数类型of_pack('" + ac_conv_type + "', ulong)")
End Choose
Return BlobMid(lblb_val, 1, li_byte_count)



end function

public function blob of_pack_hex (string as_val);blob lblb_val
blob{100} lblb_buff
integer li_buff_size = 100
integer li_buff_pos = 1
integer li_i
integer li_cnt
string ls_str[2]
integer li_j
integer li_val
setnull(lblb_val)
li_cnt = len(as_val)
for li_i = 1 to li_cnt step 2
    if li_i = li_cnt then
        ls_str[1] = "0"
        ls_str[2] = mid(as_val, li_i, 1)
    else
        ls_str[1] = mid(as_val, li_i, 1)
        ls_str[2] = mid(as_val, li_i + 1, 1)
    end if
    li_val = 0
    for li_j = 1 to 2
        li_val = li_val * 16
        choose case ls_str[li_j]
            case "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"
                li_val += integer(ls_str[li_j])
            case "A"
                li_val = li_val + 10
            case "B"
                li_val = li_val + 11
            case "C"
                li_val = li_val + 12
            case "D"
                li_val = li_val + 13
            case "E"
                li_val = li_val + 14
            case "F"
                li_val = li_val + 15
        end choose
    next
    blobedit(lblb_buff, li_buff_pos, char(li_val))
    li_buff_pos ++
    if li_buff_pos = li_buff_size then
        if isnull(lblb_val) then
            lblb_val = lblb_buff
        else
            lblb_val = lblb_val + lblb_buff
        end if
        li_buff_pos = 1
    end if
next
if li_buff_pos > 1 then
    if isnull(lblb_val) then
        lblb_val = lblb_buff
    else
        lblb_val = lblb_val + lblb_buff
    end if
end if
return lblb_val
end function

on n_xls_subroutines_v5.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_xls_subroutines_v5.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

