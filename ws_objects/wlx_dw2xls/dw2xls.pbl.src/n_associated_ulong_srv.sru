$PBExportHeader$n_associated_ulong_srv.sru
forward
global type n_associated_ulong_srv from nonvisualobject
end type
end forward

global type n_associated_ulong_srv from nonvisualobject
end type
global n_associated_ulong_srv n_associated_ulong_srv

type variables
Private ULong il_keys[]
Private ULong il_key_count

end variables

forward prototypes
public function unsignedlong of_add_key (unsignedlong al_val)
public function unsignedlong of_find_key (unsignedlong al_val)
public function unsignedlong of_get_key (unsignedlong al_index)
public function unsignedlong of_get_key_index (unsignedlong al_val)
public function unsignedlong of_get_keys_count ()
public function integer of_sort_keys ()
protected function unsignedlong of_get_index_min_key (unsignedlong al_from_key)
end prototypes

public function unsignedlong of_add_key (unsignedlong al_val);ULong ll_index
If IsNull(al_val) Then
	Return 0
End If
il_key_count ++
il_keys[il_key_count] = al_val
Return il_key_count

end function

public function unsignedlong of_find_key (unsignedlong al_val);Return of_get_key_index(al_val)


end function

public function unsignedlong of_get_key (unsignedlong al_index);Return il_keys[al_index]
end function

public function unsignedlong of_get_key_index (unsignedlong al_val);ULong ll_i
For ll_i = 1 To il_key_count
	If il_keys[ll_i] = al_val Then
		Return ll_i
	End If
Next
Return 0
end function

public function unsignedlong of_get_keys_count ();Return il_key_count
end function

public function integer of_sort_keys ();Integer li_ret = 1
ULong ll_i
ULong ll_cnt
ULong ll_new_keys[]
ULong ll_start_key
ll_cnt = il_key_count
Do While True
	ll_i = of_get_index_min_key(ll_start_key)
	If ll_i > 0 Then
		ll_cnt ++
		ll_new_keys[ll_cnt] = il_keys[ll_i]
		ll_start_key = il_keys[ll_i] + 1
	Else
		Exit
	End If
Loop
il_keys = ll_new_keys
il_key_count = UpperBound(il_keys)
Return li_ret

end function

protected function unsignedlong of_get_index_min_key (unsignedlong al_from_key);ULong ll_ret
ULong ll_i
ULong ll_min_key = 4294967295
For ll_i = 1 To il_key_count
	If il_keys[ll_i] >= al_from_key And il_keys[ll_i] <= ll_min_key Then
		ll_ret = ll_i
		ll_min_key = il_keys[ll_i]
	End If
Next
Return ll_ret

end function

on n_associated_ulong_srv.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_associated_ulong_srv.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

