<?php
// Avoid direct access to the file
if (!defined('ACCESS')) {
    die('Direct access is not allowed');
}

/* TODO: Start Session */
    session_start();
    class Conectar{
        protected $dbh;
        /* TODO: Database connection variables */
        private $db_host = "localhost";
        private $db_name = "compraventa";
        private $db_user = "root";
        private $db_pass = "";

        /* TODO: Database connection */
        protected function Conexion(){
            try{
                /* TODO: Connection String to MySQL */
                $conectar = $this->dbh=new PDO("mysql:host=$this->db_host;dbname=$this->db_name;charset=utf8", $this->db_user, $this->db_pass);
                return $conectar;
            }catch (Exception $e){
                /* TODO: Error Handling, show only a generic error to the user */
                error_log("Error Conexion BD: " . $e->getMessage());
                print "Error en la conexión a la base de datos. Contacte al administrador.<br/>";
                die();
            }
        }

        /* Avoid direct access to the file */
        public function __construct()
        {
             define('ACCESS', true);
        }

        public static function ruta(){
            /* TODO: Ruta de acceso del Proyecto (Validar su puerto y nombre de carpeta por el suyo) */
            return "http://localhost:90/PERSONAL_CompraVenta/";
            /* return "https://compraventaandercode.azurewebsites.net/"; */
        }
    }
?>