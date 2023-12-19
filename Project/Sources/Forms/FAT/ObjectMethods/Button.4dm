var $s; $format; $item : Text
var $i; $j; $l; $textID; $charCode : Integer
var $dateVariations : Collection


$s:="GYyuQqMLwdDEec"+"t"+"abBhHkKmsS"+"t"+"XxOz"  //"t" don't exist as format token
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
	
	// e h k m must be prefixed by ":"
	
	If (Length:C16($item)=1)
		
		//$charCode:=Character code($item)
		//If ($charCode=Character code("e")) || ($charCode=Character code("h")) || ($charCode=Character code("k")) || ($charCode=Character code("m"))
		//$format:=":"+$item
		//Else 
		//$format:=$item
		//End if 
		
		$format:=":"+$item  // TEMP TEMP TEMP TEMP
		
	Else 
		$format:=$item
	End if 
	
	If ($textID=91)  // on passe aux heures
		$textID:=101
	End if 
	
	If ($textID=167)  // on passe aux date + heures
		$textID:=201
	End if 
	
	OBJECT SET TITLE:C194(*; "format"+String:C10($textID); $item)
	
	If (Form:C1466.blankIfNull)
		$format:=$format+"blankIfNull"
	End if 
	
	If ($textID<=200)
		OBJECT SET FORMAT:C236(*; "Input"+String:C10($textID); $format)
	End if 
	
	Case of 
		: ($textID<=100)
			OBJECT SET VALUE:C1742("InputString"+String:C10($textID); String:C10(vDate; $item))
		: ($textID<=200)
			OBJECT SET VALUE:C1742("InputString"+String:C10($textID); String:C10(vTime; $item))
		Else 
			OBJECT SET VALUE:C1742("InputString"+String:C10($textID); String:C10(vDate; $item; vTime))
	End case 
	
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
	
	OBJECT SET TITLE:C194(*; "format"+String:C10($textID); $item)
	
	OBJECT SET VALUE:C1742("InputString"+String:C10($textID); String:C10(vDate; $item; vTime))
	
	$textID+=1
End for each 

//OBJECT SET FORMAT(*; "myDate"; "(yyyy) MMM dd")  // (2017) Dec 12
//OBJECT SET FORMAT(*; "mytime"; "hh'h' mm'mn' ss'sec.'")  // 15h 12mn 17sec. 
