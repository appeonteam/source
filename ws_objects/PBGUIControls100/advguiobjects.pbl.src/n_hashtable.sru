$PBExportHeader$n_hashtable.sru
forward
global type n_hashtable from nonvisualobject
end type
end forward

global type n_hashtable from nonvisualobject autoinstantiate
end type

type variables
PUBLIC String is_Key[]
PUBLIC Any ia_Value[]
PUBLIC Long Count
end variables

forward prototypes
public subroutine put (String key, Any value)
public function long indexof (string key)
public function any get (string key)
public function any remove (string key)
public function boolean keyexists (string key)
public subroutine clear ()
public function integer getkeys (ref string as_keys[])
end prototypes

public subroutine put (String key, Any value);
Long    i
i = IndexOf (Key)
IF i = 0 THEN
i = UpperBound (is_Key) + 1
Count ++
END IF
is_Key[i] = Key
ia_Value[i] = Value
end subroutine

public function long indexof (string key);
Long    i, ll_Return = 0
FOR i = UpperBound (is_Key) TO 1 STEP -1
IF Trim(Lower(is_Key[i])) = Trim(Lower(Key)) THEN
ll_Return = i
EXIT // No point in continuing to look...
END IF
NEXT
RETURN ll_Return
end function

public function any get (string key);
Long    i
Any     la_Return
SetNull (la_Return)
i = IndexOf (Key)
IF i > 0 THEN la_Return = ia_Value[i]
RETURN la_Return
end function

public function any remove (string key);
Any     la_Return
Long i
SetNull (la_Return)
i = IndexOf (Key)
IF i > 0 THEN
la_Return = Get (Key)
SetNull (is_Key[i])
SetNull (ia_Value[i])
Count --
END IF
RETURN la_Return
end function

public function boolean keyexists (string key);
RETURN (IndexOf (Key) > 0)
end function

public subroutine clear ();
String  ls_Empty[]
Any     la_Empty[]

is_Key = ls_Empty
ia_Value = la_Empty
Count = 0
end subroutine

public function integer getkeys (ref string as_keys[]);Long ll_index, ll_count
String ls_empty[]

as_keys = ls_empty

ll_count = UpperBound(is_key)

FOR ll_index = 1 TO ll_count
	IF NOT IsNull(is_key[ll_index]) THEN
		as_keys[UpperBound(as_keys) + 1] = is_Key[ll_index]
	END IF
NEXT

RETURN UpperBound(as_keys)
end function

on n_hashtable.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_hashtable.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

