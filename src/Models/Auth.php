<?php

namespace App\Models;

use App\Models\Membres;
use App\Models\Database;
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use \PDO;

class Auth extends Membres 
{
    public function Action(Request $request, Response $response, array $args) 
    {
        $db = new Database();
        $data = $request->getParsedBody();
        $this->mail=htmlspecialchars(strip_tags($data ["mail"]));
        $this->pass=htmlspecialchars(strip_tags($data ["pass"]));


        $sql = "SELECT COUNT(*) AS nbr FROM $this->table WHERE mail = '$this->mail' ";
        $query = $db->getConnection()->prepare($sql);
        $query->execute();
        $data = $query->fetch(PDO::FETCH_ASSOC);
        
        if ($data['nbr'] == 1) 
        {
            $sql = "SELECT pass FROM  $this->table  WHERE mail = '$this->mail' " ;
            $query = $db->getConnection()->prepare($sql);
            $query->execute();
            $data = $query->fetch(PDO::FETCH_ASSOC);
            $password_hash = $data ["pass"];

            if(password_verify($this->pass, $password_hash))
            {
                $sql = "SELECT id_membre FROM $this->table  WHERE mail = '$this->mail'";
                $query = $db->getConnection()->prepare($sql);
                $return = $query->execute();
                $data = $query->fetch(PDO::FETCH_ASSOC);
                $response->getBody()->write(json_encode($data));
                return $response
                ->withHeader('content-type', 'application/json')
                ->withStatus(200);
            } 
            else 
            {
                $error = array("message" => "Authentification error access denied Password Incorrect");
                $response->getBody()->write(json_encode($error));
                return $response
                ->withHeader('content-type', 'application/json')
                ->withStatus(401);
            }    
        }
        else
        {
            $error = array("message" => "Authentification error access denied Mail Incorrect");
            $response->getBody()->write(json_encode($error));
            return $response
            ->withHeader('content-type', 'application/json')
            ->withStatus(401);
        }
    }	
}