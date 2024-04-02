<!DOCTYPE html>
<html lang="cs">

<? require __DIR__ . '/include/predmety.php' ?>


<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="bg-gray-100">
    <? include_once 'include/navbar.php'; ?>


    <?php
    $predmety = tabulkaPredmetu("");
    ?>

    <div class="flex justify-center text-center">
        <div class="bg-white shadow-md rounded m-4 px-8 py-6 w-1/3">
            <h1 class="text-2xl font-bold mb-4">Vyberte předmět</h1>
            <form method="GET">
                <div class="flex items-center mb-4">
                    <label class="text-gray-700 text-sm font-bold mr-2">Předmět: </label>
                    <?= $predmety ?>
                </div>
                <div class="flex justify-center">
                    <input type="submit" value="Odeslat"
                        class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">
                </div>
            </form>
        </div>
    </div>

    <div class="flex justify-center items-center">
        <div class="bg-white p-4 shadow max-w-md w-full">
            <?php
            if (isset($_GET["kod_predmetu"])) {
                $kod_predmetu = $_GET["kod_predmetu"];
                echo vratPredmet($kod_predmetu);
            }
            ?>
        </div>
    </div>

</body>

</html>