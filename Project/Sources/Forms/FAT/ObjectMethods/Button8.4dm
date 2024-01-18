var $i; $min; $max : Integer

$min:=201
$max:=242

For ($i; $min; $max)
	OBJECT SET VALUE:C1742("InputString"+String:C10($i); "")
End for 

GOTO OBJECT:C206(*; "")
