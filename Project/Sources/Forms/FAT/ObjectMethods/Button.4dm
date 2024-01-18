var $s; $format; $item : Text
var $i; $j; $l; $textID; $charCode : Integer
var $dateVariations : Collection


If (Shift down:C543)
	
	OBJECT SET FORMAT:C236(*; "@"; "")  // clear ALL formats
	
	// DROP DOWNS
	
	OBJECT SET FORMAT:C236(*; "Drop1"; Char:C90(System date abbreviated:K1:2))  // drop down based on array
	OBJECT SET FORMAT:C236(*; "Drop3"; Char:C90(System date abbreviated:K1:2))  // drop down based on collection
	
	OBJECT SET FORMAT:C236(*; "Drop2"; Char:C90(HH MM AM PM:K7:5))  // based on array
	OBJECT SET FORMAT:C236(*; "Drop4"; Char:C90(HH MM AM PM:K7:5))  // drop down based on collection
	
	//COMBO BOXES
	
	OBJECT SET FORMAT:C236(*; "Combo1"; Char:C90(System date abbreviated:K1:2))  // drop down based on array
	OBJECT SET FORMAT:C236(*; "Combo3"; Char:C90(System date abbreviated:K1:2))  // drop down based on collection
	
	OBJECT SET FORMAT:C236(*; "Combo2"; Char:C90(HH MM AM PM:K7:5))  // based on array
	OBJECT SET FORMAT:C236(*; "Combo4"; Char:C90(HH MM AM PM:K7:5))  // drop down based on collection
	
Else 
	
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
		
		
		If (Length:C16($item)=1)  // single char must be prefixed by ":"
			$format:=":"+$item  // TEMP TEMP TEMP TEMP
		Else 
			$format:=$item
		End if 
		
		If ($textID=91)  // hours
			$textID:=101
		End if 
		
		If ($textID=167)  // date + hours
			$textID:=201
		End if 
		
		OBJECT SET TITLE:C194(*; "format"+String:C10($textID); $item)
		
		If (Form:C1466.blankIfNull)
			$format:=$format+" blankIfNull"
		End if 
		
		If ($textID<=200)
			OBJECT SET FORMAT:C236(*; "Input"+String:C10($textID); $format)
		End if 
		
		Case of 
			: ($textID<=100)
				OBJECT SET VALUE:C1742("InputString"+String:C10($textID); String:C10(vDate; $format))
			: ($textID<=200)
				OBJECT SET VALUE:C1742("InputString"+String:C10($textID); String:C10(vTime; $format))
			Else 
				OBJECT SET VALUE:C1742("InputString"+String:C10($textID); String:C10(vDate; $format; vTime))
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
		
		If (Form:C1466.blankIfNull)
			$format:=$item+" blankIfNull"
		Else 
			$format:=$item
		End if 
		
		OBJECT SET TITLE:C194(*; "format"+String:C10($textID); $item)
		OBJECT SET VALUE:C1742("InputString"+String:C10($textID); String:C10(vDate; $format; vTime))
		
		$textID+=1
	End for each 
	
	
	
	// ********************   ETC  ********************
	
	// LIST BOX COLUMNS & FOOTER
	OBJECT SET FORMAT:C236(*; "sel_col1"; "MMMM")  // based on record selection
	OBJECT SET FORMAT:C236(*; "sel_foot1"; "MMMM")
	
	OBJECT SET FORMAT:C236(*; "arr_col1"; "MMMM")  // based on array
	OBJECT SET FORMAT:C236(*; "arr_foot1"; "MMMM")
	
	OBJECT SET FORMAT:C236(*; "es_col1"; "MMMM")  // based on entity selection
	OBJECT SET FORMAT:C236(*; "es_foot1"; "MMMM")
	
	
	OBJECT SET FORMAT:C236(*; "sel_col2"; "hh:mm")  // based on record selection
	OBJECT SET FORMAT:C236(*; "sel_foot2"; "hh:mm")  // based on record selection
	
	OBJECT SET FORMAT:C236(*; "arr_col2"; "hh:mm")  // based on array
	OBJECT SET FORMAT:C236(*; "arr_foot2"; "hh:mm")  // based on record selection
	
	OBJECT SET FORMAT:C236(*; "es_col2"; "hh:mm")  // based on entity selection
	OBJECT SET FORMAT:C236(*; "es_foot2"; "hh:mm")  // based on record selection
	
	// DROP DOWNS
	
	OBJECT SET FORMAT:C236(*; "Drop1"; "MMMM")  // drop down based on array
	OBJECT SET FORMAT:C236(*; "Drop2"; "hh:mm")  // based on array
	OBJECT SET FORMAT:C236(*; "Drop3"; "MMMM")  // drop down based on collection
	OBJECT SET FORMAT:C236(*; "Drop4"; "hh:mm")  // drop down based on collection
	
	//COMBO BOXES
	
	OBJECT SET FORMAT:C236(*; "Combo1"; "MMMM")  // drop down based on array
	OBJECT SET FORMAT:C236(*; "Combo2"; "hh:mm")  // based on array
	OBJECT SET FORMAT:C236(*; "Combo3"; "MMMM")  // drop down based on collection
	OBJECT SET FORMAT:C236(*; "Combo4"; "hh:mm")  // drop down based on collection
	
	
End if 


