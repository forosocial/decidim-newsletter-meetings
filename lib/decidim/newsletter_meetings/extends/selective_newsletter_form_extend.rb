# lib/decidim/newsletter_meetings/extends/selective_newsletter_form_extend.rb
# frozen_string_literal: true

module Decidim
  module NewsletterMeetings
    module Extends
      module SelectiveNewsletterFormExtend

        def self.prepended(base)
          base.class_eval do
            Rails.logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
            Rails.logger.info "=== SelectiveNewsletterForm prepended, attributes should be available ==="
            Rails.logger.info "$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"
            # Usar símbolos evita el problema de resolución de constantes
            attribute :send_to_event_registrants, :boolean
            attribute :meeting_id, :integer

            validates :meeting_id, presence: true, if: :only_event_registrants_selected?
          end
        end
        
        def at_least_one_participatory_space_selected
          return if meeting_id.present?
          super
        end

        def other_groups_selected_for_all_users?
          super || send_to_event_registrants.present?
        end

        def other_groups_selected_for_verified_users?
          super || send_to_event_registrants.present?
        end

        private

        def only_event_registrants_selected?
          send_to_all_users.blank? &&
          send_to_verified_users.blank? &&
          send_to_participants.blank? &&
          send_to_followers.blank? &&
          send_to_event_registrants.present?
        end
      end
    end
  end
end