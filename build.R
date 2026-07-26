# build.R ---------------------------------------------------------------------
# Construye el sitio: convierte los .Rmd en HTML dentro de docs/
# Uso: en RStudio abre este archivo y pulsa "Source". O en la terminal:
#   Rscript build.R

if (!requireNamespace("rmarkdown", quietly = TRUE)) {
  install.packages("rmarkdown", repos = "https://cloud.r-project.org")
}

rmarkdown::render_site(encoding = "UTF-8")

# GitHub Pages ignora las carpetas que empiezan con "_" a menos que exista
# este archivo. rmarkdown crea "site_libs", así que lo dejamos siempre.
file.create(file.path("docs", ".nojekyll"))

message("Listo. Sitio generado en docs/ — abre docs/index.html para revisarlo.")
