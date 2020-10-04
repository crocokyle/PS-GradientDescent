$numDays = 1,2,6,8,11,12,17,18,19,24,26,29,30,32,37,39,40,45,46
$price = 196.03,30.74,64.46,78.92,41.37,73.51,135.03,229.71,60.08,75.64,32.66,158.04,158.54,43.10,61.50,27.80,120.53,46.68,57.40
cls

$theta0 = 1
$theta1 = 1

$alpha = 0.001

$sumTheta0 = 0
$sumTheta1 = 0

if ($numDays.count -eq $price.count)
{
    $numExamples = $numDays.count
    Write-Host "Training examples provided: "$numExamples
}
else 
{
    Write-Host "Error: Number of training examples are mismatched" 
    Write-Host "Days: " $numDays.count
    Write-Host "Price: " $price.count
}

while($true)
{
    for($i=0; $i -lt $numExamples; $i++)
    {
        $sumTheta0 = ($theta0 + $theta1 * $numDays[$i]) - $price[$i]
        $sumTheta0 += $sumTheta0

        $sumTheta1 = (($theta0 + $theta1 * $numDays[$i]) - $price[$i]) * $numDays[$i]
        $sumTheta1 += $sumTheta1
    }
    $theta0 = $theta0 - ($alpha * 1 / $numExamples) * $sumTheta0
    $theta1 = $theta1 - ($alpha * 1 / $numExamples) * $sumTheta1
    Start-Sleep -Milliseconds 100
    Write-Host "Theta0 = " $theta0
    Write-Host "Theta1 = " $theta1
    Write-Host "-------------------"
}