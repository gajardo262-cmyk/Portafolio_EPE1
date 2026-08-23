/* proyectos */

const listaProyectos = document.getElementById("lista-proyectos");

if (listaProyectos) {
  PROYECTOS.forEach((proyecto) => {
    const tarjeta = document.createElement("article");

    tarjeta.classList.add("project-card");

    const numero = String(proyecto.id).padStart(2, "0");

    const tecnologias = proyecto.stack
      .map((tecnologia) => `<span>${tecnologia}</span>`)
      .join("");

    tarjeta.innerHTML = `
      <span class="project-number">${numero}</span>

      <h2>${proyecto.nombre}</h2>

      <p>${proyecto.descripcion}</p>

      <div class="project-technologies">
        ${tecnologias}
      </div>
    `;

    listaProyectos.appendChild(tarjeta);
  });
}


/* contacto */

const formulario = document.querySelector(".contact-form");
const mensajeFormulario = document.querySelector(".form-message");

if (formulario) {
  formulario.addEventListener("submit", (evento) => {
    evento.preventDefault();

    if (!formulario.checkValidity()) {
      formulario.reportValidity();
      return;
    }

    mensajeFormulario.textContent =
      "Formulario validado correctamente.";

    mensajeFormulario.classList.add("show");

    formulario.reset();
  });
}