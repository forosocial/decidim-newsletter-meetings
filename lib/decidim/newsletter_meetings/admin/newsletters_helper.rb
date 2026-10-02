# lib/decidim/newsletter_meetings/admin/newsletters_helper.rb
# frozen_string_literal: true

module Decidim
  module NewsletterMeetings
    module Admin
      # Helper con las reuniones disponibles para segmentar el boletín.
      module NewslettersHelper
        # Reuniones publicadas de la organización actual, listas para un select.
        def meetings_for_newsletter_select
          Decidim::Meetings::FilteredMeetings.for(
              current_organization.participatory_spaces.flat_map(&:components)
            )
            .published
            .order(start_time: :desc)
        end
      end
    end
  end
end
