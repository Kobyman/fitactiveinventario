<?php
    // Avoid direct access to the file
    if(!defined('ROOT_PATH')){
        define('ROOT_PATH', dirname(dirname(__FILE__)) . '/');
    }
    // Include the connection and the Rol model
    require_once(ROOT_PATH . "../../config/conexion.php");
    require_once(ROOT_PATH . "../../models/Rol.php");
    
    // Check if the session is started
    if(isset($_SESSION["USU_ID"])){ 
        // Initialize the Rol model
        $rol = new Rol();
        // Check if the user has the required role to access to this page
        $datos = $rol->validar_acceso_rol($_SESSION["USU_ID"],"mntusuario");
        if(is_array($datos) and count($datos)>0){
?>
<!doctype html>
<html lang="es" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">

<head>
    <title>AnderCode | Usuario</title>
    <?php require_once("../html/head.php"); ?>
</head>

<body>

    <div id="layout-wrapper">

        <?php require_once("../html/header.php"); ?>

        <?php require_once("../html/menu.php"); ?>

        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                <h4 class="mb-sm-0">Mantenimiento Usuario</h4>

                                <div class="page-title-right">
                                    <ol class="breadcrumb m-0">
                                        <li class="breadcrumb-item"><a href="javascript: void(0);">Mantenimiento</a></li>
                                        <li class="breadcrumb-item active">Usuario</li>
                                    </ol>
                                </div>

                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">
                                    <button type="button" id="btnnuevo" class="btn btn-primary btn-label waves-effect waves-light rounded-pill"><i class="ri-user-smile-line label-icon align-middle rounded-pill fs-16 me-2"></i> Nuevo Registro</button>
                                </div>
                                <div class="card-body">
                                    <table id="table_data" class="table table-bordered dt-responsive nowrap table-striped align-middle" style="width:100%">
                                        <thead>
                                            <tr>
                                                <th></th>
                                                <th>Correo</th>
                                                <th>Nombre</th>
                                                <th>Apellido</th>
                                                <th>DNI</th>
                                                <th>Telefono</th>
                                                <th>Rol</th>
                                                <th>FechaCreacion</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <?php require_once("../html/footer.php"); ?>
        </div>

    </div>

    <?php require_once("mantenimiento.php"); ?>

    <?php require_once("../html/js.php");?>
    <script type="text/javascript" src="mntusuario.js"></script> 
</body>

</html>
<?php
        // if the user has not the rigth access
        }else{
            header("Location:".Conectar::ruta()."view/404/");
        }
    }else{
        header("Location:".Conectar::ruta()."view/404/");
    }
?>