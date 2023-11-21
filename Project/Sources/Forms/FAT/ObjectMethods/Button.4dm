
$s:="GYyuQqMLwdDEec"+"abGhHKkmsSXxOz"
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
	
	OBJECT SET TITLE:C194(*; "format"+String:C10($textID); $item)
	//OBJECT SET FORMAT(*; "Input"+String($textID); $item)
	
	$textID+=1
	
	If ($textID=85)
		$textID:=101
	End if 
	
End for each 