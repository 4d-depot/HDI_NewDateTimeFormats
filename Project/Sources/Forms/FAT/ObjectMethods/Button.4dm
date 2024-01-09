var $s; $format; $item : Text
var $i; $j; $l; $textID; $charCode : Integer
var $dateVariations : Collection

/*

$s:="GYyuQqMLwdDEec"+"t"+"abBhHkKmsS"+"t"+"XxOz"  //"t" don't exist as format token
$l:=Length($s)

$dateVariations:=[]
For ($i; 1; $l)
For ($j; 1; 6)
$format:=Substring($s; $i; 1)*$j
$dateVariations.push($format)
End for 
End for 

$textID:=1
For each ($item; $dateVariations)

// e h k m must be prefixed by ":"

If (Length($item)=1)

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

OBJECT SET TITLE(*; "format"+String($textID); $item)

If (Form.blankIfNull)
$format:=$format+" blankIfNull"
End if 

If ($textID<=200)
OBJECT SET FORMAT(*; "Input"+String($textID); $format)
End if 

Case of 
: ($textID<=100)
OBJECT SET VALUE("InputString"+String($textID); String(vDate; $item))
: ($textID<=200)
OBJECT SET VALUE("InputString"+String($textID); String(vTime; $item))
Else 
OBJECT SET VALUE("InputString"+String($textID); String(vDate; $item; vTime))
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

OBJECT SET TITLE(*; "format"+String($textID); $item)

OBJECT SET VALUE("InputString"+String($textID); String(vDate; $item; vTime))

$textID+=1
End for each 

//OBJECT SET FORMAT(*; "myDate"; "(yyyy) MMM dd")  // (2017) Dec 12
//OBJECT SET FORMAT(*; "mytime"; "hh'h' mm'mn' ss'sec.'")  // 15h 12mn 17sec. 


// LIST BOX COLUMNS & FOOTER
OBJECT SET FORMAT(*; "sel_col1"; "MMMM")  // based on record selection
OBJECT SET FORMAT(*; "sel_foot1"; "MMMM")

OBJECT SET FORMAT(*; "arr_col1"; "MMMM")  // based on array
OBJECT SET FORMAT(*; "arr_foot1"; "MMMM")

OBJECT SET FORMAT(*; "es_col1"; "MMMM")  // based on entity selection
OBJECT SET FORMAT(*; "es_foot1"; "MMMM")


OBJECT SET FORMAT(*; "sel_col2"; "hh:mm")  // based on record selection
OBJECT SET FORMAT(*; "sel_foot2"; "hh:mm")  // based on record selection

OBJECT SET FORMAT(*; "arr_col2"; "hh:mm")  // based on array
OBJECT SET FORMAT(*; "arr_foot2"; "hh:mm")  // based on record selection

OBJECT SET FORMAT(*; "es_col2"; "hh:mm")  // based on entity selection
OBJECT SET FORMAT(*; "es_foot2"; "hh:mm")  // based on record selection

// DROP DOWNS

OBJECT SET FORMAT(*; "Drop1"; "MMMM")  // drop down based on array
OBJECT SET FORMAT(*; "Drop2"; "hh:mm")  // based on array
OBJECT SET FORMAT(*; "Drop3"; "MMMM")  // drop down based on collection
OBJECT SET FORMAT(*; "Drop4"; "hh:mm")  // drop down based on collection

//COMBO BOXES

OBJECT SET FORMAT(*; "Combo1"; "MMMM")  // drop down based on array
OBJECT SET FORMAT(*; "Combo2"; "hh:mm")  // based on array
OBJECT SET FORMAT(*; "Combo3"; "MMMM")  // drop down based on collection
OBJECT SET FORMAT(*; "Combo4"; "hh:mm")  // drop down based on collection

// TAB CONTROL
OBJECT SET FORMAT(*; "tabControl1"; "MMMM")  // tab control based on collection


*/

//COMBO BOXES (STRING ET NUM)

OBJECT SET FORMAT:C236(*; "ComboText"; "## ## ## ## ## ## ## ## ## ## ## ## ## ##")  // drop down based on array
OBJECT SET FORMAT:C236(*; "ComboNum"; "###,###,##0.0000")  // based on array




