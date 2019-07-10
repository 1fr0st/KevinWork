<?php

require('DBOperations.php');
require('Constants.php');

$response = array();


if ($_SERVER['REQUEST_METHOD'] == 'POST') 
    {

        $location_name = $_POST['location_name'];

        if (empty($location_name) ) {
            $response['error'] = true;
            $response['message'] = "errore valore";
            echo json_encode($response);
            return http_response_code(401);
        }

        $dbo = new DBOperations();
        $dbo-> openConnection();
        // echo $location_name;
        // echo "<br>";
        // echo $location_setup;
        // echo "<br>";

        $result = $dbo->pickRoom($location_name);
        
        if (!empty($result) )
        {
            $response['status'] = "success";
            $response['message'] = 'dato preso';
            echo $result;
            return http_response_code(210);
        }
        else if (empty($result) )
        {
            $response['status'] = "fail";
            $response['message'] = "dato non preso";
            echo $result;
            return http_response_code(209);
        }


        $dbo->closeConnection();

    }