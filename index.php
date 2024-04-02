<!DOCTYPE html>
<html lang="cs">

<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>

<body class="bg-gray-100">
    <? include_once 'include/navbar.php'; ?>
    <section>
        <div class="container mx-auto py-8">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
                <div class="bg-white shadow-md rounded px-8 py-6">
                    <h1 class="text-2xl font-bold mb-4">Validátor pomocí DTD</h1>
                    <p class="mb-4">Nahrajte XML soubor, případně také DTD soubor.</p>
                    <form enctype="multipart/form-data" method="POST">
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2">XML soubor:</label>
                            <input type="file" name="xml" accept="text/xml"
                                class="w-full border px-4 py-2 rounded focus:outline-none focus:border-green-500">
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2">DTD soubor:</label>
                            <input type="file" name="dtd"
                                class="w-full border px-4 py-2 rounded focus:outline-none focus:border-green-500">
                        </div>
                        <input type="submit" value="Odeslat"
                            class="bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600">
                    </form>
                </div>

                <div class="bg-white shadow-md rounded px-8 py-6">
                    <h1 class="text-2xl font-bold mb-4">Validátor pomocí XSD</h1>
                    <p class="mb-4">Nahrajte XML soubor, případně také XSD soubor.</p>
                    <form enctype="multipart/form-data" method="POST">
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2">XML soubor:</label>
                            <input type="file" name="xml" accept="text/xml"
                                class="w-full border px-4 py-2 rounded focus:outline-none focus:border-green-500">
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2">XSD soubor:</label>
                            <input type="file" name="xsd"
                                class="w-full border px-4 py-2 rounded focus:outline-none focus:border-green-500">
                        </div>
                        <input type="submit" value="Odeslat"
                            class="bg-green-500 text-white px-4 py-2 rounded cursor-pointer transition duration-300 hover:bg-green-600">
                    </form>
                </div>
            </div>
        </div>
    </section>

    <?php
    function printErrors()
    { ?>
        <table>
            <?php foreach (libxml_get_errors() as $error) { ?>
                <tr>
                    <td>
                        <?= $error->line ?>
                    </td>
                    <td>
                        <?= $error->message ?>
                    </td>
                </tr>
            <?php } ?>
        </table>
        <?php
    }

    function validateDTD($xmlPath, $dtdPath = '')
    {
        $doc = new DOMDocument;

        // proběhne kontrola well-formed
        libxml_use_internal_errors(true);
        $doc->loadXML(file_get_contents($xmlPath));
        printErrors();
        libxml_use_internal_errors(false);

        // Máme root a DTD?
        @$root = $doc->firstElementChild->tagName;
        if ($root && $dtdPath) {
            $root = $doc->firstElementChild->tagName;
            $systemId = 'data://text/plain;base64,' . base64_encode(file_get_contents($dtdPath));

            echo "<p>Validuji podle DTD. Kořen: <b>$root</b></p>";

            // inject DTD into XML
            $creator = new DOMImplementation;
            $doctype = $creator->createDocumentType($root, '', $systemId);
            $newDoc = $creator->createDocument(null, '', $doctype);
            $newDoc->encoding = "utf-8";

            $oldRootNode = $doc->getElementsByTagName($root)->item(0);
            $newRootNode = $newDoc->importNode($oldRootNode, true);

            $newDoc->appendChild($newRootNode);
            $doc = $newDoc;
        }

        // validace
        libxml_use_internal_errors(true);
        $isValid = $doc->validate();
        printErrors();
        libxml_use_internal_errors(false);

        return $isValid;
    }

    function validateXsd($xmlPath, $xsdPath = '')
    {
        $doc = new DOMDocument;
        libxml_use_internal_errors(true);
        $doc->loadXML(file_get_contents($xmlPath));
        printErrors();
        libxml_use_internal_errors(false);

        $isValid = false;
        if ($xsdPath) {
            libxml_use_internal_errors(true);
            $isValid = $doc->schemaValidate($xsdPath);
            printErrors();
            libxml_use_internal_errors(false);
        }

        return $isValid;
    }

    $xmlFile = @$_FILES['xml'];
    $dtdFile = @$_FILES['dtd'];
    $xsdFile = @$_FILES['xsd'];
    if (@$xmlTmpName = $xmlFile['tmp_name']) {
        if (@$dtdTmpName = $dtdFile['tmp_name']) {
            $isValid = validateDTD($xmlTmpName, $dtdTmpName);
            if ($isValid)
                echo "Nahraný XML soubor je validní.";
        }

        if (@$xsdTmpName = $xsdFile['tmp_name']) {
            $isValid = validateXsd($xmlTmpName, $xsdTmpName);
            if ($isValid)
                echo "Nahraný XML soubor je validní.";
        }
    }
    ?>
</body>

</html>