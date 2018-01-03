$PBExportHeader$eon_cjsonnodeex.sru
forward
global type eon_cjsonnodeex from eon_cjsonnode
end type
end forward

global type eon_cjsonnodeex from eon_cjsonnode
end type
global eon_cjsonnodeex eon_cjsonnodeex

forward prototypes
public function boolean of_load (string as_jsonstring)
public function integer of_size ()
public function string of_tostring ()
public function string of_getkeybyindex (integer ai_index)
public subroutine of_clearnode ()
public function integer of_gettypebyindex (integer ai_index)
public function integer of_gettypebykey (string as_keyname)
public subroutine of_setvalue (string as_keyname, any aa_keyvalue)
public function eon_cjsonnodearray of_valuearray (string as_keyname)
public function boolean of_valueboolean (string as_keyname)
public function double of_valuedouble (string as_keyname)
public function long of_valuelong (string as_keyname)
public function eon_cjsonnode of_valuenode (string as_keyname)
public function string of_valuestring (string as_keyname)
public subroutine of_addkey (string as_keyname, any aa_keyvalue)
public subroutine of_deletekey (string as_keyname)
end prototypes

public function boolean of_load (string as_jsonstring);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_load
//------------------------------------------------------------------------------
// Description: 
//						Loads the JSON-format string.
// 
// Arguments: 
//						value    string	as_jsonstring 
//						The JSON-format string	
// Returns: boolean
//						true - Loaded successfully.
//						false - Failed to load.
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
		lb_return =false
	end if
	
return lb_return
end function

public function integer of_size ();//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_size
//------------------------------------------------------------------------------
// Description: 
// 					Gets the total amount of the key pairs (name and value) in eon_cjsonnode.
// 
// Arguments: (None)
//	
// Returns:  integer. 
//					 The total amount of the key pairs.
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
		li_return =-1
	end if
	
return li_return
end function

public function string of_tostring ();//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_tostring
//------------------------------------------------------------------------------
// Description: 
//					Converts the key names and values of the current node to standard JSON-format string.
// 
// Arguments: (none)
// Returns:      string
//					The JSON-format string.
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
		ls_return =""
	end if
	
return ls_return
end function

public function string of_getkeybyindex (integer ai_index);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_getkeybyindex
//------------------------------------------------------------------------------
// Description: 
//				Gets the name of the key specified by the index.
// 
// Arguments: 
// 	value		integer	ai_index 
//							The value of the index. 
// Returns:   string
//				 The name of the key specified by the index.
//				 Null if the key does not exist.
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
string ls_return

	if appeongetclienttype() = "MOBILE" then
		ls_return = super::of_getkeybyindex(ai_index)
	else	
		ls_return =""
	end if
	
return ls_return

end function

public subroutine of_clearnode ();//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_clearnode
//------------------------------------------------------------------------------
// Description: 
// 					Clears the content of the current node.
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
	 super::of_clearnode()
end if
end subroutine

public function integer of_gettypebyindex (integer ai_index);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_gettypebyindex
//------------------------------------------------------------------------------
// Description: 
//					Gets the data type of the key value specified by the index.
// 
// Arguments: 
// 	value		integer	ai_index   The value of the index 
// Returns:   integer
//					Data type of the key value specified by the index
//					0-NULL
//					1-STRING
//					2-NUMBER
//					3-BOOL
//					4-eon_cjsonnodearray
//					5-eon_cjsonnode
//					-1-invalid value
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
	li_return =-1
end if
	
return li_return
end function

public function integer of_gettypebykey (string as_keyname);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_gettypebykey
//------------------------------------------------------------------------------
// Description: 
//				Gets the data type of the value for the specified key name.
// 
// Arguments: 
// 				value		string	as_keyname
//				The name of the key			
// Returns:   integer
//					Data type of the key value
//					0-NULL
//					1-STRING
//					2-NUMBER
//					3-BOOL
//					4-eon_cjsonnodearray
//					5-eon_cjsonnode
//					-1-invalid value		
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
integer li_return

	if appeongetclienttype() = "MOBILE" then
		li_return = super::of_gettypebykey(as_keyname)
	else	
		li_return =-1
	end if
	
return li_return
end function

public subroutine of_setvalue (string as_keyname, any aa_keyvalue);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_setvalue
//------------------------------------------------------------------------------
// Description: 
//						Sets the value of the specified key.
// 
// Arguments: 
// 						value		string	as_keyname 
//						The name of the key.
//						value		any	aa_keyvalue 
//						The value of the key.
//						Supported data types include long/boolean/string/double/JsonNode/JsonNodeArray  
// Returns:   (none)
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================

if appeongetclienttype() = "MOBILE" then
	 super::of_setvalue(as_keyname,aa_keyvalue)
end if


end subroutine

public function eon_cjsonnodearray of_valuearray (string as_keyname);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_valuearray
//------------------------------------------------------------------------------
// Description: 
//						Gets the value (array) of the specified key.
// 
// Arguments: 
// 						value			string	as_keyname   The name of the key
//						
// Returns:   		eon_cjsonnodearray 
//						The value (eon_cjsonnodearray object) of the specified key.
//						Null if the specified key does not exist or the key value is not an array.
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
 eon_cjsonnodearray lobj_return
	if appeongetclienttype() = "MOBILE" then
		lobj_return = super::of_valuearray(as_keyname)
	else
		setnull(lobj_return)
	end if
return  lobj_return
end function

public function boolean of_valueboolean (string as_keyname);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_valueboolean
//------------------------------------------------------------------------------
// Description: 
//						Gets the boolean value of the specified key.
// 
// Arguments: 
// 						value		string	as_keyname    The name of the key
// Returns:   boolean
//				The value of the specified key.
//				Null if the specified key does not exist or the key value is not a boolean.
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================
boolean lb_return

	if appeongetclienttype() = "MOBILE" then
		lb_return = super::of_valueboolean(as_keyname)
	else	
		setnull(lb_return)
	end if
return lb_return
end function

public function double of_valuedouble (string as_keyname);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_valuedouble
//------------------------------------------------------------------------------
// Description: 
//						Gets the double value of the specified key.
// 
// Arguments: 
// 					value		string	as_keyname     The name of the key
// Returns:   double
//					The value of the specified key.
//					Null if the specified key does not exist or the key value is not a double.
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================

double ldb_return

if appeongetclienttype() = "MOBILE" then
	ldb_return = super::of_valuedouble(as_keyname)
else	
	setnull(ldb_return)
end if
	
return ldb_return
end function

public function long of_valuelong (string as_keyname);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_valuelong
//------------------------------------------------------------------------------
// Description: 
//						Gets the long value of the specified key.
// 
// Arguments: 
// 						value		string	as_keyname      The name of the key
// Returns:   long
//					The value of the specified key.
//					Null if the specified key does not exist or the key value is not a long.
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================

integer li_return

if appeongetclienttype() = "MOBILE" then
	li_return = super::of_valuelong(as_keyname)
else	
	setnull(li_return)
end if
	
return li_return
end function

public function eon_cjsonnode of_valuenode (string as_keyname);// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_valuenode
//------------------------------------------------------------------------------
// Description: 
//						Gets the value (eon_cjsonnode object) of the specified key.
// 
// Arguments: 
// 						value			string	as_keyname			The name of the key.
// Returns:   		eon_cjsonnode 
//						The value (eon_cjsonnode object) of the specified key.
//						Null if the specified key does not exist or the key value is not an eon_cjsonnode object.
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================

eon_cjsonnode lobj_return
if appeongetclienttype() = "MOBILE" then
	lobj_return = super::of_valuenode(as_keyname)
else	
	setnull(lobj_return)
end if
return  lobj_return
end function

public function string of_valuestring (string as_keyname);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_valuestring
//------------------------------------------------------------------------------
// Description: 
//				Gets the string value of the specified key.
// 
// Arguments: 
// 		value		string	as_keyname     The name of the key
// Returns:   string
//					The value of the specified key.
//					Null if the specified key does not exist or the key value is not a string.
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================


string ls_return

if appeongetclienttype() = "MOBILE" then
	ls_return = super::of_valuestring(as_keyname)
else	
	setnull(ls_return)
end if
	
return ls_return
end function

public subroutine of_addkey (string as_keyname, any aa_keyvalue);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_addkey
//------------------------------------------------------------------------------
// Description: 
//		             Adds a key under the current node.
// 
// Arguments: 
// 		value		string	as_keyname 
//							The name of the new key.
//		value		any	aa_keyvalue
//							The value of the new key. 
//							Data type of the value can be long/boolean/string/double/eon_cjsonnode/eon_cjsonnodearray.
// Returns:   (none)
//------------------------------------------------------------------------------
// Author:	APPEON		Date: 2016-03
//------------------------------------------------------------------------------
// Revision History: 
//                                  1.0   Initial version
//=============================================================================

if appeongetclienttype() = "MOBILE" then
	super::of_addkey(as_keyname,aa_keyvalue)
end if
end subroutine

public subroutine of_deletekey (string as_keyname);//==============================================================================
// 
// Copyright ? 2001-2016 Appeon, Inc. and its subsidiaries. All rights reserved.
// 
//------------------------------------------------------------------------------
// Function: eon_cjsonnodeex::of_deletekey
//------------------------------------------------------------------------------
// Description: 
//						Removes a key from the current node.
// 
// Arguments: 
//		value    string		as_keyname 
//								The key to be deleted.
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
	super::of_deletekey(as_keyname)
end if
end subroutine

on eon_cjsonnodeex.create
call super::create
end on

on eon_cjsonnodeex.destroy
call super::destroy
end on

