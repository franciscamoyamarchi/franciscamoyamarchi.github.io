# Sitio web de Francisca Moya Marchi

Sitio académico estático hecho con **R Markdown** (`rmarkdown::render_site()`) y
publicado en **GitHub Pages**. No necesita servidor, base de datos ni Jekyll: los
`.Rmd` se convierten en HTML dentro de la carpeta `docs/`, y GitHub Pages sirve
esa carpeta.

## Qué hay en cada archivo

| Archivo | Para qué sirve |
|---|---|
| `index.Rmd` | Página de inicio (Bio) |
| `research.Rmd` | Research |
| `teaching.Rmd` | Teaching |
| `policy.Rmd` | Policy |
| `_site.yml` | Configuración del sitio: menú, carpeta de salida, CSS |
| `styles.css` | Todo el diseño (colores, tipografías, layout) |
| `_includes/head.html` | Metadatos y tipografías de Google Fonts |
| `_includes/rail.html` | Columna azul de la izquierda: nombre, menú, contacto |
| `_includes/footer.html` | Pie de página y script que marca la sección activa |
| `build.R` | Script que genera el sitio en `docs/` |
| `docs/` | Sitio generado. **Esta es la carpeta que publica GitHub** |

## Requisitos

- R (4.x) y, muy recomendable, RStudio.
- El paquete `rmarkdown`: `install.packages("rmarkdown")`.

## Paso 1 — Generar el sitio en tu computador

En RStudio, abre `build.R` y pulsa **Source**. O desde la terminal, dentro de la
carpeta del proyecto:

```bash
Rscript build.R
```

Se crea la carpeta `docs/`. Abre `docs/index.html` en el navegador para revisar
el resultado. Cada vez que edites un `.Rmd` o el CSS, vuelve a ejecutar
`build.R`.

## Paso 2 — Subirlo a GitHub

Si nunca has usado Git, la vía más simple es la web de GitHub:

1. Entra a <https://github.com/new> y crea un repositorio **público** llamado
   `franciscamoya.github.io` (reemplaza `franciscamoya` por tu usuario de
   GitHub). Con ese nombre exacto, el sitio queda en
   `https://tuusuario.github.io`.
2. En el repositorio vacío, pulsa **uploading an existing file** y arrastra
   *todos* los archivos y carpetas del proyecto, incluida `docs/`.
3. Escribe un mensaje ("primera versión") y pulsa **Commit changes**.

Con Git desde la terminal es lo mismo en cuatro líneas:

```bash
git init
git add .
git commit -m "Primera versión del sitio"
git branch -M main
git remote add origin https://github.com/TUUSUARIO/TUUSUARIO.github.io.git
git push -u origin main
```

## Paso 3 — Activar GitHub Pages

En el repositorio: **Settings → Pages**. En *Build and deployment*:

- Source: **Deploy from a branch**
- Branch: **main**, carpeta **/docs**
- **Save**

En uno o dos minutos el sitio queda publicado. GitHub muestra la dirección en
esa misma página.

> El archivo `docs/.nojekyll` lo crea `build.R` y es necesario: sin él, GitHub
> ignora la carpeta `site_libs` y el sitio se ve sin estilos.

## Paso 4 — Actualizar el sitio

1. Edita el `.Rmd` que corresponda.
2. Ejecuta `build.R`.
3. Sube los cambios (arrastrando los archivos en GitHub, o con
   `git add . && git commit -m "Actualiza research" && git push`).

## Qué hay que personalizar antes de publicar

Busca y reemplaza estos marcadores:

- `EMAIL@ucl.ac.uk` en `_includes/rail.html` y `teaching.Rmd`.
- Los enlaces de Google Scholar y LinkedIn en `_includes/rail.html`.
- Los bloques grises marcados como *Placeholder* en `research.Rmd`,
  `teaching.Rmd` y `policy.Rmd`: son las secciones `::: {.todo} ... :::`.
  Bórralas cuando pongas el contenido real.
- La fecha del pie de página en `_includes/footer.html`.

## Cómo escribir el contenido

Es Markdown normal. Dos patrones propios de este sitio:

**Nota al margen.** Aparece a la derecha del párrafo que sigue, en tipografía
monoespaciada (en pantallas pequeñas pasa a ser un bloque con línea azul):

```
::: {.marginnote}
**Education**

LLM in Public Law, LSE
:::

Texto del párrafo que la nota acompaña.
```

**Lista de publicaciones, cursos o informes:**

```
::: {.entries}
- ::: {.meta}
  Journal article · 2025
  :::
  Apellido, F., 'Título del artículo', *Revista* 12(3), 45–67. [Link](#)
:::
```

Los otros bloques disponibles son `::: {.eyebrow}` (la etiqueta pequeña sobre el
título), `::: {.lede}` (el párrafo de entrada, más grande) y `::: {.todo}` (nota
gris de pendiente).

## Añadir una sección nueva al menú

1. Crea el archivo, por ejemplo `writing.Rmd`, copiando la cabecera YAML de otra
   página.
2. Añade el enlace en `_includes/rail.html`:
   `<a href="writing.html" data-page="writing">Writing</a>`.
3. Ejecuta `build.R`.

## Sobre el diseño

Paleta de lapislázuli —piedra nacional de Chile— con destellos de pirita para los
acentos. Tipografías Faustina (títulos), IBM Plex Sans (texto) e IBM Plex Mono
(etiquetas y notas). Las notas al margen siguen la convención de las *marginal
notes* de las leyes británicas. Todo el diseño vive en `styles.css`, ordenado por
secciones y con los colores definidos como variables al inicio del archivo.
