<?php
    // Verificar si se está accediendo directamente al archivo
    if (basename($_SERVER['PHP_SELF']) == basename(__FILE__)) {
        header("Location: ../404/");
        exit();
    }

    // Incluir archivos necesarios
    require_once("config/conexion.php"); // Archivo de conexión a la base de datos
    require_once("models/Usuario.php"); // Modelo de usuario

    // Inicializar variables
    $error = ""; // Mensaje de error
    $com_id = null; // ID de la compañía

    // Verificar si el parámetro 'c' está definido y es un número entero
    if (!isset($_GET['c'])) { // Si el parámetro 'c' no está definido
        $error .= "Error: El parámetro 'c' no está definido en la URL.<br>"; // Agregar mensaje de error
    } elseif (!is_numeric($_GET['c'])) { // Si el parámetro 'c' no es un número
        $error .= "Error: El parámetro 'c' debe ser un número entero.<br>"; // Agregar mensaje de error
    } else { // Si el parámetro 'c' está definido y es un número
        $com_id = intval($_GET['c']); // Convertir el parámetro 'c' a un entero
    }

    // Verificar si se ha enviado el formulario de login
    if (isset($_POST["enviar"]) && $_POST["enviar"] == "si") { // Si se ha enviado el formulario
        // Validar que los campos del formulario no estén vacíos
        if (!isset($_POST['emp_id']) || empty($_POST['emp_id'])) { // Si el campo 'emp_id' está vacío
            $error .= "Error: El campo 'Empresa' es requerido.<br>"; // Agregar mensaje de error
        }
        if (!isset($_POST['suc_id']) || empty($_POST['suc_id'])) { // Si el campo 'suc_id' está vacío
            $error .= "Error: El campo 'Sucursal' es requerido.<br>"; // Agregar mensaje de error
        }
        if (!isset($_POST['usu_correo']) || empty($_POST['usu_correo'])) { // Si el campo 'usu_correo' está vacío
            $error .= "Error: El campo 'Correo Electronico' es requerido.<br>"; // Agregar mensaje de error
        }
        //Validar que el correo sea un formato valido
        if (!filter_var($_POST['usu_correo'], FILTER_VALIDATE_EMAIL)) { // Si el correo no es válido
            $error .= "Error: El campo 'Correo Electronico' no es valido.<br>"; // Agregar mensaje de error
        }
        if (!isset($_POST['usu_pass']) || empty($_POST['usu_pass'])) { // Si el campo 'usu_pass' está vacío
            $error .= "Error: El campo 'Contraseña' es requerido.<br>"; // Agregar mensaje de error
        }
        // Si no hay errores, procesar el login
        if (empty($error)) { // Si no hay errores
        $usuario = new Usuario();
        $loginResult = $usuario->login($com_id); // Llamar al método login del modelo Usuario
            if(is_array($loginResult)){
                $error .= $loginResult["error"];
            }
        } 

       
    }

?>

<!doctype html>
<html lang="es" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">

<head>
    <meta charset="utf-8" />
    <title>AnderCode | Acceso </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesbrand" name="author" />

    <link rel="shortcut icon" href="../../assets/images/favicon.ico">

    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

    <script src="assets/js/layout.js"></script>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/custom.min.css" rel="stylesheet" type="text/css" />
</head>

<body>


    <div class="auth-page-wrapper auth-bg-cover py-5 d-flex justify-content-center align-items-center min-vh-100">

        <div class="bg-overlay"></div>

        <div class="auth-page-content overflow-hidden pt-lg-5">
            <?php if (!empty($error)) { ?>
                <div class="alert alert-danger" role="alert">
                    <?php echo $error; ?>
                </div>
            <?php } ?>

            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card overflow-hidden">
                            <div class="row g-0">
                                <div class="col-lg-6">
                                    <div class="p-lg-5 p-4 auth-one-bg h-100">
                                        <div class="bg-overlay"></div>
                                        <div class="position-relative h-100 d-flex flex-column">
                                            <div class="mt-auto">
                                                <div class="mb-3">
                                                    <i class="ri-double-quotes-l display-4 text-success"></i>
                                                </div>

                                                <div id="qoutescarouselIndicators" class="carousel slide" data-bs-ride="carousel">
                                                    <div class="carousel-indicators">
                                                        <button type="button" data-bs-target="#qoutescarouselIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                                                        <button type="button" data-bs-target="#qoutescarouselIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                                        <button type="button" data-bs-target="#qoutescarouselIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                                                    </div>
                                                    <div class="carousel-inner text-center text-white-50 pb-5">
                                                        <div class="carousel-item active">
                                                            <p class="fs-15 fst-italic">" Great! Clean code, clean design, easy for customization. Thanks very much! "</p>
                                                        </div>
                                                        <div class="carousel-item">
                                                            <p class="fs-15 fst-italic">" The theme is really great with an amazing customer support."</p>
                                                        </div>
                                                        <div class="carousel-item">
                                                            <p class="fs-15 fst-italic">" Great! Clean code, clean design, easy for customization. Thanks very much! "</p>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-6">
                                    <div class="p-lg-5 p-4">
                                        <div>
                                            <h5 class="text-primary">Bienvenido !</h5>
                                            <p class="text-muted">Acceder a AnderCode</p>
                                        </div>

                                        <div class="mt-4">
                                            <form action="<?php echo $_SERVER['PHP_SELF'] . '?c=' . $com_id; ?>" method="post" id="login_form">

                                                <div class="mb-3">
                                                    <label for="emp_id" class="form-label">Empresa</label>
                                                    <select type="text" class="form-control form-select" name="emp_id" id="emp_id" aria-label="Seleccionar">
                                                    </select>
                                                </div> 
                                                
                                                <div class="mb-3">
                                                    <label for="suc_id" class="form-label">Sucursal</label>
                                                    <select type="text" class="form-control form-select" name="suc_id" id="suc_id" aria-label="Seleccionar">
                                                        <option selected>Seleccionar</option>

                                                    </select>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="usu_correo" class="form-label">Correo Electronico</label>
                                                    <input type="text" class="form-control" name="usu_correo" id="usu_correo" placeholder="Ingrese Correo Electronico">
                                                </div>

                                                <div class="mb-3">
                                                    <div class="float-end">
                                                        <a href="auth-pass-reset-cover.html" class="text-muted">Olvide Contraseña?</a>
                                                    </div>
                                                    <label class="form-label" for="usu_pass">Contraseña</label>
                                                    <div class="position-relative auth-pass-inputgroup mb-3">
                                                        <input type="password" class="form-control pe-5" placeholder="Ingrese Contraseña" name="usu_pass" id="usu_pass">
                                                        <button class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted" type="button" id="password-addon"><i class="ri-eye-fill align-middle"></i></button>
                                                    </div>
                                                </div>

                                                <div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="" id="auth-remember-check">
                                                    <label class="form-check-label" for="auth-remember-check">Recuerdame</label>
                                                </div>

                                                <div class="mt-4">
                                                    <input type="hidden" name="enviar" value="si">
                                                    <button class="btn btn-success w-100" type="submit">Acceder</button>
                                                </div>

                                            </form>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>

                    </div>

                </div>
            </div>
        </div>

        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <p class="mb-0">&copy;
                                <script>document.write(new Date().getFullYear())</script> Velzon. Crafted with <i class="mdi mdi-heart text-danger"></i> by Themesbrand
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>

    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/libs/simplebar/simplebar.min.js"></script>
    <script src="assets/libs/node-waves/waves.min.js"></script>
    <script src="assets/libs/feather-icons/feather.min.js"></script>
    <script src="assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
<!--     <script src="assets/js/plugins.js"></script> -->

    <script src="assets/js/pages/password-addon.init.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script type="text/javascript" src="login.js"></script>
</body> 

</html>