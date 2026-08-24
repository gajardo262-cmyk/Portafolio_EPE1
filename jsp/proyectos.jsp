<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<!doctype html>
<html lang="es">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <title>Proyectos - Roberto Gajardo</title>

    <meta
      name="description"
      content="Proyectos educativos y laborales de Roberto Gajardo."
    />

    <!--bootstrap-->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />

    <!--tipografía-->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@500&display=swap"
      rel="stylesheet"
    />

    <!--css propio-->
    <link rel="stylesheet" href="../CSS/style.css" />
  </head>

  <body>

    <!--barra de navegación-->

    <nav class="navbar navbar-expand-lg" aria-label="Barra de navegación">
      <div class="container">

        <a class="navbar-brand" href="../Portafolio/index.html">
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

        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">

            <li class="nav-item">
              <a class="nav-link" href="../Portafolio/index.html">
                Inicio
              </a>
            </li>

            <li class="nav-item">
              <a
                class="nav-link active"
                aria-current="page"
                href="proyectos.jsp"
              >
                Proyectos
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="../Portafolio/habilidades.html">
                Habilidades
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="../Portafolio/experiencia.html">
                Experiencia
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="contacto.jsp">
                Contacto
              </a>
            </li>

          </ul>
        </div>

      </div>
    </nav>


    <main>

      <!--proyectos educativos-->

      <section class="projects" aria-labelledby="projects-title">
        <div class="container">

          <div class="projects-head">

            <p class="eyebrow">
              Formación y desarrollo
            </p>

            <h1 id="projects-title">
              Proyectos Educativos
            </h1>

            <p>
              Una selección de trabajos desarrollados durante mi formación
              en Ingeniería en Informática.
            </p>

          </div>


          <!--proyectos obtenidos desde SQL Server-->

          <div class="projects-grid">

            <%
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
                      "SELECT id, nombre, descripcion, tecnologias "
                      + "FROM proyectos "
                      + "ORDER BY id";

                  PreparedStatement consulta =
                      conexion.prepareStatement(sql);

                  ResultSet resultado =
                      consulta.executeQuery();

                  while (resultado.next()) {
            %>

            <article class="project-card">

              <span class="project-number">
                <%= String.format("%02d", resultado.getInt("id")) %>
              </span>

              <h2>
                <%= resultado.getString("nombre") %>
              </h2>

              <p>
                <%= resultado.getString("descripcion") %>
              </p>

              <div class="project-technologies">
                <span>
                  <%= resultado.getString("tecnologias") %>
                </span>
              </div>

            </article>

            <%
                  }

                  resultado.close();
                  consulta.close();
                  conexion.close();

              } catch (Exception e) {
            %>

            <div class="alert alert-danger">
              <strong>Error al cargar los proyectos:</strong>
              <%= e.getMessage() %>
            </div>

            <%
              }
            %>

          </div>

        </div>
      </section>


      <!--proyectos laborales-->

      <section class="work-projects">
        <div class="container">

          <div class="projects-head">
            <p class="eyebrow">
              Experiencia en terreno
            </p>

            <h2>
              Proyectos Laborales
            </h2>

            <p>
              Algunos de los proyectos y faenas en los que he participado
              durante mi trayectoria en minería y sondaje.
            </p>
          </div>


          <div class="projects-grid">

            <article class="project-card">

              <span class="project-number">01</span>

              <h3>Proyecto Exploración La Negra</h3>

              <p class="work-location">
                Mina El Teniente
              </p>

              <p>
                Inicio de mi trayectoria en sondaje, desempeñándome como
                ayudante de sondaje en trabajos de exploración.
              </p>

              <div class="project-technologies">
                <span>Ayudante de sondaje</span>
                <span>Exploración</span>
                <span>Minería</span>
              </div>

            </article>


            <article class="project-card">

              <span class="project-number">02</span>

              <h3>Exploración Gold Fields</h3>

              <p class="work-location">
                Minera Gold Fields
              </p>

              <p>
                Participación en trabajos de exploración, desempeñándome como
                ayudante de sondaje y ampliando mi experiencia en terreno.
              </p>

              <div class="project-technologies">
                <span>Ayudante de sondaje</span>
                <span>Exploración</span>
                <span>Sondaje</span>
              </div>

            </article>


            <article class="project-card">

              <span class="project-number">03</span>

              <h3>Faena Züblin</h3>

              <p class="work-location">
                Mina El Teniente
              </p>

              <p>
                Experiencia en minería subterránea desempeñándome como
                operador de sonda en interior mina.
              </p>

              <div class="project-technologies">
                <span>Operador de sonda</span>
                <span>Interior mina</span>
                <span>Sondaje</span>
              </div>

            </article>


            <article class="project-card">

              <span class="project-number">04</span>

              <h3>Faena 479</h3>

              <p class="work-location">
                Chuquicamata Subterránea
              </p>

              <p>
                Actualmente me desempeño como ayudante de sondaje en trabajos
                de pozos geotécnicos en minería subterránea.
              </p>

              <div class="project-technologies">
                <span>Ayudante de sondaje</span>
                <span>Pozos geotécnicos</span>
                <span>Minería subterránea</span>
              </div>

            </article>

          </div>

        </div>
      </section>

    </main>


    <!--footer-->

    <footer class="footer">
      <div class="container">

        <p>
          &copy; 2026 Roberto Gajardo. Todos los derechos reservados.
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