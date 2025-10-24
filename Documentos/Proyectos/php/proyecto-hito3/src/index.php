<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prácticas HITO 3</title>
    <style>
        .seccion {
            border: 2px solid #333;
            padding: 20px;
            margin: 20px 0;
            border-radius: 10px;
        }
        .practica1 { background-color: #f0f8ff; }
        .practica2 { background-color: #fff0f5; }
        form { margin: 10px 0; }
        input, button { margin: 5px; padding: 8px; }
        .resultado { 
            background-color: #e8f4f8; 
            padding: 10px; 
            margin: 10px 0;
            border-radius: 5px;
        }
        h1, h2 { color: #333; }
    </style>
</head>
<body>
    <h1>PRÁCTICAS HITO 3</h1>

    <!-- PRÁCTICA 1 - NÚMEROS PRIMOS -->
    <div class="seccion practica1">
        <h2>PRÁCTICA 1 - NÚMEROS PRIMOS</h2>
        <form method="POST">
            <label for="limite1">Ingrese un límite:</label>
            <input type="number" id="limite1" name="limite1" min="1" required>
            <br>
            <button type="submit" name="generar1">Generar</button>
            <button type="reset">Limpiar</button>
        </form>
        
        <?php
        if (isset($_POST['generar1']) && isset($_POST['limite1'])) {
            include 'procedimientos.php';
            echo '<div class="resultado">';
            echo '<strong>Números primos generados:</strong><br>';
            generaPrimos((int)$_POST['limite1']);
            echo '</div>';
        }
        ?>
    </div>

    <!-- PRÁCTICA 2 - SERIE FIBONACCI -->
    <div class="seccion practica2">
        <h2>PRÁCTICA 2 - SERIE FIBONACCI</h2>
        <form method="POST">
            <label for="limite2">Ingrese un límite:</label>
            <input type="number" id="limite2" name="limite2" min="1" required>
            <br>
            <button type="submit" name="generar2">Generar</button>
            <button type="reset">Limpiar</button>
        </form>
        
        <?php
        if (isset($_POST['generar2']) && isset($_POST['limite2'])) {
            include 'funciones.php';
            echo '<div class="resultado">';
            echo '<strong>Números Fibonacci generados:</strong><br>';
            generaFibonacci((int)$_POST['limite2']);
            echo '</div>';
        }
        ?>
    </div>
</body>
</html>