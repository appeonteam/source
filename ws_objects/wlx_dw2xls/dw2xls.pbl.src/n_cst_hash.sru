$PBExportHeader$n_cst_hash.sru
forward
global type n_cst_hash from nonvisualobject
end type
end forward

global type n_cst_hash from nonvisualobject
end type
global n_cst_hash n_cst_hash

type variables
Private n_cst_hash_entry invo_fields[]
Private Long il_field_max_value = 7
Private Long il_field_count
Private Long il_max_capacity = -1

end variables

forward prototypes
protected function n_cst_hash_entry of_create_entry ()
public function integer of_delete_key (readonly string as_key)
protected function integer of_extend_hash (long al_power)
public function n_cst_hash_entry of_find_hash_entry (readonly string as_key)
public function long of_get_capacity ()
public function n_cst_hash_entry of_get_hash_entry (readonly string as_key)
public function long of_get_keys (ref string as_keys[])
public function unsignedlong of_hash (readonly string as_key)
public function boolean of_key_exists (readonly string as_key)
protected function integer of_set_max_capacity (long al_new_max_capacity)
protected function integer of_set_capacity (long al_new_capacity)
end prototypes

protected function n_cst_hash_entry of_create_entry ();n_cst_hash_entry ret
SetNull(ret)
Return ret
end function

public function integer of_delete_key (readonly string as_key);n_cst_hash_entry lnvo_cur_entry
n_cst_hash_entry lnvo_prev_entry
n_cst_hash_entry lnvo_next_entry
ULong ll_h
ULong ll_i
ll_h = of_hash(as_key)
ll_i = Mod(ll_h, il_field_max_value) + 1
lnvo_cur_entry = invo_fields[ll_i]
SetNull(lnvo_prev_entry)
Do While Not IsNull(lnvo_cur_entry) 
	If lnvo_cur_entry.il_hash = ll_h Then
		If lnvo_cur_entry.is_key = as_key Then
			If lnvo_cur_entry = invo_fields[ll_i] Then
				invo_fields[ll_i] = lnvo_cur_entry.invo_next
				lnvo_next_entry = lnvo_cur_entry.invo_next
			Else
				lnvo_prev_entry.invo_next = lnvo_cur_entry.invo_next
				lnvo_next_entry = lnvo_cur_entry.invo_next
			End If
			il_field_count --
			Destroy(lnvo_cur_entry)
		Else
			lnvo_prev_entry = lnvo_cur_entry
			lnvo_next_entry = lnvo_cur_entry.invo_next
		End If
	Else
		lnvo_prev_entry = lnvo_cur_entry
		lnvo_next_entry = lnvo_cur_entry.invo_next
	End If
	lnvo_cur_entry = lnvo_next_entry
Loop
Return 1

end function

protected function integer of_extend_hash (long al_power);ULong ll_i
ULong ll_old_size
ULong ll_new_size
ULong ll_new_pos
n_cst_hash_entry lnvo_cur_entry
n_cst_hash_entry lnvo_prev_entry
n_cst_hash_entry lnvo_next_entry
ll_old_size = il_field_max_value + 1
ll_new_size = ll_old_size * 2 ^ al_power
If ll_new_size > il_max_capacity And il_max_capacity <> -1 Then
	Return -1
End If
il_field_max_value = ll_new_size - 1
For ll_i = ll_old_size + 1 To ll_new_size
	SetNull(invo_fields[ll_i])
Next
For ll_i = 1 To ll_old_size
	lnvo_cur_entry = invo_fields[ll_i]
	SetNull(lnvo_prev_entry)
	Do While Not IsNull(lnvo_cur_entry)
		ll_new_pos = Mod(lnvo_cur_entry.il_hash, il_field_max_value) + 1
		If ll_new_pos <> ll_i Then
			If lnvo_cur_entry = invo_fields[ll_i] Then
				invo_fields[ll_i] = lnvo_cur_entry.invo_next
				lnvo_next_entry = lnvo_cur_entry.invo_next
			Else
				lnvo_prev_entry.invo_next = lnvo_cur_entry.invo_next
				lnvo_next_entry = lnvo_cur_entry.invo_next
			End If
			lnvo_cur_entry.invo_next = invo_fields[ll_new_pos]
			invo_fields[ll_new_pos] = lnvo_cur_entry
		Else
			lnvo_prev_entry = lnvo_cur_entry
			lnvo_next_entry = lnvo_cur_entry.invo_next
		End If
		lnvo_cur_entry = lnvo_next_entry
	Loop
Next
Return 1
end function

public function n_cst_hash_entry of_find_hash_entry (readonly string as_key);ULong ll_h
ULong ll_i
n_cst_hash_entry lnvo_cur_entry
n_cst_hash_entry ret
SetNull(ret)
ll_h = of_hash(as_key)
ll_i = Mod(ll_h, il_field_max_value) + 1
lnvo_cur_entry = invo_fields[ll_i]
Do While Not IsNull(lnvo_cur_entry)
	If lnvo_cur_entry.il_hash = ll_h Then
		If lnvo_cur_entry.is_key = as_key Then
			ret = lnvo_cur_entry
			Exit
		End If
	End If

	lnvo_cur_entry = lnvo_cur_entry.invo_next
Loop
Return ret

end function

public function long of_get_capacity ();Return il_field_max_value + 1
end function

public function n_cst_hash_entry of_get_hash_entry (readonly string as_key);ULong ll_h
ULong ll_i
n_cst_hash_entry lnvo_cur_entry
n_cst_hash_entry ret
SetNull(ret)
If il_field_count > il_field_max_value Then
	of_extend_hash(1)
End If
ll_h = of_hash(as_key)
ll_i = Mod(ll_h, il_field_max_value) + 1
lnvo_cur_entry = invo_fields[ll_i]
Do While Not IsNull(lnvo_cur_entry) 
	If lnvo_cur_entry.il_hash = ll_h Then
		If lnvo_cur_entry.is_key = as_key Then
			ret = lnvo_cur_entry
			Exit
		End If
	End If
	lnvo_cur_entry = lnvo_cur_entry.invo_next
Loop
If IsNull(ret) Then
	ret = of_create_entry()
	il_field_count ++
	ret.invo_next = invo_fields[ll_i]
	ret.il_hash = ll_h
	ret.is_key = as_key
	invo_fields[ll_i] = ret
End If
Return ret
end function

public function long of_get_keys (ref string as_keys[]);String ls_ret[]
Long ll_cnt
Long ll_i
n_cst_hash_entry lnvo_cur_entry
ll_cnt = 0
For ll_i = 1 To il_field_max_value + 1
	lnvo_cur_entry = invo_fields[ll_i]
	Do While Not IsNull(lnvo_cur_entry)
		ll_cnt ++
		ls_ret[ll_cnt] = lnvo_cur_entry.is_key
		lnvo_cur_entry = lnvo_cur_entry.invo_next
	Loop
Next
as_keys = ls_ret
Return ll_cnt

end function

public function unsignedlong of_hash (readonly string as_key);ULong ll_i
ULong ll_len
ULong ll_ret
ll_len = Len(as_key)
For ll_i = 1 To ll_len
	ll_ret = 33 * ll_ret + Asc(Mid(as_key, ll_i, 1))
Next
ll_ret = ll_ret + ll_ret / 32
Return ll_ret

end function

public function boolean of_key_exists (readonly string as_key);ULong ll_h
ULong ll_i
n_cst_hash_entry lnvo_entry
ll_h = of_hash(as_key)
ll_i = Mod(ll_h, il_field_max_value) + 1
lnvo_entry = invo_fields[ll_i]
Do While Not IsNull(lnvo_entry)
	If lnvo_entry.il_hash = ll_h Then
		If lnvo_entry.is_key = as_key Then
			Return True
		End If
	End If
	lnvo_entry = lnvo_entry.invo_next
Loop
Return False


end function

protected function integer of_set_max_capacity (long al_new_max_capacity);Long ll_capacity
If al_new_max_capacity < 0 Then
	il_max_capacity = -1
Else
	ll_capacity = of_get_capacity()
	If al_new_max_capacity < ll_capacity Then
		il_max_capacity = ll_capacity
	Else
		il_max_capacity = al_new_max_capacity
	End If
End If
Return 1
end function

protected function integer of_set_capacity (long al_new_capacity);Long ll_power
Long ll_capacity
ll_capacity = of_get_capacity()
If al_new_capacity > ll_capacity Then
	ll_power = 1 + Truncate(Log(al_new_capacity - 1) / Log(2) - Log(ll_capacity) / Log(2) + 0.00001,0)
	If ll_power > 0 Then
		Return of_extend_hash(ll_power)
	End If
End If
Return 1

end function

on n_cst_hash.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_hash.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;LONG ll_i
FOR ll_i = 1 TO il_field_max_value + 1
	SETNULL(invo_fields[ll_i])
NEXT
end event

event destructor;LONG ll_i
n_cst_hash_entry lnvo_cur_entry
FOR ll_i = 1 TO il_field_max_value + 1
	DO WHILE NOT ISNULL(invo_fields[ll_i])
		lnvo_cur_entry = invo_fields[ll_i]
		invo_fields[ll_i] = lnvo_cur_entry.invo_next
		DESTROY(lnvo_cur_entry)
	LOOP
NEXT

end event

