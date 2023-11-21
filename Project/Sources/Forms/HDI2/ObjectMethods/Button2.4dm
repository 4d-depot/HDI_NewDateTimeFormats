
$refDate:=!2023-01-01!  // start on january

Form:C1466.monthNames:=[]
For ($i; 0; 11)
	//Form.dayNames.push(String($refDate; "MMMM")
	Form:C1466.monthNames.push(String:C10($refDate; Internal date long:K1:5))
	$refDate:=Add to date:C393($refDate; 0; 1; 0)
End for 

