<?php
if (isset($_GET['file_name'])) {
    $filename=basename($_GET['file_name']);
    $directory='C:/New_xampp/htdocs/Project/Resume/';
    $filepath=$directory.$filename;

    if (file_exists($filepath)) {
        header ('Content-Description: File Transfer');//tells browser that its a downloadable file
        header('Content-type: application/octet-stream');// supports variable file type 
        header('Content-Disposition: attachment; filename='.$filename);//name for download file
        header('Expires:0');//0 means file expires immediately
        header('Cache-Control:must-revalidate');//tells browser that file should not be cached so gets the latest file
        header('Content-Length:'.filesize($filepath));

        readfile($filepath);
        exit;
    } else {
        echo 'file not found';
    }
//"This is a file to download."
//"Here’s its type and name."
//"Do not cache it; always fetch the latest version."
//"Here’s how big it is, so you can show progress."

}
