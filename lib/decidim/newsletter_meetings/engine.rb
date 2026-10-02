# lib/decidim/newsletter_meetings/engine.rb
# frozen_string_literal: true

require "rails/engine"
require "decidim/newsletter_meetings/extends/selective_newsletter_form_extend"
require "decidim/newsletter_meetings/extends/newsletter_recipients_extend"
require "decidim/newsletter_meetings/extends/newsletters_controller_extend"

module Decidim
  module NewsletterMeetings
    class Engine < ::Rails::Engine
      isolate_namespace Decidim::NewsletterMeetings

      initializer "decidim_newsletter_meetings.view_helpers" do
        ActiveSupport.on_load(:action_view) do
          include Decidim::NewsletterMeetings::Admin::NewslettersHelper
        end
      end

      # Usar to_prepare, ejecutado en cada recarga
      config.to_prepare do
        # No uses require ni require_dependency, haz el prepend directamente
        Decidim::Admin::SelectiveNewsletterForm.prepend(
          Decidim::NewsletterMeetings::Extends::SelectiveNewsletterFormExtend
        )
        Decidim::Admin::NewsletterRecipients.prepend(
          Decidim::NewsletterMeetings::Extends::NewsletterRecipientsExtend
        )
        Decidim::Admin::NewslettersController.prepend(
          Decidim::NewsletterMeetings::Extends::NewslettersControllerExtend
        )
        Rails.logger.info "===****************************************************==="
        Rails.logger.info "=== Extensiones del módulo NewsletterMeetings cargadas ==="
        Rails.logger.info "===****************************************************==="
      end
    end
  end
end