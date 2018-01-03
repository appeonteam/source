$PBExportHeader$n_cst_hash_blob.sru
forward
global type n_cst_hash_blob from nonvisualobject
end type
end forward

global type n_cst_hash_blob from nonvisualobject
event type n_cst_hash_blob_entry ue_get_hash_entry ( readonly blob ab_key )
event type n_cst_hash_blob_entry ue_create_entry ( )
end type
global n_cst_hash_blob n_cst_hash_blob

type variables
PRIVATE n_cst_hash_blob_entry invo_fields[]
PRIVATE LONG il_field_max_value = 7
PRIVATE LONG il_field_count
PRIVATE LONG il_max_capacity = -1
end variables

forward prototypes
public function boolean of_key_exists (readonly blob ab_key)
public function long of_get_keys (ref blob ab_keys[])
public function integer of_delete_key (readonly blob ab_key)
protected function integer of_extend_hash (long al_power)
public function n_cst_hash_blob_entry of_find_hash_entry (readonly blob ab_key)
public function long of_get_capacity ()
public function unsignedlong of_hash (readonly blob ab_key)
protected function integer of_set_capacity (long al_new_capacity)
protected function integer of_set_max_capacity (long al_new_max_capacity)
end prototypes

event type n_cst_hash_blob_entry ue_get_hash_entry(readonly blob ab_key);ULONG ll_h
ULONG ll_i
n_cst_hash_blob_entry lnvo_cur_entry
n_cst_hash_blob_entry ret
SETNULL(ret)
IF il_field_count > il_field_max_value THEN
	of_extend_hash(1)
END IF
ll_h = of_hash(ab_key)
ll_i = MOD(ll_h, il_field_max_value) + 1
lnvo_cur_entry = invo_fields[ll_i]
DO WHILE NOT ISNULL(lnvo_cur_entry)
	IF lnvo_cur_entry.il_hash = ll_h THEN
		IF lnvo_cur_entry.ib_key = ab_key THEN
			ret = lnvo_cur_entry
			EXIT
		END IF
	END IF
	lnvo_cur_entry = lnvo_cur_entry.invo_next
LOOP
IF ISNULL(ret) THEN
	ret = EVENT ue_create_entry()
	il_field_count ++
	ret.invo_next = invo_fields[ll_i]
	ret.il_hash = ll_h
	ret.ib_key = ab_key
	invo_fields[ll_i] = ret
END IF
RETURN ret

end event

event type n_cst_hash_blob_entry ue_create_entry();n_cst_hash_blob_entry ret
setnull(ret)
return ret
end event

public function boolean of_key_exists (readonly blob ab_key);ULONG ll_h
ULONG ll_i
n_cst_hash_blob_entry lnvo_entry
ll_h = of_hash(ab_key)
ll_i = MOD(ll_h, il_field_max_value) + 1
lnvo_entry = invo_fields[ll_i]
DO WHILE NOT ISNULL(lnvo_entry)
	IF lnvo_entry.il_hash = ll_h THEN
		IF lnvo_entry.ib_key = ab_key THEN
			RETURN TRUE
		END IF
	END IF
	lnvo_entry = lnvo_entry.invo_next
LOOP
RETURN FALSE

end function

public function long of_get_keys (ref blob ab_keys[]);BLOB lb_ret[]
LONG ll_cnt
LONG ll_i
n_cst_hash_blob_entry lnvo_cur_entry
ll_cnt = 0
FOR ll_i = 1 TO il_field_max_value + 1
	lnvo_cur_entry = invo_fields[ll_i]
	DO WHILE NOT ISNULL(lnvo_cur_entry)
		ll_cnt ++
		lb_ret[ll_cnt] = lnvo_cur_entry.ib_key
		lnvo_cur_entry = lnvo_cur_entry.invo_next
	LOOP
NEXT
ab_keys = lb_ret
RETURN ll_cnt

end function

public function integer of_delete_key (readonly blob ab_key);n_cst_hash_blob_entry lnvo_cur_entry
n_cst_hash_blob_entry lnvo_prev_entry
n_cst_hash_blob_entry lnvo_next_entry
ULong ll_h
ULong ll_i
ll_h = of_hash(ab_key)
ll_i = Mod(ll_h, il_field_max_value) + 1
lnvo_cur_entry = invo_fields[ll_i]
SetNull(lnvo_prev_entry)
Do While Not IsNull(lnvo_cur_entry)
	If lnvo_cur_entry.il_hash = ll_h Then
		If lnvo_cur_entry.ib_key = ab_key Then
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
n_cst_hash_blob_entry lnvo_cur_entry
n_cst_hash_blob_entry lnvo_prev_entry
n_cst_hash_blob_entry lnvo_next_entry
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

public function n_cst_hash_blob_entry of_find_hash_entry (readonly blob ab_key);ULong ll_h
ULong ll_i
n_cst_hash_blob_entry lnvo_cur_entry
n_cst_hash_blob_entry ret
SetNull(ret)
ll_h = of_hash(ab_key)
ll_i = Mod(ll_h, il_field_max_value) + 1
lnvo_cur_entry = invo_fields[ll_i]
Do While Not IsNull(lnvo_cur_entry)
	If lnvo_cur_entry.il_hash = ll_h Then
		If lnvo_cur_entry.ib_key = ab_key Then
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

public function unsignedlong of_hash (readonly blob ab_key);ULong ll_i
ULong ll_len
ULong ll_ret
ll_len = Len(ab_key)
For ll_i = 1 To ll_len
	ll_ret = 33 * ll_ret + Asc(Char(BlobMid(ab_key, ll_i, 1)))
Next
ll_ret = ll_ret + ll_ret / 32
Return ll_ret

end function

protected function integer of_set_capacity (long al_new_capacity);Long ll_power
Long ll_capacity
ll_capacity = of_get_capacity()
If al_new_capacity > ll_capacity Then
	ll_power = 1 + Truncate(Log(al_new_capacity - 1) / Log(2) - Log(ll_capacity) / Log(2) + 0.00001, 0)
	If ll_power > 0 Then
		Return of_extend_hash(ll_power)
	End If
End If
Return 1

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

on n_cst_hash_blob.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_hash_blob.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;LONG ll_i
FOR ll_i = 1 TO il_field_max_value + 1
	SETNULL(invo_fields[ll_i])
NEXT
end event

event destructor;LONG ll_i
n_cst_hash_blob_entry lnvo_cur_entry
FOR ll_i = 1 TO il_field_max_value + 1
	DO WHILE NOT ISNULL(invo_fields[ll_i])
		lnvo_cur_entry = invo_fields[ll_i]
		invo_fields[ll_i] = lnvo_cur_entry.invo_next
		DESTROY(lnvo_cur_entry)
	LOOP
NEXT

end event

