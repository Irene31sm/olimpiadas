<?php

require_once '../vendor/autoload.php';
require_once '../models/integrantes.php';


use Spipu\Html2Pdf\Html2Pdf; 
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

try {
    $integrante = new Integrante();
    $datosObtenidos = $integrante->reporte1($_GET['idolimpiada']);
    $titulo = $_GET['titulo'];
    ob_start();

    include './estilos.html';
    include './olimpiadas.data.php';

    $content = ob_get_clean();

    $html2pdf = new Html2Pdf('P', 'A4', 'es');
    $html2pdf->writeHTML($content);
    $html2pdf->output('olimpiadas.pdf');
} catch (Html2PdfException $e) {
    $html2pdf->clean();

    $formatter = new ExceptionFormatter($e);
    echo $formatter->getHtmlMessage();
}