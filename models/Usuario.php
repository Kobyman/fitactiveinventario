<?php
    class Usuario extends Conectar{
        /**
         * TODO: Listar Registros
         */
        public function get_usuario_x_suc_id($suc_id){
            $conectar=parent::Conexion();
            $sql="CALL SP_L_USUARIO_01 (?)";
            $query=$conectar->prepare($sql);
            $query->bindValue(1,$suc_id);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC); //retorna todos los datos de la tabla.
        }


        /* TODO: Listar Registro por ID en especifico */
        public function get_usuario_x_usu_id($usu_id){
            $conectar=parent::Conexion();
            $sql="CALL SP_L_USUARIO_02 (?)";
            $query=$conectar->prepare($sql);
            $query->bindValue(1,$usu_id);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }

        /**
         * TODO: Eliminar o cambiar estado a eliminado
         */
        public function delete_usuario($usu_id){
            $conectar=parent::Conexion();
            $sql="CALL SP_D_USUARIO_01 (?)";
            $query=$conectar->prepare($sql);
            $query->bindValue(1,$usu_id);
            $query->execute();
        }

        /**
         * TODO: Registro de datos
         * @param $suc_id
         * @param $usu_correo
         * @param $usu_nom
         * @param $usu_ape
         * @param $usu_dni
         * @param $usu_telf
         * @param $usu_pass
         * @param $rol_id
         * @param $usu_img
         * @return void
         */
        public function insert_usuario($suc_id,$usu_correo,$usu_nom,$usu_ape,$usu_dni,$usu_telf,$usu_pass,$rol_id,$usu_img){
            $conectar=parent::Conexion();
            //hash password
            $usu_pass_hash = password_hash($usu_pass, PASSWORD_DEFAULT);

            $usu_img_new = '';
            if($_FILES["usu_img"]["name"] !=''){ //checks if there is an image.
                $usu_img_new=$this->upload_image();
            }


            $sql="CALL SP_I_USUARIO_01 (?,?,?,?,?,?,?,?,?)";
            $query=$conectar->prepare($sql);
            $query->bindValue(1,$suc_id);
            $query->bindValue(2,$usu_correo);
            $query->bindValue(3,$usu_nom);
            $query->bindValue(4,$usu_ape);
            $query->bindValue(5,$usu_dni);
            $query->bindValue(6,$usu_telf);
            $query->bindValue(7,$usu_pass_hash);
            $query->bindValue(8,$rol_id);
            $query->bindValue(9,$usu_img_new);
            $query->execute();
        }

        /**
         * TODO:Actualizar Datos
         * @param $usu_id
         * @param $suc_id
         * @param $usu_correo
         * @param $usu_nom
         * @param $usu_ape
         * @param $usu_dni
         * @param $usu_telf
         * @param $usu_pass
         * @param $rol_id
         * @param $usu_img
         * @return void
         */
        public function update_usuario($usu_id,$suc_id,$usu_correo,$usu_nom,$usu_ape,$usu_dni,$usu_telf,$usu_pass,$rol_id,$usu_img){
            $conectar=parent::Conexion();

            //hash password
            $usu_pass_hash = password_hash($usu_pass, PASSWORD_DEFAULT);

            $usu_img_new='';
            if($_FILES["usu_img"]["name"] !=''){ //checks if there is an image.
                $usu_img_new=$this->upload_image();
            }else{
                $usu_img_new = $_POST["hidden_usuario_imagen"];
            }

            $sql="CALL SP_U_USUARIO_01 (?,?,?,?,?,?,?,?,?,?)";
            $query=$conectar->prepare($sql);
            $query->bindValue(1,$usu_id);
            $query->bindValue(2,$suc_id);
            $query->bindValue(3, $usu_correo);
            $query->bindValue(4, $usu_nom);
            $query->bindValue(5, $usu_ape);
            $query->bindValue(6, $usu_dni);
            $query->bindValue(7, $usu_telf);
            $query->bindValue(8, $usu_pass_hash);
            $query->bindValue(9, $rol_id);
            $query->bindValue(10,$usu_img_new);
            $query->execute();
        }

        /**
         * Update the user password
         * @param $usu_id
         * @param $usu_pass
         * @return array
         */
        public function update_usuario_pass($usu_id,$usu_pass){
            $conectar=parent::Conexion();
            $usu_pass_hash = password_hash($usu_pass, PASSWORD_DEFAULT);
            $sql="CALL SP_U_USUARIO_02 (?,?)";
            $query=$conectar->prepare($sql);
            $query->bindValue(1,$usu_id);
            $query->bindValue(2, $usu_pass_hash);
            $query->execute();
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }

        /**
         * Retrieves the user data from the database.
         * @param $sucursal
         * @param $correo
         * @param $com_id
         * @return mixed
         */
        private function get_user_data($sucursal, $correo, $com_id){
            $conectar = parent::Conexion();
            $sql = "CALL SP_L_USUARIO_04 (?,?,?)";
            $query = $conectar->prepare($sql);
            $query->bindValue(1, $sucursal);
            $query->bindValue(2, $correo);
            $query->bindValue(3, $com_id);
            $query->execute();
            return $query->fetch(PDO::FETCH_ASSOC); //retorna solo una fila.
        }

        /**
         * Verify if the password is correct.
         * @param $user_data
         * @param $password
         * @return bool
         */
        private function verify_password($user_data, $password){
            return password_verify($password, $user_data['USU_PASS']);
        }

        /**
         * TODO:Acceso al Sistema
         * @param $com_id
         * @return void
         */
        public function login($com_id){
            $conectar=parent::Conexion();
            if (isset($_POST["enviar"])){
                // Recepcion de Parametros desde la Vista Login
                $sucursal = $_POST["suc_id"];
                $correo = $_POST["usu_correo"];
                $pass =  $_POST["usu_pass"];
                if (empty($sucursal) || empty($correo) || empty($pass)){ //check if any of the values is empty.
                    return array("error" => "Todos los campos son requeridos");
                }else{
                    $resultado = $this->get_user_data($sucursal, $correo, $com_id); //call the function to get the user data.
                    if (is_array($resultado) && count($resultado)>0){ //check if there are results.
                        if($this->verify_password($resultado, $pass)){ // call the function to verify the password.
                            //Generar variables de Session del Usuario
                        $_SESSION['USU_ID']=$resultado['USU_ID'];
                        $_SESSION['USU_NOM']=$resultado['USU_NOM'];
                        $_SESSION['USU_APE']=$resultado['USU_APE'];
                        $_SESSION['USU_CORREO']=$resultado['USU_CORREO'];
                        $_SESSION['SUC_ID']=$resultado['SUC_ID'];
                        $_SESSION['COM_ID']=$resultado['COM_ID'];
                        $_SESSION['EMP_ID']=$resultado['EMP_ID'];
                        $_SESSION['ROL_ID']=$resultado['ROL_ID'];
                        $_SESSION['USU_IMG']=$resultado['USU_IMG']; //set the session variables.
                            //Validar Rol
                        require_once('../models/Rol.php');
                        $rol = new Rol();
                        $datos = $rol->validar_acceso_rol($_SESSION['USU_ID'],'dashboard');
                        if(is_array($datos) && count($datos)>0){ //validates the role.
                            header('Location:'.Conectar::ruta().'view/home/');
                        }else{
                            header('Location:'.Conectar::ruta().'view/404/');
                        }
                    }else{
                        return array("error" => "Contraseña incorrecta"); //return an error if the password is not correct.
                       }
                    }else{
                        return array("error" => "Usuario no encontrado"); //return an error if the user is not found.
                    }
                }
            }else{
                return array("error" => "No se enviaron datos"); //return an error if the form was not send.
            }
        }

        /**
         * Upload the user image to the server.
         */
        public function upload_image(){
            if (isset($_FILES["usu_img"])){
                $extension = explode('.', $_FILES['usu_img']['name']);
                $new_name = rand() . '.' . $extension[1];
                $destination = '../assets/usuario/' . $new_name;
                move_uploaded_file($_FILES['usu_img']['tmp_name'], $destination);
                return $new_name;
            }
        }
    }
?>