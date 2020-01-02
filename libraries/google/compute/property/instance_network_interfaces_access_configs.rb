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
      class InstanceNetworkInterfacesAccessConfigs
        attr_reader :name

        attr_reader :nat_ip

        attr_reader :type

        attr_reader :set_public_ptr

        attr_reader :public_ptr_domain_name

        attr_reader :network_tier

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @name = args['name']
          @nat_ip = args['natIP']
          @type = args['type']
          @set_public_ptr = args['setPublicPtr']
          @public_ptr_domain_name = args['publicPtrDomainName']
          @network_tier = args['networkTier']
        end

        def to_s
          "#{@parent_identifier} InstanceNetworkInterfacesAccessConfigs"
        end
      end

      class InstanceNetworkInterfacesAccessConfigsArray
        def self.parse(value, parent_identifier)
          return if value.nil?
          return InstanceNetworkInterfacesAccessConfigs.new(value, parent_identifier) unless value.is_a?(::Array)
          value.map { |v| InstanceNetworkInterfacesAccessConfigs.new(v, parent_identifier) }
        end
      end
    end
  end
end
