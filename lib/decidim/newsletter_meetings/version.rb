# frozen_string_literal: true

module Decidim
  module NewsletterMeetings
    VERSION = "0.1.0"
    # Nota: en Decidim 0.27 e inferiores NewsletterRecipients heredaba de
    # Rectify::Query en lugar de Decidim::Query; las extensiones son compatibles.
    DECIDIM_VERSION = [">= 0.27", "< 0.32"].freeze
  end
end
