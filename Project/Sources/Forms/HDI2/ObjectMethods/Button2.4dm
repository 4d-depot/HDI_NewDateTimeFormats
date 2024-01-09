var $refDate : Date
var $i; $j : Integer

If (Form:C1466.trace)
	TRACE:C157
End if 

$refDate:=!2023-01-01!  // start on january

Form:C1466.monthNames1:=[]
Form:C1466.monthNames2:=[]
Form:C1466.monthNames3:=[]


For ($i; 0; 11)
	For ($j; 1; 3)
		Form:C1466["monthNames"+String:C10($j)].push(String:C10($refDate; "L"*($j+2)))  //<-- magic is here LLL/LLLL/LLLLL
	End for 
	$refDate:=Add to date:C393($refDate; 0; 1; 0)  // add one MONTH
End for 


For ($i; 1; 3)
	Form:C1466["dropMonth"+String:C10($i)]:=New object:C1471
	Form:C1466["dropMonth"+String:C10($i)].values:=Form:C1466["monthNames"+String:C10($i)]
	Form:C1466["dropMonth"+String:C10($i)].index:=1
End for 

OBJECT SET VISIBLE:C603(*; "Arrow_getMonths"; False:C215)
OBJECT SET VISIBLE:C603(*; "Arrow_getMonths2"; True:C214)