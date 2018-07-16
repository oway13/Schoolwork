<?php 

    libxml_use_internal_errors(true);
    $xml = simplexml_load_file('dbconfig.xml') or die("Error Loading XML File");

    $db_servername = (string)$xml->host;
    $db_username = (string)$xml->user;
    $db_password = (string)$xml->password;
    $db_name = (string)$xml->database;
    $db_port = (string)$xml->port;

?>




