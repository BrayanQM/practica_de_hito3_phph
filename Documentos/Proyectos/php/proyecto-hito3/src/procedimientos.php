<?php
function generaPrimos($limite) {
    if ($limite <= 0) {
        echo "El límite debe ser mayor a 0";
        return;
    }
    
    $primos = [];
    $numero = 2;
    
    while (count($primos) < $limite) {
        $esPrimo = true;
        
        for ($i = 2; $i <= sqrt($numero); $i++) {
            if ($numero % $i == 0) {
                $esPrimo = false;
                break;
            }
        }
        
        if ($esPrimo) {
            $primos[] = $numero;
        }
        $numero++;
    }
    
    echo implode(', ', $primos) . ',';
}
?>