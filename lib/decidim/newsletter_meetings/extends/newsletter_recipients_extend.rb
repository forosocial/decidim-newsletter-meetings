# lib/decidim/newsletter_meetings/extends/newsletter_recipients_extend.rb
# frozen_string_literal: true

module Decidim
  module NewsletterMeetings
    module Extends
      # Restringe el conjunto de destinatarios a las personas inscritas a la
      # reunión elegida. Se aplica DESPUÉS del cálculo nativo, por lo que se
      # combina por intersección con cualquier otro criterio marcado.
      module NewsletterRecipientsExtend
        def query
          Rails.logger.info "========================================================"
          Rails.logger.info "=== NewsletterRecipientsExtend#query se ejecutó ==="
          Rails.logger.info "send_to_event_registrants: #{@form.try(:send_to_event_registrants)}"
          Rails.logger.info "meeting_id: #{@form.try(:meeting_id)}"
          Rails.logger.info "@form: #{@form}"
          Rails.logger.info "========================================================"

          recipients = super

          if @form.try(:send_to_event_registrants) && @form.try(:meeting_id).present?
            registrant_ids = Decidim::Meetings::Registration
                             .where(decidim_meeting_id: @form.meeting_id)
                             .select(:decidim_user_id)
            recipients = recipients.where(id: registrant_ids)
          end
          Rails.logger.info "send_to_event_registrants: #{@form.send_to_event_registrants.inspect}"
          Rails.logger.info "meeting_id: #{@form.meeting_id.inspect}"
          Rails.logger.info "USUARIOS REGISTRADOS SON: #{registrant_ids}"
          Rails.logger.info "RECIPIENTES: #{recipients}"
          Rails.logger.info "========================================================"

          recipients

        end
      end
    end
  end
end
