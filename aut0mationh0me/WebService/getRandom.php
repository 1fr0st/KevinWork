<?php

require('Constants.php');
require('DBOperations.php');


if ($_SERVER['REQUEST_METHOD'] == 'GET') 
    {
        $dbo = new DBOperations();
        $dbo->openConnection();
        $response = array();



        $sql = "SELECT * FROM valoriNumerici";
 
    $count = mysqli_num_rows(mysqli_query( $dbo->getConnection(), $sql)) ;
    $range = rand(1 , $count);
    echo $range;
    

    return $range;
    $dbo-> closeConnection();

    }
    
 

