$PBExportHeader$n_cst_ui_imagelist.sru
forward
global type n_cst_ui_imagelist from nonvisualobject
end type
end forward

global type n_cst_ui_imagelist from nonvisualobject autoinstantiate
end type

type variables

end variables

forward prototypes
public function long of_addimage (string as_image)
public function long of_getlargehandle ()
public function long of_getsmallhandle ()
public function long of_getxlargehandle ()
public function long of_getmediumhandle ()
end prototypes

public function long of_addimage (string as_image);IF NOT IsValid(w_imagelist) THEN
	Open(w_imagelist)
END IF

RETURN w_imagelist.of_AddImage(as_image)
end function

public function long of_getlargehandle ();IF NOT IsValid(w_imagelist) THEN
	Open(w_imagelist)
END IF

RETURN w_imagelist.of_GetLargeHandle()
end function

public function long of_getsmallhandle ();IF NOT IsValid(w_imagelist) THEN
	Open(w_imagelist)
END IF

RETURN w_imagelist.of_GetSmallHandle()
end function

public function long of_getxlargehandle ();IF NOT IsValid(w_imagelist) THEN
	Open(w_imagelist)
END IF

RETURN w_imagelist.of_GetXLargeHandle()
end function

public function long of_getmediumhandle ();IF NOT IsValid(w_imagelist) THEN
	Open(w_imagelist)
END IF

RETURN w_imagelist.of_GetMediumHandle()
end function

on n_cst_ui_imagelist.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_ui_imagelist.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

