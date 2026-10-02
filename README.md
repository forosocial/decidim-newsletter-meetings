# Decidim::NewsletterMeetings

Módulo para [Decidim](https://github.com/decidim/decidim) que añade una nueva
segmentación en el selector de destinatarios de boletines:
**enviar el boletín únicamente a las personas inscritas a una reunión (meeting) concreta**.

## Requisitos

- Decidim >= 0.28 (también funciona en 0.27; ver nota en `version.rb`)
- Componente `decidim-meetings` instalado

## Estructura de la gema

decidim-newsletter_meetings/  
├── decidim-newsletter_meetings.gemspec  
├── Gemfile  
├── Rakefile  
├── README.md  
├── .gitignore  
├── app/overrides/decidim/admin/newsletters/select_recipients_to_deliver/  
│ &nbsp; &nbsp; &nbsp;   ├── add_meeting_recipients_checkbox.html.erb.deface  
│ &nbsp; &nbsp; &nbsp;   └── add_meeting_selector.html.erb.deface  
├── config/  
│ &nbsp; &nbsp; &nbsp;   ├── locales/{en.yml, es.yml}  
│ &nbsp; &nbsp; &nbsp;   └── routes.rb  
├── lib/  
│ &nbsp; &nbsp; &nbsp;   ├── decidim-newsletter_meetings.rb  
│ &nbsp; &nbsp; &nbsp;   └── decidim/newsletter_meetings/  
│  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;      ├── version.rb  
│  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;      ├── engine.rb  
│  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;      ├── admin.rb  
│  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;       ├── admin/newsletters_helper.rb  
│  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;       └── extends/  
│  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;          ├── selective_newsletter_form_extend.rb  
│  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;          ├── newsletter_recipients_extend.rb  
│  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;          └── newsletters_controller_extend.rb  
└── spec/  
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;    ├── spec_helper.rb  
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;    └── queries/newsletter_recipients_spec.rb  

## Instalación

Añade esta línea al `Gemfile` de tu instancia:

```ruby
gem "decidim-newsletter_meetings", github: "forosocial/decidim-newsletter-meetings", branch: "main"
```

O en desarrollo local, por ruta (en carpeta decidim-modules):

```ruby
gem "decidim-newsletter_meetings", path: "decidim-modules/decidim-newsletter-meetings"
```

Y ejecuta:

```bash
bundle install
bin/rails s
```

No hay migraciones ni configuración adicional: el módulo extiende el formulario,
el query de destinatarios y la vista del selector de boletines.

## Cómo se usa

1. Panel de administración → Boletines → crea/edita un boletín.
2. En "Seleccionar destinatarios" aparece la casilla **"Inscritos a un evento"**
   y un desplegable con las reuniones publicadas de la organización.
3. Al marcarla y elegir la reunión, el contador de destinatarios se recalcula
   por AJAX y el enlace "Confirmar destinatarios" muestra la lista exacta.
4. El envío respeta la preferencia de cada usuaria/o (solo llega a quien tiene
   activadas las notificaciones por boletín y cuenta confirmada).

El filtro se combina por intersección con el resto de criterios seleccionados.

## Pruebas en desarrollo sin enviar correos reales

Ver la sección "Metodología de pruebas" del PR / documentación del proyecto:
se recomienda `letter_opener` o `Mailpit` (SMTP local) en
`config/environments/development.rb`.

## Tests

```bash
bundle exec rspec spec
```

## Licencia

AGPL-3.0-or-later (misma licencia que Decidim).
