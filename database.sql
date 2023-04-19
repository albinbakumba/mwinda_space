CREATE DATABASE IF NOT EXISTS `mwinda_space` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

use mwinda_space; 

create table membres(
    id_membre int(10) NOT NULL AUTO_INCREMENT,
    nom_membre varchar(20) not null,
    postnom_membre varchar(20) not null,
    prenom_membre varchar(20) not null,
    sexe char(5) not null,
    mail varchar(40) not null,
    profil varchar(1050) default(""),
    pass varchar(60) not null,
    statut_compte varchar(15) not null,
    statut_membre varchar(15) not null,
    primary key(id_membre)
)ENGINE=InnoDB CHARSET=utf8;


INSERT INTO `membres` (`id_membre`, `nom_membre`, `postnom_membre`, `prenom_membre`, `sexe`, `mail`, `profil`, `pass`, `statut_compte`, `statut_membre`) VALUES
(1, 'KALOMBO', 'MUKENA', 'Benjamin', 'M', 'bmukena85@gmail.com', '', '$2y$10$B.m3nU9FREkosEnBaC1KH.lcmgn9jNwI9k4figtmHeKj0Ob7.r21e', 'actif', 'Admin');





create table posts(
    id_poste int(10) NOT NULL AUTO_INCREMENT,
    details_poste varchar(500) not null,
    Date_heure_poste varchar(20) NOT NULL,
    id_membre int(10) not null,
    f_join varchar(3) NOT NULL,
    primary key(id_poste)
) ENGINE=InnoDB CHARSET=utf8;


create table fichier_joint(
    id_fichier int(10) NOT NULL AUTO_INCREMENT,
    id_poste int(10) NOT NULL,
    contenu_fichier_joint varchar(1050) default(""),
    type_fichier varchar(10) default(""),
    primary key(id_fichier)
) ENGINE=InnoDB CHARSET=utf8;


create table vu_posts(
    id_membre int(10) NOT NULL,
    id_poste int(10) NOT NULL,
    date_heure_vupost varchar(20) not NULL
)ENGINE=InnoDB CHARSET=utf8;

create table reaction(
    id_reaction int(10) NOT NULL AUTO_INCREMENT,
    id_membre int(10) NOT NULL,
    id_poste int(10) NOT NULL,
    detail_reaction varchar(500),
    date_heure_raction varchar(20) NOT NULL,
    primary key(id_reaction)
)ENGINE=InnoDB CHARSET=utf8;



ALTER TABLE  fichier_joint 
ADD constraint FK_vup 
foreign key(id_poste)
references posts(id_poste);



ALTER TABLE  posts 
ADD constraint FK_membre_Po 
foreign key(id_membre)
references membres(id_membre); 




ALTER TABLE  vu_posts 
ADD constraint FK_vu_pm 
foreign key(id_membre)
references membres(id_membre);


ALTER TABLE  vu_posts 
ADD constraint FK_vu_pp 
foreign key(id_poste)
references posts(id_poste);


ALTER TABLE  reaction 
ADD constraint FK_r1 
foreign key(id_poste)
references posts(id_poste);



ALTER TABLE  reaction 
ADD constraint FK_r2
foreign key(id_membre)
references membres(id_membre);









