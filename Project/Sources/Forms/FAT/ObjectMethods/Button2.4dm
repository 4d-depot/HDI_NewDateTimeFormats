If (Shift down:C543)
	$formatDate:=System date short:K1:1
	$formatTime:=System time short:K7:9
Else 
	$formatDate:=System date abbreviated:K1:2
	$formatTime:=System time long:K7:11
End if 


OBJECT SET FORMAT:C236(*; "sel_col1"; Char:C90($formatDate))  // based on record selection
OBJECT SET FORMAT:C236(*; "sel_foot1"; Char:C90($formatDate))

OBJECT SET FORMAT:C236(*; "arr_col1"; Char:C90($formatDate))  // based on array
OBJECT SET FORMAT:C236(*; "arr_foot1"; Char:C90($formatDate))

OBJECT SET FORMAT:C236(*; "es_col1"; Char:C90($formatDate))  // based on entity selection
OBJECT SET FORMAT:C236(*; "es_foot1"; Char:C90($formatDate))



OBJECT SET FORMAT:C236(*; "sel_col2"; Char:C90($formatTime))  // based on record selection
OBJECT SET FORMAT:C236(*; "sel_foot2"; Char:C90($formatTime))  // based on record selection

OBJECT SET FORMAT:C236(*; "arr_col2"; Char:C90($formatTime))  // based on record selection
OBJECT SET FORMAT:C236(*; "arr_foot2"; Char:C90($formatTime))  // based on record selection

OBJECT SET FORMAT:C236(*; "es_col2"; Char:C90($formatTime))  // based on record selection
OBJECT SET FORMAT:C236(*; "es_foot2"; Char:C90($formatTime))  // based on record selection

