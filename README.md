# Decidim::NewsletterMeetings

Módulo para [Decidim](https://github.com/decidim/decidim) que añade una nueva
segmentación en el selector de destinatarios de boletines:
**enviar el boletín únicamente a las personas inscritas a una reunión (meeting) concreta**.

## Requisitos

- Decidim >= 0.28 (también funciona en 0.27; ver nota en `version.rb`)
- Componente `decidim-meetings` instalado

## Instalación

Añade esta línea al `Gemfile` de tu instancia:

```ruby
gem "decidim-newsletter_meetings", github: "forosocial/decidim-newsletter-meetings", branch: "main"
```

O en desarrollo local, por ruta (en carpeta -ejemplo- decidim-modules):

      ```ruby
      gem "decidim-newsletter_meetings", path: "decidim-modules/decidim-newsletter-meetings"
      ```

      Y ejecuta:

      ```bash
      bundle install
      bin/rails s
      ```

No hay migraciones ni configuración adicional: el módulo extiende el formulario,
la consulta de destinatarios y la vista del selector de boletines.

## Cómo se usa

1. Panel de administración → Boletines → crea/edita un boletín.
2. En "Seleccionar destinatarios" aparece la casilla **"Inscritos a un evento"**
3. Al marcarla aparece un desplegable con las `reuniones publicadas` de la organización.
4. Al elegir la reunión, el contador de destinatarios se recalcula
   y el enlace "Confirmar destinatarios" muestra la lista de destinatarios.
5. OJO: El envío respeta la preferencia de cada usuaria/o (solo llega a quien tiene
   activadas las notificaciones por boletín y cuenta confirmada).
6. El filtro se combina por intersección con el resto de criterios seleccionados.


## Tests

```bash
bundle exec rspec spec
```

## Licencia

AGPL-3.0-or-later (misma licencia que Decidim).
