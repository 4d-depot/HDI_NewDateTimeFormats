var $s; $format; $item : Text
var $i; $j; $l; $textID; $charCode : Integer
var $dateVariations : Collection

$s:="XxOz"
$l:=Length:C16($s)

$dateVariations:=[]
For ($i; 1; $l)
	For ($j; 1; 6)
		$format:=Substring:C12($s; $i; 1)*$j
		$dateVariations.push($format)
	End for 
End for 

$textID:=201
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
	OBJECT SET VALUE:C1742("InputString"+String:C10($textID); String:C10(vTime; $format))
	
	$textID+=1
End for each 




$dateVariations:=[]

$dateVariations.push("dd/MM/YYYY hh:mm:ss a X")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a XX")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a XXX")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a XXXX")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a XXXXXX")

$dateVariations.push("dd/MM/YYYY hh:mm:ss a x")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a xx")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a xxx")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a xxxx")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a xxxxx")

$dateVariations.push("dd/MM/YYYY hh:mm:ss a O")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a OOOO")

$dateVariations.push("dd/MM/YYYY hh:mm:ss a z")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a zz")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a zzz")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a zzzz")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a zzzzz")
$dateVariations.push("dd/MM/YYYY hh:mm:ss a zzzzzz")

$textID:=225
For each ($item; $dateVariations)
	
	If (Form:C1466.blankIfNull)
		$format:=$item+" blankIfNull"
	Else 
		$format:=$item
	End if 
	
	OBJECT SET TITLE:C194(*; "format"+String:C10($textID); $item)
	OBJECT SET VALUE:C1742("InputString"+String:C10($textID); String:C10(vDate; $format; vTime))
	
	$textID+=1
End for each 


GOTO OBJECT:C206(*; "")


