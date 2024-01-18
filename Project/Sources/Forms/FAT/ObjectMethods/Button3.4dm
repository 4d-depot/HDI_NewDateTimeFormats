var $s; $format; $item : Text
var $i; $j; $l; $textID; $charCode : Integer
var $dateVariations : Collection


$s:="GYyuQqMLwdDEec"
$l:=Length:C16($s)

$dateVariations:=[]
For ($i; 1; $l)
	For ($j; 1; 6)
		$format:=Substring:C12($s; $i; 1)*$j
		$dateVariations.push($format)
	End for 
End for 

$textID:=1
For each ($item; $dateVariations)
	
	If (Length:C16($item)=1)  // single char must be prefixed by ":"
		$format:=":"+$item  // TEMP TEMP TEMP TEMP
	Else 
		$format:=$item
	End if 
	
	OBJECT SET TITLE:C194(*; "format"+String:C10($textID); $item)
	
	If (Form:C1466.blankIfNull)
		$format:=$format+" blankIfNull"
	End if 
	
	OBJECT SET FORMAT:C236(*; "Input"+String:C10($textID); $format)
	OBJECT SET VALUE:C1742("InputString"+String:C10($textID); String:C10(vDate; $format))
	
	$textID+=1
End for each 

GOTO OBJECT:C206(*; "")



