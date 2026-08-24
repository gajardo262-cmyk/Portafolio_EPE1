<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
  request.setCharacterEncoding("UTF-8");

  String mensajeEstado = "";
  String tipoMensaje = "";

  if ("POST".equalsIgnoreCase(request.getMethod())) {

      String nombre = request.getParameter("nombre");
      String correo = request.getParameter("correo");
      String asunto = request.getParameter("asunto");
      String mensaje = request.getParameter("mensaje");

      String url =
          "jdbc:sqlserver://localhost:1433;"
          + "databaseName=PortafolioDB;"
          + "integratedSecurity=true;"
          + "encrypt=true;"
          + "trustServerCertificate=true;";

      try {

          Class.forName(
              "com.microsoft.sqlserver.jdbc.SQLServerDriver"
          );

          Connection conexion =
              DriverManager.getConnection(url);

          String sql =
              "INSERT INTO mensajes "
              + "(nombre, correo, asunto, mensaje) "
              + "VALUES (?, ?, ?, ?)";

          PreparedStatement consulta =
              conexion.prepareStatement(sql);

          consulta.setString(1, nombre);
          consulta.setString(2, correo);
          consulta.setString(3, asunto);
          consulta.setString(4, mensaje);

          consulta.executeUpdate();

          consulta.close();
          conexion.close();

          mensajeEstado =
              "Mensaje enviado correctamente.";

          tipoMensaje = "success";

      } catch (Exception e) {

          mensajeEstado =
              "No fue posible guardar el mensaje.";

          tipoMensaje = "danger";
      }
  }
%>

<!doctype html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />

    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0"
    />

    <title>Contacto - Roberto Gajardo</title>

    <meta
      name="description"
      content="Página de contacto del portafolio de Roberto Gajardo."
    />

  
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    
    <link
      rel="preconnect"
      href="https://fonts.googleapis.com"
    />

    <link
      rel="preconnect"
      href="https://fonts.gstatic.com"
      crossorigin
    />

    <link
      href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@500&display=swap"
      rel="stylesheet"
    />

>
    <link
      rel="stylesheet"
      href="../CSS/style.css"
    />
  </head>

  <body>

   
    <nav
      class="navbar navbar-expand-lg"
      aria-label="Barra de navegación"
    >
      <div class="container">

        <a
          class="navbar-brand"
          href="../Portafolio/index.html"
        >
          Roberto Gajardo
        </a>

        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Abrir menú de navegación"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <div
          class="collapse navbar-collapse"
          id="navbarNav"
        >
          <ul class="navbar-nav">

            <li class="nav-item">
              <a
                class="nav-link"
                href="../Portafolio/index.html"
              >
                Inicio
              </a>
            </li>

            <li class="nav-item">
              <a
                class="nav-link"
                href="proyectos.jsp"
              >
                Proyectos
              </a>
            </li>

            <li class="nav-item">
              <a
                class="nav-link"
                href="../Portafolio/habilidades.html"
              >
                Habilidades
              </a>
            </li>

            <li class="nav-item">
              <a
                class="nav-link"
                href="../Portafolio/experiencia.html"
              >
                Experiencia
              </a>
            </li>

            <li class="nav-item">
              <a
                class="nav-link active"
                aria-current="page"
                href="contacto.jsp"
              >
                Contacto
              </a>
            </li>

          </ul>
        </div>

      </div>
    </nav>


    <main>

      <!--contacto-->

      <section class="contact-page">
        <div class="container">

          <div class="contact-head">

            <p class="eyebrow">
              Hablemos
            </p>

            <h1>
              Contacto
            </h1>

            <p>
              Si deseas comunicarte conmigo por temas profesionales,
              académicos o relacionados con tecnología y minería,
              puedes utilizar los siguientes medios.
            </p>

          </div>


          <div class="contact-layout">

            <!--información de contacto-->

            <div class="contact-info">

              <div class="contact-info-item">

                <span>01</span>

                <div>

                  <p>
                    Correo
                  </p>

                  <a href="mailto:Gajardo262@gmail.com">
                    Gajardo262@gmail.com
                  </a>

                </div>

              </div>


              <div class="contact-info-item">

                <span>02</span>

                <div>

                  <p>
                    GitHub
                  </p>

                  <a
                    href="https://github.com/gajardo262-cmyk"
                    target="_blank"
                    rel="noopener"
                  >
                    github.com/gajardo262-cmyk
                  </a>

                </div>

              </div>

            </div>


            <!--formulario-->

            <form
              class="contact-form"
              method="post"
              action="contacto.jsp"
            >

              <div class="form-group">

                <label for="nombre">
                  Nombre
                </label>

                <input
                  type="text"
                  id="nombre"
                  name="nombre"
                  placeholder="Tu nombre"
                  required
                />

              </div>


              <div class="form-group">

                <label for="correo">
                  Correo electrónico
                </label>

                <input
                  type="email"
                  id="correo"
                  name="correo"
                  placeholder="correo@ejemplo.com"
                  required
                />

              </div>


              <div class="form-group">

                <label for="asunto">
                  Asunto
                </label>

                <input
                  type="text"
                  id="asunto"
                  name="asunto"
                  placeholder="Motivo del mensaje"
                  required
                />

              </div>


              <div class="form-group">

                <label for="mensaje">
                  Mensaje
                </label>

                <textarea
                  id="mensaje"
                  name="mensaje"
                  rows="6"
                  placeholder="Escribe tu mensaje"
                  required
                ></textarea>

              </div>


              <button
                type="submit"
                class="contact-submit"
              >
                Enviar mensaje
              </button>


              <% if (!mensajeEstado.isEmpty()) { %>

                <div
                  class="alert alert-<%= tipoMensaje %> mt-3"
                  role="alert"
                >
                  <%= mensajeEstado %>
                </div>

              <% } %>

            </form>

          </div>

        </div>
      </section>

    </main>


    <!--footer-->

    <footer class="footer">
      <div class="container">

        <p>
          &copy; 2026 Roberto Gajardo.
          Todos los derechos reservados.
        </p>

        <a
          class="footer-link"
          href="https://github.com/gajardo262-cmyk"
          target="_blank"
          rel="noopener"
        >
          GitHub
        </a>

      </div>
    </footer>


    <!--bootstrap js-->

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
    ></script>

  </body>
</html>