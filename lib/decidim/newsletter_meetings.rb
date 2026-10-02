# frozen_string_literal: true

require "decidim/newsletter_meetings/version"

module Decidim
  # Módulo que añade segmentación por inscritos a reuniones en los boletines.
  module NewsletterMeetings
    autoload :Admin, "decidim/newsletter_meetings/admin"
  end
end

require "decidim/newsletter_meetings/engine"
