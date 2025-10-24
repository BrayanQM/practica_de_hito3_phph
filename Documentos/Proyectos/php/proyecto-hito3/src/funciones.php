<?php
function generaFibonacci($limite) {
    if ($limite <= 0) {
        echo "El límite debe ser mayor a 0";
        return;
    }
    
    $fibonacci = [];
    
    if ($limite >= 1) {
        $fibonacci[] = 1;
    }
    if ($limite >= 2) {
        $fibonacci[] = 1;
    }
    
    for ($i = 2; $i < $limite; $i++) {
        $fibonacci[] = $fibonacci[$i - 1] + $fibonacci[$i - 2];
    }
    
    echo implode(', ', $fibonacci) . ',';
}
?>