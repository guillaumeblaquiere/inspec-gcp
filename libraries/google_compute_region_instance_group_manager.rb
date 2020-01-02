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
require 'gcp_backend'
require 'google/compute/property/regioninstancegroupmanager_auto_healing_policies'
require 'google/compute/property/regioninstancegroupmanager_current_actions'
require 'google/compute/property/regioninstancegroupmanager_named_ports'

# A provider to manage Compute Engine resources.
class ComputeRegionInstanceGroupManager < GcpResourceBase
  name 'google_compute_region_instance_group_manager'
  desc 'RegionInstanceGroupManager'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :base_instance_name
  attr_reader :creation_timestamp
  attr_reader :current_actions
  attr_reader :description
  attr_reader :id
  attr_reader :instance_group
  attr_reader :instance_template
  attr_reader :name
  attr_reader :named_ports
  attr_reader :target_pools
  attr_reader :target_size
  attr_reader :auto_healing_policies
  attr_reader :region

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @base_instance_name = @fetched['baseInstanceName']
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @current_actions = GoogleInSpec::Compute::Property::RegionInstanceGroupManagerCurrentActions.new(@fetched['currentActions'], to_s)
    @description = @fetched['description']
    @id = @fetched['id']
    @instance_group = @fetched['instanceGroup']
    @instance_template = @fetched['instanceTemplate']
    @name = @fetched['name']
    @named_ports = GoogleInSpec::Compute::Property::RegionInstanceGroupManagerNamedPortsArray.parse(@fetched['namedPorts'], to_s)
    @target_pools = @fetched['targetPools']
    @target_size = @fetched['targetSize']
    @auto_healing_policies = GoogleInSpec::Compute::Property::RegionInstanceGroupManagerAutoHealingPoliciesArray.parse(@fetched['autoHealingPolicies'], to_s)
    @region = @fetched['region']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "RegionInstanceGroupManager #{@params[:name]}"
  end

  def port_name
    find_named_ports(:name)
  end
  RSpec::Matchers.alias_matcher :has_port_name, :be_allow_port_name

  def port_value
    find_named_ports(:port)
  end
  RSpec::Matchers.alias_matcher :has_port_value, :be_allow_port_value

  def find_named_ports(key = :name)
    # check all name/port values for a match
    return false if !defined?(@named_ports) || @named_ports.nil?
    @named_ports.each do |named_port|
      next if !defined?(named_port.item[key]) || named_port.item[key].nil?
      return named_port.item[key]
    end
    false
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/regions/{{region}}/instanceGroupManagers/{{name}}'
  end
end
