OBJECT SET VISIBLE:C603(*; "dateFormat_@"; False:C215)
OBJECT SET VISIBLE:C603(*; "dateInput_@"; False:C215)

$index:=Form:C1466.dateFormats.index

$n:=Form:C1466.dateFormats.variations[$index].length
For ($i; 0; $n-1)
	OBJECT SET TITLE:C194(*; "dateFormat_"+String:C10($i+1); Form:C1466.dateFormats.variations[$index][$i])
	OBJECT SET FORMAT:C236(*; "dateInput_"+String:C10($i+1); Form:C1466.dateFormats.variations[$index][$i])
	
	OBJECT SET VISIBLE:C603(*; "dateFormat_"+String:C10($i+1); True:C214)
	OBJECT SET VISIBLE:C603(*; "dateInput_"+String:C10($i+1); True:C214)
End for 