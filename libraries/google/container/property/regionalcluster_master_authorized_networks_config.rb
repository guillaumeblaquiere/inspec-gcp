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
require 'google/container/property/regionalcluster_master_authorized_networks_config_cidr_blocks'
module GoogleInSpec
  module Container
    module Property
      class RegionalClusterMasterAuthorizedNetworksConfig
        attr_reader :enabled

        attr_reader :cidr_blocks

        def initialize(args = nil, parent_identifier = nil)
          return if args.nil?
          @parent_identifier = parent_identifier
          @enabled = args['enabled']
          @cidr_blocks = GoogleInSpec::Container::Property::RegionalClusterMasterAuthorizedNetworksConfigCidrBlocksArray.parse(args['cidrBlocks'], to_s)
        end

        def to_s
          "#{@parent_identifier} RegionalClusterMasterAuthorizedNetworksConfig"
        end
      end
    end
  end
end
