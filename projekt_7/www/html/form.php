<!DOCTYPE html>
<html lang="cs">

<head>
    <title>Form</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="bg-gray-100">
    <?php
    $myName = @$_REQUEST['my-name'];
    $myNumber = @$_REQUEST['my-number'];
    ?>

    <? include_once 'include/navbar.php'; ?>

    <div class="flex">
        <div class="bg-white shadow-md rounded m-4 px-8 py-6 w-1/2 mr-4">
            <h1 class="text-2xl font-bold mb-4">Ukázka GET</h1>
            <form method="GET">
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2">Jméno: </label>
                    <input type="text" name="my-name" value="<?= $myName ?>"
                        class="px-3 py-2 text-gray-700 border shadow focus:outline-none">
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2">Číslo: </label>
                    <input type="number" name="my-number" value="<?= $myNumber ?>"
                        class="px-3 py-2 text-gray-700 border shadow focus:outline-none">
                </div>
                <input type="submit" value="Odeslat"
                    class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">
            </form>
        </div>

        <div class="bg-white shadow-md rounded m-4 px-8 py-6 w-1/2">
            <h1 class="text-2xl font-bold mb-4">Ukázka POST</h1>
            <form method="POST">
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2">Jméno: </label>
                    <input type="text" name="my-name" value="<?= $myName ?>"
                        class="px-3 py-2 text-gray-700 border shadow focus:outline-none">
                </div>
                <div class="mb-4">
                    <label class="block text-gray-700 text-sm font-bold mb-2">Číslo: </label>
                    <input type="number" name="my-number" value="<?= $myNumber ?>"
                        class="px-3 py-2 text-gray-700 border shadow focus:outline-none">
                </div>
                <input type="submit" value="Odeslat"
                    class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">
            </form>
        </div>
    </div>

    <pre class="bg-white m-8 border border-gray-300 rounded-md p-4 overflow-x-auto" style="max-height: 400px;">
    <?php
    echo "\r\nGET:\r\n";
    print_r($_GET);
    echo "\r\nPOST:\r\n";
    print_r($_POST);
    echo "\r\nREQUEST:\r\n";
    print_r($_REQUEST);
    echo "\r\nSERVER:\r\n";
    print_r($_SERVER);
    ?>
    </pre>

    <div class="flex justify-center text-center">
        <div class="bg-white shadow-md rounded m-4 px-8 py-6 w-1/3">
            <h1 class="text-2xl font-bold mb-4">Přesměrování</h1>
            <form method="GET" action="presmerovani.php">
                <div class="flex items-center mb-4">
                    <label class="text-gray-700 text-sm font-bold mr-2">Jméno: </label>
                    <input type="text" name="my-name" value="<?= $myName ?>"
                        class="flex-grow px-3 py-2 text-gray-700 border shadow focus:outline-none">
                </div>
                <div class="flex justify-center">
                    <input type="submit" value="Odeslat"
                        class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">
                </div>
            </form>
        </div>
    </div>



</body>

</html>