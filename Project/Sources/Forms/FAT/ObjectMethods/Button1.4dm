var $textID : Integer
var $format : Text

Form:C1466.allFormats:=[]

$textID:=1
For ($textID; 1; 166)
	
	$format:=OBJECT Get format:C894(*; "Input"+String:C10($textID))
	Form:C1466.allFormats.push($format)
End for 

FORM GOTO PAGE:C247(3)

