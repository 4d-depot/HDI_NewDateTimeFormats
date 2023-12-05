var $refDate : Date
var $i; $j : Integer

If (Form:C1466.trace)
	TRACE:C157
End if 

$refDate:=!2023-01-01!  // start on january

Form:C1466.monthNames3:=[]
Form:C1466.monthNames4:=[]
Form:C1466.monthNames5:=[]


For ($i; 0; 11)
	For ($j; 3; 5)
		Form:C1466["monthNames"+String:C10($j)].push(String:C10($refDate; "L"*$j))  //<-- magic is here LLL/LLLL/LLLLL
	End for 
	$refDate:=Add to date:C393($refDate; 0; 1; 0)  // add one MONTH
End for 

OBJECT SET VISIBLE:C603(*; "Arrow_getMonths"; False:C215)