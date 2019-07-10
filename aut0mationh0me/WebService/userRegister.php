<?php

require('Constants.php');
require('DBOperations.php');

$response = array();
$space = '<br>';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {



    //getting values
    $utente_nome = $_POST['utente_nome'];
    $utente_cognome = $_POST['utente_cognome'];
    $utente_email = $_POST['utente_email'];
    $utente_password = $_POST['utente_password'];

    if (empty($utente_nome) || empty($utente_cognome) || empty($utente_email) || empty($utente_password)) {
        $response['error'] = true;
        $response['message'] = "Valori non inseriti";
        echo json_encode($response);
        return http_response_code(401);
    }

           //creating db operation object
           $dbo = new DBOperations();
           $dbo->openConnection();
           echo $space;
           echo $utente_nome;
           echo $space;
           echo $utente_cognome;
           echo $space;
           echo $utente_email;
           echo $space;
           echo $utente_password;
           
    // $dettagliUtente = $dbo->getUserDetails($utente_nome , $utente_cognome , $utente_email);

    // if (!empty($dettagliUtente)) {
    //     $errorResponse["status"] = "errore";
    //     $errorResponse["message"] = "Utente gia esistente";
    //     echo json_encode($errorResponse);
    //     return;
    // }

   $result = $dbo->registerUser($utente_nome, $utente_cognome, $utente_email, $utente_password);

    if ($result == USER_CREATED)
    {
        $response['error'] = false;
        $response['message'] = 'Utente registrato correttamente';
        echo json_encode($response);
        return http_response_code(202);
    }
    else if ($result == USER_NOT_CREATED)
    {
        $response['error'] = true;
        $response['message'] = 'Utente non registrato';
        echo json_encode($response);
        return http_response_code(210);
    }


    

    $dbo-> closeConnection();









//     //adding user to database
//     $result = $db->createUser($utente_nome, $utente_cognome, $utente_email, $utente_password);

//     //making the response accordingly
//     if ($result == USER_CREATED) {
//         $response['error'] = false;
//         $response['message'] = 'User created successfully';
//     } elseif ($result == USER_ALREADY_EXIST) {
//         $response['error'] = true;
//         $response['message'] = 'User already exist';
//     } elseif ($result == USER_NOT_CREATED) {
//         $response['error'] = true;
//         $response['message'] = 'Some error occurred';
//     }
// } else {
//     $response['error'] = true;
//     $response['message'] = 'Invalid request';
// }







 }

// echo json_encode($response);
