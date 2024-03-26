<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML Validation</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="bg-gray-100">
    <?php include_once 'components/navbar.php'; ?>
    <hr class="my-4">
    <div class="container mx-auto py-8">
        <div class="flex flex-wrap">
            <?php $files = glob('../xml/*.xml');
            foreach ($files as $file) {
                $filename = pathinfo($file, PATHINFO_FILENAME); ?>
                <a href="?file=<?= $filename ?>" class="text-white bg-green-500 px-4 py-2 rounded m-2 hover:bg-green-600">
                    <?= $filename ?>
                </a>
            <?php } ?>
        </div>
    </div>
    <section>
        <div class="px-8">
            <?php
            if (isset ($_GET["file"])) {
                $file = "../xml/" . $_GET["file"] . ".xml";
                $file_xsl = "../xml/" . $_GET["file"] . ".xsl";

                $xml = new DOMDocument;
                $xml->load($file);
                $xsl = new DOMDocument;
                $xsl->load($file_xsl);
                $xslt = new XSLTProcessor();
                $xslt->importStylesheet($xsl);
                $transformovany_xml = $xslt->transformToXml($xml);
                echo $transformovany_xml;
            }
            ?>
        </div>
    </section>

</body>

</html>