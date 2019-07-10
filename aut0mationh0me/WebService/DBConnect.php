<?php

class DBCOnnect
{

    var $conn;
    var $result;

    function __construct()
    { }

    function connect()
    {
        require_once 'Constants.php';
        $this ->conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
        echo "Connessione";

        if (mysqli_connect_errno()) {
            echo "Failed to connect to MySQL: " . mysqli_connect_error();
        }

        return $this->conn;
    }

    function disconnect()
    {
        $this->conn->close();

    }


}
