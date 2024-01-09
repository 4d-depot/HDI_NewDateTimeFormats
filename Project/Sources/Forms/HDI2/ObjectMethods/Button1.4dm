var $refDate : Date
var $i; $j : Integer


If (Form:C1466.trace)
	TRACE:C157
End if 

$refDate:=!2023-10-01!  // the 2023 october first is a sunday!

Form:C1466.dayNames1:=[]
Form:C1466.dayNames2:=[]
Form:C1466.dayNames3:=[]
Form:C1466.dayNames4:=[]

For ($i; 0; 6)
	For ($j; 1; 4)
		Form:C1466["dayNames"+String:C10($j)].push(String:C10($refDate; "c"*($j+2)))  //<-- magic is here ccc/cccc/ccccc/cccccc
	End for 
	$refDate:=Add to date:C393($refDate; 0; 0; 1)  // add one DAY
End for 

For ($i; 1; 4)
	Form:C1466["dropDate"+String:C10($i)]:=New object:C1471
	Form:C1466["dropDate"+String:C10($i)].values:=Form:C1466["dayNames"+String:C10($i)]
	Form:C1466["dropDate"+String:C10($i)].index:=1
End for 


OBJECT SET VISIBLE:C603(*; "Arrow_getDays"; False:C215)
OBJECT SET VISIBLE:C603(*; "Arrow_getDays2"; True:C214)