
$refDate:=!2023-01-01!  // start on january

Form:C1466.monthNames3:=[]
Form:C1466.monthNames4:=[]
Form:C1466.monthNames5:=[]


For ($i; 0; 11)
	For ($j; 3; 5)
		Form:C1466["monthNames"+String:C10($j)].push(String:C10($refDate; "M"*$j)
	End for 
	$refDate:=Add to date:C393($refDate; 0; 1; 0)
End for 
