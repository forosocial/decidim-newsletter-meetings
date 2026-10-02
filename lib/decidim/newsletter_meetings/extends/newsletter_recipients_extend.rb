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

          recipients = super

          if @form.try(:send_to_event_registrants) && @form.try(:meeting_id).present?
            registrant_ids = Decidim::Meetings::Registration
                             .where(decidim_meeting_id: @form.meeting_id)
                             .select(:decidim_user_id)
            recipients = recipients.where(id: registrant_ids)
          end

          recipients

        end
      end
    end
  end
end
