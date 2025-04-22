<div id="modalmantenimiento" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <!-- Modal header to show the title -->
            <div class="modal-header">
                <h5 class="modal-title" id="lbltitulo"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"> </button>
            </div>
            <!-- TODO: Formulario de Mantenimiento -->
            <form method="post" id="mantenimiento_form">
                <div class="modal-body">
                    <input type="hidden" name="usu_id" id="usu_id"/>

                    <!-- Email input -->
                    <div class="row gy-2">
                        <div class="col-md-12">
                            <div>
                                <label for="usu_correo" class="form-label">Email</label>
                                <input type="email" class="form-control" id="usu_correo" name="usu_correo" placeholder="Ingrese el email" required/>
                            </div>
                        </div>
                    </div>
                    <!-- Name input -->
                    <div class="row gy-2">
                        <div class="col-md-12">
                            <div>
                                <label for="usu_nom" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="usu_nom" name="usu_nom" placeholder="Ingrese el nombre" required/>
                            </div>
                        </div>
                    </div>
                    <!-- Last Name input -->
                    <div class="row gy-2">
                        <div class="col-md-12">
                            <div>
                                <label for="usu_ape" class="form-label">Apellido</label>
                                <input type="text" class="form-control" id="usu_ape" name="usu_ape" placeholder="Ingrese el apellido" required/>
                            </div>
                        </div>
                    </div>
                    <!-- DNI input -->
                    <div class="row gy-2">
                        <div class="col-md-12">
                            <div>
                                <label for="usu_dni" class="form-label">DNI</label>
                                <input type="text" class="form-control" id="usu_dni" name="usu_dni" placeholder="Ingrese el DNI" required/>
                            </div>
                        </div>
                    </div>
                    <!-- Phone input -->
                    <div class="row gy-2">
                        <div class="col-md-12">
                            <div>
                                <label for="usu_telf" class="form-label">Telefono</label>
                                <input type="tel" class="form-control" id="usu_telf" name="usu_telf" placeholder="Ingrese el teléfono" required/>
                            </div>
                        </div>
                    </div>
                    <!-- Password input -->
                    <div class="row gy-2">
                        <div class="col-md-12">
                            <div>
                                <label for="usu_pass" class="form-label">Contraseña</label>
                                <input type="password" class="form-control" id="usu_pass" name="usu_pass" placeholder="Ingrese la contraseña" required/>
                            </div>
                        </div>
                    </div>
                    <!-- Select for the role -->
                    <div class="row gy-2">
                        <div class="col-md-12">
                            <div>
                                <label for="rol_id" class="form-label">Rol</label>
                                <select type="text" class="form-control form-select" name="rol_id" id="rol_id" aria-label="Seleccionar">
                                </select>
                            </div>
                        </div>
                    </div>
                    <!-- Input for the image -->
                    <div class="row gy-2">
                        <div class="col-md-12">
                            <div>
                                <label for="valueInput" class="form-label">Imagen</label>
                                <input type="file" class="form-control" id="usu_img" name="usu_img"/>
                            </div>
                        </div>
                    </div>          

                    <br>

                    <div class="row gy-2">
                        <div class="col-md-12">
                            <div class="text-center">
                            <a id="btnremovephoto" class="btn btn-danger btn-icon waves-effect waves-light btn-sm"><i class="ri-delete-bin-5-line"></i></a>
                                <div class="profile-user position-relative d-inline-block mx-auto  mb-4">
                                    <span id="pre_imagen"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End modal body -->
                </div>
                <div class="modal-footer">
                    <button type="reset" class="btn btn-light" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" name="action" value="add" class="btn btn-primary ">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>