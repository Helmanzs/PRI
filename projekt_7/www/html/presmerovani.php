<!DOCTYPE html>
<html lang="en">

<head>
    <title>Ukázka přesměrování</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="flex justify-center items-center bg-gray-100 h-screen relative">
    <?php
    if (isset($_GET["my-name"])) {
        $myName = $_GET["my-name"];
    }
    ?>
    <a href="form.php" class="absolute top-0 left-0 m-4 bg-green-500 text-white px-4 py-2 rounded shadow">
        <span style="font-size: 1.5rem; font-weight: bold;">&larr;</span>
    </a>


    <div class="bg-white p-4 shadow text-center">
        <?php
        if (isset($myName)) {
            echo "<div>";
            echo "Tvoje jméno je: " . $myName;
            echo "</div>";
        } else {
            $message = "Tady nemáš ještě co dělat! " . PHP_EOL . "(zkus nejdříve navštívit form.php)";
            echo "<div style='white-space: pre-wrap;'>";
            echo trim($message);
            echo "</div>";
        } ?>
    </div>
</body>


</html>