<?php
require_once('Constants.php');
class DBOperations
{




    function __construct()
    { }

    public function createUser($utente_nome, $utente_cognome, $utente_email, $utente_password)
    {

        $utente_password = md5($utente_password);
        $stmt = $this->conn->prepare("INSERT INTO Utenti (utente_nome , utente_cognome ,  utente_email , utente_password) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("sssss", $utente_nome, $utente_cognome, $utente_email, $utente_password);
        if ($stmt->execute()) {
            return USER_CREATED;
        } else {
            return USER_NOT_CREATED;
        }
    }


    public function openConnection()
    {
        $this->conn = new mysqli(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);

        if (mysqli_connect_errno())
            echo new Exception("Could not establish connection with database");
    }


    public function getConnection()
    {
        return $this->conn;
    }

    public function closeConnection()
    {
        if ($this->conn != null)
            $this->conn->close();
    }

    public function registerUser($utente_nome, $utente_cognome, $utente_email, $utente_password)
    {
        $sql = "INSERT INTO Utenti (utente_nome , utente_cognome , utente_email , utente_password) VALUES (? , ? , ? , ?)";
        $statement = $this->conn->prepare($sql);

        if (!$statement) {
            throw new Exception($statement->error);
        }

        $statement->bind_param("ssss", $utente_nome, $utente_cognome, $utente_email, $utente_password);
        // $returnValue = $statement->execute();
        // return $returnValue;

        if ($statement->execute()) {
            return USER_CREATED;
        } else {
            return USER_NOT_CREATED;
        }
    }

    public function setupRoom($location_name , $location_setup)
    {
        $sql = "UPDATE Location SET location_setup = '" .$location_setup. "' WHERE location_name = '" .$location_name. "' ";
        $statement = $this->conn->prepare($sql);

        if (!$statement)
        {
            throw new Exception($statement->error);
        }

        $statement->bind_param("si" , $location_name , $location_setup);

        

        if ($statement->execute() )
        {
            return DATA_UPDATED;
        } else {
            return DATA_NOT_UPDATED;
        }

    }

    public function pickRoom($location_name)
    {
        $sql = "SELECT location_setup as locationStatus FROM Location WHERE location_name = '" .$location_name. "' ";
        // echo $sql;
        $statement = $this->conn->prepare($sql);

        if(!$statement)
        {
            throw new Exception($statement->error);
        }

        $statement->bind_param("s" , $location_name);
        if ($statement->execute() )
        {
            $result = $statement->get_result();
            $row = $result->fetch_assoc();

            // print_r($row);
            extract($row, EXTR_PREFIX_SAME, "dup");
            // echo " $locationStatus is $locationStatus ";

            return $locationStatus;
        }
        else {
            return DATA_NOT_PICKED;
        };  

        
    }

    public function getValue($dispositivo_name)
    {
        $sql = "SELECT Dispositivi.dispositivo_name as nomeDispositivo ,valoriNumerici.valore as temperatura FROM Dispositivi
        INNER JOIN valoriNumerici ON valoriNumerici.id_valore = Dispositivi.dispositivo_id
        WHERE Dispositivi.dispositivo_name = '" .$dispositivo_name. "' ";
        
        $statement = $this->conn->prepare($sql);
        if(!$statement)
        {
            throw new Exception($statement->error);
        }
        $statement->bind_param("s", $dispositivo_name);
        if ($statement->execute() )
        {
            $result = $statement->get_result();
            $row = $result->fetch_assoc();
            extract($row , EXTR_PREFIX_SAME, "dup");
            // echo "Nome dispositivo :  '" .$dispositivo_name. "' e temperatura di : '" .$temperatura."'    ";
            return $temperatura;
        }




    }



    public function getUserDetails($utente_email)
    {
        $returnValue = array();
        $sql = " select * from Utenti where utente_email = '" . $utente_email . "' ";

        $result = $this->conn->query($sql);
        if ($result != null && (mysqli_num_rows($result) >= 1)) {
            $row = $result->fetch_array(MYSQLI_ASSOC);
            if (!empty($row)) {
                $returnValue = $row;
            }
        }
        return $returnValue;
    }

    public function getUserDetailsWithPassword($utente_email, $utente_password)
    {
        $returnValue = array();
        $sql = "SELECT utente_id , utente_email FROM Utenti WHERE utenti_email = '" .$utente_email . "' AND utenti_password = '" .$utente_password."' ";

        $result = $this->conn->query($sql);
        if ($result != null && (mysqli_num_rows($result) >= 1)) {
            $row = $result->fetch_array(MYSQLI_ASSOC);
            if (!empty($row)) {
                $returnValue = $row;
            }
        }
        return $returnValue;
    }





    public function getLog()
    {
        $returnValue = array();
        $sql = " select * from valoriLog INNER JOIN Utenti ON Utente.utente_id = valoriLog.utenteID WHERE Utente.utente_id ='" . $utenteID . "' ";

        $result = $this->conn->query($sql);
        if ($result != null && (mysqli_num_rows($result) >= 1)) {
            $row = $result->fetch_array(MYSQLI_ASSOC);
            if (!empty($row)) {
                $returnValue = $row;
            }
        }
        return $returnValue;
    }


    
}





//  function isUserExist($utente_nome, $utente_cognome, $utente_email)
// {
//     $stmt = $this->conn->prepare("SELECT id FROM Utenti WHERE utente_nome = ? OR utente_cognome = ? OR utente_email = ?");
//     $stmt->bind_param("sss", $utente_nome, $utente_cognome, $utente_email);
//     $stmt->execute();
//     $stmt->store_result();
//     return $stmt->num_rows > 0;
// }
