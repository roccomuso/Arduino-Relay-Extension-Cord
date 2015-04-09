<?php


if (isset($_GET['action'])) {

$comando = $_GET['action'];
$comando = preg_replace('/[^a-zA-Z0-9]/', '', $comando); //vengono filtrati tutti i caratteri speciali, disponibili lettere minuscole, maiuscole e numeri.
$ip = $_SERVER['REMOTE_ADDR'];

//scriviamo il file di log.txt che ci indica il comando lanciato, a che ora, e da qualche indirizzo IP:

// . . .


//scriviamo il file di comando.txt

$filename= "comando.txt";
$file = fopen($filename, "r+") or exit("errore apertura file");
$random = rand(1000,9999);
$str = fwrite($file, "$comando $random");


}

//se è presente il parametro "status", verrà restituito l'ultimo valore nel file di log. Questo parametro viene usato dalla richiesta in AJAX per ottenere il valore.

if (isset($_GET['status'])){
$filename = "comando.txt";
$file=fopen($filename,"r") or exit("Impossibile aprire il file!");
$str = fread($file, filesize($filename));

echo substr($str, 0, strpos($str, " "));
}

?>