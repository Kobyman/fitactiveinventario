<?php
    class Documento extends Conectar{
        /* TODO: Listar Registros */
        public function get_documento($doc_tipo){
            $conectar=parent::Conexion();
            $sql="CALL SP_L_DOCUMENTO_01 (?)";
            $query=$conectar->prepare($sql);
            $query->bindValue(1,$doc_tipo);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }

    }
?>