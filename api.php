<?php
$pdo = new PDO('mysql:host=localhost;dbname=zabec_test;charset=utf8mb4', 'root', '', array(PDO::ATTR_PERSISTENT => false));

class User
{
    public $userId;
    public $userFirstName;
    public $userLastName;
    public $userEmail;
    public $userCountry;

    public function __construct() {
        global $pdo;
        $sth = $pdo->prepare('SELECT *
            FROM Country
            WHERE Country.countryId = :id');

        $sth->bindParam(':id', $this->userCountry, PDO::PARAM_INT);
        $sth->execute();
        $this->userCountry = $sth->fetchObject('Country');
    }
}

class Country
{
    public $countryId;
    public $countryName;
    public $countryCode;
}

$url = $_SERVER['REQUEST_URI'];
parse_str($url, $array);

$id = reset($array);

$sth = $pdo->prepare('SELECT *
    FROM User
    JOIN Country ON User.userCountry = Country.countryId
    WHERE User.userId = :id');
$sth->bindParam(':id', $id, PDO::PARAM_INT);
$sth->execute();

$user = $sth->fetchObject('User');

unset($user->countryId);
unset($user->countryName);
unset($user->countryCode);

header('Content-Type: application/json; charset=utf-8');

if($user) {
    echo json_encode($user, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_NUMERIC_CHECK);
} else {
    http_response_code(404);
}
