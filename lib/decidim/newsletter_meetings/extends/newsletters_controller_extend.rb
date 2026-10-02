# lib/decidim/newsletter_meetings/extends/newsletters_controller_extend.rb
# frozen_string_literal: true

module Decidim
  module NewsletterMeetings
    module Extends
      # Permite los nuevos parámetros del selector de destinatarios.
      module NewslettersControllerExtend
        extend ActiveSupport::Concern

        private

        def newsletter_params
          extra = params.fetch(:newsletter, {})
                        .permit(:send_to_event_registrants, :meeting_id)

          super.merge(extra)
        end
      end
    end
  end
end