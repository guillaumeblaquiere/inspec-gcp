# frozen_string_literal: false

# ----------------------------------------------------------------------------
#
#     ***     AUTO GENERATED CODE    ***    AUTO GENERATED CODE     ***
#
# ----------------------------------------------------------------------------
#
#     This file is automatically generated by Magic Modules and manual
#     changes will be clobbered when the file is regenerated.
#
#     Please read more about how to change this file in README.md and
#     CONTRIBUTING.md located at the root of this package.
#
# ----------------------------------------------------------------------------
module GoogleInSpec
  module Compute
    module Property
      class RegionInstanceGroupManagerAutoHealingPolicies
        attr_reader :health_check

        attr_reader :initial_delay_sec

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @health_check = args['healthCheck']
          @initial_delay_sec = args['initialDelaySec']
        end

        def to_s
          "#{@parent_identifier} RegionInstanceGroupManagerAutoHealingPolicies"
        end
      end

      class RegionInstanceGroupManagerAutoHealingPoliciesArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return RegionInstanceGroupManagerAutoHealingPolicies.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| RegionInstanceGroupManagerAutoHealingPolicies.new(v, parent_identifier) }
        end
      end
    end
  end
end
