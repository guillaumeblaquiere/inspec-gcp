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
      class RegionInstanceGroupManagerCurrentActions
        attr_reader :abandoning

        attr_reader :creating

        attr_reader :creating_without_retries

        attr_reader :deleting

        attr_reader :none

        attr_reader :recreating

        attr_reader :refreshing

        attr_reader :restarting

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @abandoning = args['abandoning']
          @creating = args['creating']
          @creating_without_retries = args['creatingWithoutRetries']
          @deleting = args['deleting']
          @none = args['none']
          @recreating = args['recreating']
          @refreshing = args['refreshing']
          @restarting = args['restarting']
        end

        def to_s
          "#{@parent_identifier} RegionInstanceGroupManagerCurrentActions"
        end
      end
    end
  end
end
