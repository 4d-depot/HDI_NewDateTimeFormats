OBJECT SET VISIBLE:C603(*; "timeFormat_@"; False:C215)
OBJECT SET VISIBLE:C603(*; "timeInput_@"; False:C215)

$index:=Form:C1466.timeFormats.index

$n:=Form:C1466.timeFormats.variations[$index].length
For ($i; 0; $n-1)
	OBJECT SET TITLE:C194(*; "timeFormat_"+String:C10($i+1); Form:C1466.timeFormats.variations[$index][$i])
	OBJECT SET FORMAT:C236(*; "timeInput_"+String:C10($i+1); Form:C1466.timeFormats.variations[$index][$i])
	
	OBJECT SET VISIBLE:C603(*; "timeFormat_"+String:C10($i+1); True:C214)
	OBJECT SET VISIBLE:C603(*; "timeInput_"+String:C10($i+1); True:C214)
End for 
