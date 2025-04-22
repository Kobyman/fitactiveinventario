
// Get the branch ID from the hidden input
var suc_id = $('#SUC_IDx').val();

// Initialization function
function init(){
    // When the form is submitted, call the saveOrUpdate function
    $("#mantenimiento_form").on("submit",function(e){
        saveOrUpdate(e);
    });
}

// Function to handle saving or updating a user
function saveOrUpdate(e){
    // Prevent the default form submission
    e.preventDefault();
    // Get the form data
    var formData = new FormData($("#mantenimiento_form")[0]);
    // Append the branch ID to the form data
    formData.append('suc_id',$('#SUC_IDx').val());

    // AJAX request to send the form data
    $.ajax({
        // URL to the controller
        url:"../../controller/usuario.php?op=guardaryeditar",
        // Method
        type:"POST",
        // Data to send
        data:formData,
        // Needed to send FormData
        contentType:false,
        // Needed to send FormData
        processData:false,
        // If success
        success:function(data){
            // Reload the DataTable
            $('#table_data').DataTable().ajax.reload();
            // Hide the modal
            $('#modalmantenimiento').modal('hide');
            // Show a success message
            swal.fire({
                title:'Usuario',
                text: 'Registro Confirmado',
                icon: 'success'
            });
        },
        // If fail
        error: function(error){
            console.log(error);
            swal.fire({
                title:'Error',
                text: 'Error al guardar el registro',
                icon: 'error'
            });
        }
    });
}

// Document ready function
$(document).ready(function(){
    // Load the roles
    $.post("../../controller/rol.php?op=combo",{suc_id:suc_id},function(data){
        $("#rol_id").html(data);
    // If fail
    }).fail(function(error){
        console.log(error);
        swal.fire({
            title:'Error',
            text: 'Error al cargar los roles',
            icon: 'error'
        });
    });

    // Initialize the DataTable
    $('#table_data').DataTable({
        "aProcessing": true,
        "aServerSide": true,
        dom: 'Bfrtip',
        buttons: [
            'copyHtml5',
            'excelHtml5',
            'csvHtml5',
        ],
        "ajax":{
            url:"../../controller/usuario.php?op=listar",
            type:"post",
            data:{suc_id:suc_id}
        },
        \"bDestroy\": true,
        \"responsive\": true,
        \"bInfo\":true,
        \"iDisplayLength\": 10,
        \"order\": [[ 0, \"desc\" ]],
        \"language\": {
            \"sProcessing\":     \"Procesando...\",
            \"sLengthMenu\":     \"Mostrar _MENU_ registros\",
            \"sZeroRecords\":    \"No se encontraron resultados\",
            \"sEmptyTable\":     \"Ningún dato disponible en esta tabla\",
            \"sInfo\":           \"Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros\",
            \"sInfoEmpty\":      \"Mostrando registros del 0 al 0 de un total de 0 registros\",
            \"sInfoFiltered\":   \"(filtrado de un total de _MAX_ registros)\",
            \"sInfoPostFix\":    \"\",
            \"sSearch\":         \"Buscar:\",
            \"sUrl\":            \"\",
            \"sInfoThousands\":  \",\",
            \"sLoadingRecords\": \"Cargando...\",
            \"oPaginate\": {
                \"sFirst\":    \"Primero\",
                \"sLast\":     \"Último\",
                \"sNext\":     \"Siguiente\",
                \"sPrevious\": \"Anterior\"
            },
            "oAria": {
                \"sSortAscending\":  \": Activar para ordenar la columna de manera ascendente\",
                \"sSortDescending\": \": Activar para ordenar la columna de manera descendente\"
            }
        },
    });

});

function editar(usu_id){
    // AJAX request to get the user data
    $.post("../../controller/usuario.php?op=mostrar",{usu_id:usu_id},function(data){
        // Parse the JSON data
        data=JSON.parse(data);
        // Fill the modal inputs
        $('#usu_id').val(data.USU_ID);
        $('#usu_correo').val(data.USU_CORREO);
        $('#usu_nom').val(data.USU_NOM);
        $('#usu_ape').val(data.USU_APE);
        $('#usu_dni').val(data.USU_DNI);
        $('#usu_telf').val(data.USU_TELF);
        // Remove the password value
        $('#usu_pass').val('');
        // Set the selected role
        $('#rol_id').val(data.ROL_ID).trigger('change');
        // Set the user image
        setUserImage(data.USU_IMG);
    // If fail
    }).fail(function(error){
        console.log(error);
        swal.fire({
            title:'Error',
            text: 'Error al cargar el usuario',
            icon: 'error'
        });
    });
    // Set the modal title
    $('#lbltitulo').html('Editar Registro');
    // Show the modal
    $('#modalmantenimiento').modal('show')
}

function eliminar(usu_id){
    // Show a confirmation message
    swal.fire({
        title:"Eliminar!",
        text:"Desea Eliminar el Registro?",
        icon: "error",
        // Button to confirm
        confirmButtonText : "Si",
        // Show the cancel button
        showCancelButton : true,
        cancelButtonText: "No",
    }).then((result)=>{
        if (result.value){
            $.post("../../controller/usuario.php?op=eliminar",{usu_id:usu_id},function(data){
                console.log(data);
            });
            // Reload the table
            $('#table_data').DataTable().ajax.reload();
            // Show a success message
            swal.fire({
                title:'Usuario',
                text: 'Registro Eliminado',
                icon: 'success'
            });
        // If fail
        }else{
            swal.fire({
                title:'Error',
                text: 'Error al eliminar el registro',
                icon: 'error'
            });
        }
    });
}

// When the new button is clicked
$(document).on("click","#btnnuevo",function(){
    // Clean the values
    $('#usu_id').val('');
    $('#usu_nom').val('');
    // Set the modal title
    $('#lbltitulo').html('Nuevo Registro');
    // Set the default image
    setDefaultImage();
    // Reset the form
    $("#mantenimiento_form")[0].reset();
    // Show the modal
    $('#modalmantenimiento').modal('show');
});

// Function to show a preview of the image
function filePreview(input) {
    if (input.files && input.files[0]) {
        // Create a new FileReader
        var reader = new FileReader();
        // When the file is loaded
        reader.onload = function (e) {
            // Set the image in the modal
            $('#pre_imagen').html('<img src='+e.target.result+' class="rounded-circle avatar-xl img-thumbnail user-profile-image" alt="user-profile-image"></img>');
        }
        // Read the file as a DataURL
        reader.readAsDataURL(input.files[0]);
    }
}

// When the input image changes
$(document).on('change','#usu_img',function(){
    // Show the preview
    filePreview(this);
});

// When the remove photo button is clicked
$(document).on("click","#btnremovephoto",function(){
    // Clean the value
    $('#usu_img').val('');
    // Set the default image
    setDefaultImage();
});

// Function to set the default image
function setDefaultImage(){
    // Set the default image
    $('#pre_imagen').html('<img src="../../assets/usuario/no_imagen.png" class="rounded-circle avatar-xl img-thumbnail user-profile-image" alt="user-profile-image"></img><input type="hidden" name="hidden_usuario_imagen" value="" />');
}

// Function to set the user image
function setUserImage(image){
    if(image != ''){
        // If there is an image, show it
        $('#pre_imagen').html('<img src="../../assets/usuario/'+image+'" class="rounded-circle avatar-xl img-thumbnail user-profile-image" alt="user-profile-image"></img><input type="hidden" name="hidden_usuario_imagen" value="'+image+'" />');
    }else{
        // If not, show the default image
        setDefaultImage();
    }
}

$(document).ajaxError(function( event, jqxhr, settings, thrownError ){
    swal.fire({
        title:'Error',
        text: 'Error en la llamada',
        icon: 'error'
    });
});

init();