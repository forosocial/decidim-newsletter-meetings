# frozen_string_literal: true

require "decidim/dev"
require "decidim/meetings/test/factories"

ENV["ENGINE_ROOT"] = File.dirname(__dir__)

Decidim::Dev.dummy_app_path = File.expand_path("spec/decidim_dummy_app", __dir__)
require "decidim/dev/test/base_spec_helper"
