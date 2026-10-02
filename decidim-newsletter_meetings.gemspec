# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)
require "decidim/newsletter_meetings/version"

Gem::Specification.new do |s|
  s.version = Decidim::NewsletterMeetings::VERSION
  s.authors = ["Tu organización"]
  s.email = ["hola@tuorganizacion.org"]
  s.license = "AGPL-3.0-or-later"
  s.homepage = "https://github.com/tu-organizacion/decidim-module-newsletter_meetings"
  s.required_ruby_version = ">= 3.1"

  s.name = "decidim-newsletter_meetings"
  s.summary = "Segmentación de boletines por inscritos a reuniones en Decidim"
  s.description = "Añade al selector de destinatarios de boletines de Decidim " \
                  "la opción de enviar únicamente a las personas inscritas a una reunión (meeting) concreta."

  s.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  s.require_paths = ["lib"]

  s.add_dependency "decidim-admin", Decidim::NewsletterMeetings::DECIDIM_VERSION
  s.add_dependency "decidim-meetings", Decidim::NewsletterMeetings::DECIDIM_VERSION

  s.add_development_dependency "decidim-dev", Decidim::NewsletterMeetings::DECIDIM_VERSION
end
