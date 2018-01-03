$PBExportHeader$eon_cjsonnodearrayex.sru
forward
global type eon_cjsonnodearrayex from eon_cjsonnodearray
end type
end forward

global type eon_cjsonnodearrayex from eon_cjsonnodearray
end type
global eon_cjsonnodearrayex eon_cjsonnodearrayex

forward prototypes
public subroutine of_append (any aa_keyvalue)
public subroutine of_append (eon_cjsonnode anvo_node)
public subroutine of_cleararray ()
public subroutine of_insertatindex (integer ai_index, eon_cjsonnode anvo_node)
public subroutine of_insertatindex (integer ai_index, eon_cjsonnodearray anvo_nodearray)
public subroutine of_append (eon_cjsonnodearray anvo_nodearray)
public subroutine of_removebyindex (integer ai_index)
public function eon_cjsonnodearray of_getarraynodebyindex (integer ai_index)
public function boolean of_getboolbyindex (integer ai_index)
public function long of_getlongbyindex (integer ai_index)
public function double of_getdoublebyindex (integer ai_index)
public function eon_cjsonnode of_getnodebyindex (integer ai_index)
public function string of_getstringbyindex (integer ai_index)
public function integer of_gettypebyindex (integer ai_index)
public function boolean of_load (string as_jsonstring)
public subroutine of_insertatindex (integer ai_index, any aa_keyvalue)
public function integer of_size ()
public function string of_tostring ()
end prototypes

public subroutine of_append (any aa_keyvalue);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_append
//------------------------------------------------------------------------------
// Description: 
// 				Adds a key value at the end of the array.
// 
// Arguments: 
// 	value		any	aa_keyvalue
//					The value to be added
//					Supported data types include long/boolean/string/double/eon_cjsonnode/eon_cjsonnodearray  
// Returns:   (None) 
//					
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================

if appeongetclienttype() = "MOBILE" then
	super::of_append(aa_keyvalue)
end if
end subroutine

public subroutine of_append (eon_cjsonnode anvo_node);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_append
//------------------------------------------------------------------------------
// Description: 
//				Adds an eon_cjsonnode object at the end of the array.    
// 
// Arguments: 
// 	value		eon_cjsonnode	anvo_node
//				The eon_cjsonnode object to be added
// Returns:   (None) 
//					
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================

if appeongetclienttype() = "MOBILE" then
	 super::of_append(anvo_node)
end if
end subroutine

public subroutine of_cleararray ();//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_cleararray
//------------------------------------------------------------------------------
// Description: 
// 					Clears the content of the current array. 
// 
// Arguments: (None)
//	
// Returns:   (None) 
//
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================

if appeongetclienttype() = "MOBILE" then
	 super::of_cleararray()
end if
end subroutine

public subroutine of_insertatindex (integer ai_index, eon_cjsonnode anvo_node);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_insertatindex
//------------------------------------------------------------------------------
// Description: 
//				Inserts an eon_cjsonnode object at the position specified by the index.      
// 
// Arguments: 
// 				value		integer	ai_index    The value of the index
// 				value		eon_cjsonnode	anvo_node
//				The eon_cjsonnode object to be inserted
// Returns:   (None) 
//					
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================

if appeongetclienttype() = "MOBILE" then
	 super::of_insertatindex(ai_index,anvo_node)
end if
end subroutine

public subroutine of_insertatindex (integer ai_index, eon_cjsonnodearray anvo_nodearray);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_insertatindex
//------------------------------------------------------------------------------
// Description: 
//				Inserts an eon_cjsonnodearray object at the position specified by the index.     
// 
// Arguments: 
// 				value		integer	ai_index     The value of the index 
// 				value		eon_cjsonnodearray	anvo_nodearray
//				The eon_cjsonnodearray object to be inserted
// Returns:   (None) 
//					
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================


if appeongetclienttype() = "MOBILE" then
	 super::of_insertatindex(ai_index,anvo_nodearray)
end if
end subroutine

public subroutine of_append (eon_cjsonnodearray anvo_nodearray);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_append
//------------------------------------------------------------------------------
// Description: 
// 				Adds an eon_cjsonnodearray object at the end of the array. 
// 
// Arguments: 
// 	value		eon_cjsonnodearray	anvo_nodearray 
//				The eon_cjsonnodearray object to be added.
// Returns:   (None) 
//					
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================

if appeongetclienttype() = "MOBILE" then
	 super::of_append(anvo_nodearray)
end if
end subroutine

public subroutine of_removebyindex (integer ai_index);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_removebyindex
//------------------------------------------------------------------------------
// Description: 
//					Removes the key value specified by the index.    
// 
// Arguments: 
// 					value		integer	ai_index     The value of the index 
// Returns:   (None) 
//					
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================

if appeongetclienttype() = "MOBILE" then
	 super::of_removebyindex(ai_index)
end if
end subroutine

public function eon_cjsonnodearray of_getarraynodebyindex (integer ai_index);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_getarraynodebyindex
//------------------------------------------------------------------------------
// Description: 
//				Gets the value (eon_cjsonnodearray object) specified by the index.   
// 
// Arguments: 
// 				value		integer	ai_index       The value of the index 
// Returns:   eon_cjsonnodearray 
//				 The value (eon_cjsonnodearray object)
//				 Null if the value is not an eon_cjsonnodearray object.
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
eon_cjsonnodearray lobj_return

if appeongetclienttype() = "MOBILE" then
	lobj_return = super::of_getarraynodebyindex(ai_index)
else	
	setnull(lobj_return)
end if
return lobj_return

end function

public function boolean of_getboolbyindex (integer ai_index);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_getboolbyindex
//------------------------------------------------------------------------------
// Description: 
//					Gets the boolean value specified by the index.
// 
// Arguments: 
// 					value		integer	ai_index     The value of the index 
// Returns:      boolean
//				    The boolean value.
//				    Null if the value is not a boolean.					
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
boolean lb_return

if appeongetclienttype() = "MOBILE" then
	lb_return = super::of_getboolbyindex(ai_index)
else	
	setnull(lb_return)
end if

return lb_return

end function

public function long of_getlongbyindex (integer ai_index);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_getlongbyindex
//------------------------------------------------------------------------------
// Description: 
//				Gets the long value specified by the index.
// 
// Arguments: 
// 				value		integer	ai_index          The value of the index 
// Returns:	long 
//				The long value.
//				Null if the value is not a long.
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
long ll_return
if appeongetclienttype() = "MOBILE" then
	ll_return = super::of_getlongbyindex(ai_index)
else	
	setnull(ll_return)
end if
return ll_return
end function

public function double of_getdoublebyindex (integer ai_index);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_getdoublebyindex
//------------------------------------------------------------------------------
// Description: 
//					Gets the double value specified by the index.        
// 
// Arguments: 
// 					value		integer	ai_index        The value of the index 
// Returns:      double
//				    The double value.
//				    Null if the value is not a double.					
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
double ldbl_return
if appeongetclienttype() = "MOBILE" then
	ldbl_return = super::of_getdoublebyindex(ai_index)
else	
	setnull(ldbl_return)
end if
return ldbl_return

end function

public function eon_cjsonnode of_getnodebyindex (integer ai_index);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_getnodebyindex
//------------------------------------------------------------------------------
// Description: 
//				Gets the value (eon_cjsonnode object) specified by the index.        
// 
// Arguments: 
// 				value		integer	ai_index        The value of the index 
// Returns:  eon_cjsonnode
//				The value (eon_cjsonnode).
//				Null if the value is not an eon_cjsonnode object.		
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
eon_cjsonnode lobj_return

if appeongetclienttype() = "MOBILE" then
	lobj_return = super::of_getnodebyindex(ai_index)
else	
	setnull(lobj_return)
end if
return lobj_return

end function

public function string of_getstringbyindex (integer ai_index);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_getstringbyindex
//------------------------------------------------------------------------------
// Description: 
//				Gets the string value specified by the index.
// 
// Arguments: 
// 				value		integer	ai_index     The value of the index 
// Returns:   string
//				The string value.
//				Null if the value is not a string.						
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
string ls_return

if appeongetclienttype() = "MOBILE" then
	ls_return = super::of_getstringbyindex(ai_index)
else	
	setnull(ls_return)
end if
return ls_return

end function

public function integer of_gettypebyindex (integer ai_index);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_gettypebyindex
//------------------------------------------------------------------------------
// Description: 
//				Gets the data type of the key value specified by the index.
// 
// Arguments: 
// 				value		integer	ai_index     The value of the index 
// Returns:  integer
//					Data type of the key value
//					0 - NULL
//					1 - STRING
//					2 - NUMBER
//					3 - BOOL
//					4 - eon_cjsonnodearray
//					5 - eon_cjsonnode
//					-1 - Invalid value				
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
integer li_return

if appeongetclienttype() = "MOBILE" then
	li_return = super::of_gettypebyindex(ai_index)
else	
	setnull(li_return)
end if
return li_return

end function

public function boolean of_load (string as_jsonstring);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_load
//------------------------------------------------------------------------------
// Description: 
//					Loads the JSON-format array.
// 
// Arguments: 
// 					value  string 	as_jsonstring   The JSON-format array 
// Returns:  		Boolean
//					true  - Loaded successfully.
//					false - Failed to load.
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
boolean lb_return

if appeongetclienttype() = "MOBILE" then
	lb_return = super::of_load(as_jsonstring)
else	
	lb_return = false
end if
	
return lb_return

end function

public subroutine of_insertatindex (integer ai_index, any aa_keyvalue);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_insertatindex
//------------------------------------------------------------------------------
// Description: 
//				Inserts a key value at the position specified by the index.      
// 
// Arguments: 
// 				value		integer	ai_index      The value of the index 
// 				value		any	aa_keyvalue
//				The value to be inserted
//				Support data types include long/boolean/string/double/eon_cjsonnode/eon_cjsonnodearray  
// Returns:   (None) 
//					
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================

if appeongetclienttype() = "MOBILE" then
	 super::of_insertatindex(ai_index,aa_keyvalue)
end if
end subroutine

public function integer of_size ();//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_size
//------------------------------------------------------------------------------
// Description: 
// 					Gets the total amount of the key values in eon_cjsonnodearray.
// 
// Arguments: (None)
//	
// Returns:  integer. 
//					The total amount of key values in the array. 
//					-1 - It is called in PowerBuilder, or there is an error.
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
integer li_return

if appeongetclienttype() = "MOBILE" then
	li_return = super::of_size()
else	
	li_return = -1
end if
	
return li_return
end function

public function string of_tostring ();//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodearrayex::of_tostring
//------------------------------------------------------------------------------
// Description: 
//				Converts the key values to the standard JSON-format array.
// 
// Arguments: 
//				 (None) 
// Returns:   
//				String		
//				The standard JSON-format array.	
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
string ls_return

if appeongetclienttype() = "MOBILE" then
	ls_return = super::of_tostring()
else	
	setnull(ls_return)
end if
return ls_return

end function

on eon_cjsonnodearrayex.create
call super::create
end on

on eon_cjsonnodearrayex.destroy
call super::destroy
end on

