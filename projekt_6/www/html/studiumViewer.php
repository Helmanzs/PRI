<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <title>Studium Viewer</title>
</head>

<body class="bg-gray-100">
    <? include_once 'components/navbar.php'; ?>
    <?php
    $filenameBase = '../xml/studium';
    $xmlFile = "$filenameBase.xml";
    $xml = new DOMDocument;
    $xml->load($xmlFile);

    $xslFiles = glob("$filenameBase-*.xsl");

    ?>
    <header class="px-8 py-4">
        <h1 class=" text-3xl font-bold">Úkoly</h1>
        <div class="flex flex-wrap mt-4">
            <?php
            foreach ($xslFiles as $xslFile) {
                preg_match('/\d+/', $xslFile, $matches);
                $number = $matches[0];
                ?>
                <a href="?file=<?= $xslFile ?>"
                    class="mr-4 mb-4 px-4 py-2 bg-green-500 text-white rounded-md hover:bg-green-600">
                    <?php echo "Úkol $number"; ?>
                </a>
            <?php } ?>
        </div>
        <hr class="mt-4 border-green-500">
    </header>
    <section class="px-8 py-4">
        <kontent>
            <?php
            if (isset ($_GET["file"])) {
                $xsl = new DOMDocument;
                $xsl->load($_GET["file"]);
                $xslt = new XSLTProcessor();
                $xslt->importStylesheet($xsl);
                echo $xslt->transformToXml($xml);
            }
            ?>
        </kontent>
    </section>
</body>

</html>