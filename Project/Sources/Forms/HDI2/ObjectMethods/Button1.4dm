var $refDate : Date
var $i; $j : Integer


If (Form:C1466.trace)
	TRACE:C157
End if 

$refDate:=!2023-10-01!  // the 2023 october first is a sunday!

Form:C1466.dayNames3:=[]
Form:C1466.dayNames4:=[]
Form:C1466.dayNames5:=[]
Form:C1466.dayNames6:=[]

For ($i; 0; 6)
	For ($j; 3; 6)
		Form:C1466["dayNames"+String:C10($j)].push(String:C10($refDate; "c"*$j))  //<-- magic is here ccc/cccc/ccccc/cccccc
	End for 
	$refDate:=Add to date:C393($refDate; 0; 0; 1)  // add one DAY
End for 

OBJECT SET VISIBLE:C603(*; "Arrow_getDays"; False:C215)