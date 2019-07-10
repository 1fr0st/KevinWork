<?php

require('Constants.php');
require('DBOperations.php');

$utente_email = $_POST['utente_email'];
$utente_password = $_POST['utente_password'];
$returnValue = array();

if(empty($utente_email) || empty($utente_password))
{
$returnValue["status"] = "error";
$returnValue["message"] = "un campo mancante";
echo json_encode($returnValue);
return http_response_code(401);
}


$dbo = new DBOperations();
$dbo->openConnection();
$userDetails = $dbo->getUserDetailsWithPassword($utente_email,$utente_password);

if(!empty($userDetails))
{
$returnValue["status"] = "Success";
$returnValue["message"] = "utente registrato";
echo json_encode($returnValue);
return http_response_code(202);
} else {

$returnValue["status"] = "error";
$returnValue["message"] = "Utente non trovato";
echo json_encode($returnValue);
return http_response_code(210);
}

$dao->closeConnection();

?>
