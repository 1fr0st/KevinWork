<?php

require('DBOperations.php');
require('Constants.php');

$response = array();


if ($_SERVER['REQUEST_METHOD'] == 'POST') 
    {

        $location_name = $_POST['location_name'];
        $location_setup = $_POST['location_setup'];

        if (empty($location_name) || empty($location_setup) ) {
            $response['error'] = true;
            $response['message'] = "errore valore";
            echo json_encode($response);
            return http_response_code(401);
        }

        $dbo = new DBOperations();
        $dbo-> openConnection();
        echo $location_name;
        echo "<br>";
        echo $location_setup;
        echo "<br>";

        $result = $dbo->setupRoom($location_name , $location_setup);
        
        if ( $result == DATA_UPDATED )
        {
            $response['error'] = false;
            $response['message'] = "dato aggiornato";
            echo json_encode($response);
            return http_response_code(202);
        }
        else if ($result == DATA_NOT_UPDATED )
        {
            $response['error'] = true;
            $response['message'] = "dato non aggiornato";
            echo json_encode($response);
            return http_response_code(210);
        } 


        $dbo->closeConnection();

    }