<?php

namespace App\Models;

use \PDO;

class Membres
{
    private $connexion;
    
    // Table dans la base des données
    public $table = "membres"; 

    // Propriétés
    public int $id_membre;
    public string $nom_membre;
    public string $postnom_membre;
    public string $prenom_membre;
    public string $sexe;
    public string $mail; 
    public string $profil;
    public string $pass;
    public string $statut_compte;
    public string $statut_membre;
}
