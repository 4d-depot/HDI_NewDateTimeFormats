
var $i; $min; $max : Integer

$min:=101
$max:=154

For ($i; $min; $max)
	OBJECT SET FORMAT:C236(*; "Input"+String:C10($i); "")  // clear ALL formats
	OBJECT SET VALUE:C1742("InputString"+String:C10($i); "")
End for 

GOTO OBJECT:C206(*; "")
