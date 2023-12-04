<#The newly-improved calibration document consists of lines of text; each line originally contained a specific 
calibration value that the Elves now need to recover. On each line, the calibration value can be found by combining the 
first digit and the last digit (in that order) to form a single two-digit number.#>

$data = Get-Content .\day1\day1.txt
$total = 0
Remove-Variable FirstNumber, LastNumber


foreach ($line in $data) {
    foreach ($char in $line.ToCharArray()) {
        if ($char -match "^\d+$") {
            if (-not($FirstNumber)) {
                $FirstNumber = $char.ToString()
            }
            $LastNumber = $char 
        }
    }
    $completeNumber = $FirstNumber + $LastNumber
    $total += $completeNumber
    Remove-Variable FirstNumber, LastNumber
}

$total