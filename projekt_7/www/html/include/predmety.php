<?php

function tabulkaPredmetu($kodPredmetu)
{
    $xml = new DOMDocument;
    $xml->load('../xml/studium.xml');

    $xsl = new DOMDocument;
    $xsl->load("../xml/studium-predmet.xsl");

    $xslt = new XSLTProcessor();
    $xslt->importStylesheet($xsl);

    $xslt->setParameter('', 'kodPredmetu', $kodPredmetu);

    return $xslt->transformToXml($xml);
}

function vratPredmet($kodPredmetu)
{
    $xml = new DOMDocument;
    $xml->load('../xml/studium.xml');

    $xsl = new DOMDocument;
    $xsl->load("../xml/predmet.xsl");

    $xslt = new XSLTProcessor();
    $xslt->importStylesheet($xsl);

    $xslt->setParameter('', 'kodPredmetu', $kodPredmetu);

    return $xslt->transformToXml($xml);
}