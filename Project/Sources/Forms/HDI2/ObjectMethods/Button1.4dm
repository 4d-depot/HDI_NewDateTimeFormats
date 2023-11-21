
$refDate:=!2023-10-01!  // the 2023 october first is a sunday!

Form:C1466.dayNames:=[]
For ($i; 0; 6)
	//Form.dayNames.push(String($refDate; "eeee")
	Form:C1466.dayNames.push(String:C10($refDate; Internal date long:K1:5))
	$refDate:=Add to date:C393($refDate; 0; 0; 1)
End for 

