<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es" lang="es">

<head>

    <style>
        legend,label {font-weight:bold;}
        p {text-align:right; width:300px;}
        input {font-weight:bold}
    </style>

    <meta charset="UTF-8">

    <script type="text/javascript">
        function validacion() {

            let isbn = document.getElementById("isbn");
            let titulo = document.getElementById("titulo");
            let categoria = document.getElementById("categoria");

            if (isbn.value == "" || titulo.value == "" || categoria.value == "") {
                alert("datos no validos...");
                return false;
            }
            else {
                miFormulario.submit();
            }
        }

        function miFormulario() {

        }
    </script>

    <title>Formulario Libro</title>
</head>
<body>
<form action="InsertarLibro.jsp" onsubmit="return validacion();" >
    <fieldset>
        <legend>Formulario alta libro</legend>
        <p>
            <label for="isbn">ISBN:</label>
            <input id="isbn" type="text" name="isbn"/></p>
        </p>
        <p>
            <label for="titulo">Titulo:</label>
            <input id="titulo" type="text" name= "titulo"/>
        </p>
        <p>
            <label for="categoria">Categoria :</label>
            <input id="categoria" type="text" name="categoria"/>
        </p>
        <p>
            <input type="submit" value="Insertar" />
        </p>
    </fieldset>
</form>
</body>
</html>