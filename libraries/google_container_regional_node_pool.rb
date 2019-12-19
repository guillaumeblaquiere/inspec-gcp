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
require 'google/container/property/regionalnodepool_autoscaling'
require 'google/container/property/regionalnodepool_conditions'
require 'google/container/property/regionalnodepool_config'
require 'google/container/property/regionalnodepool_config_accelerators'
require 'google/container/property/regionalnodepool_config_taints'
require 'google/container/property/regionalnodepool_management'
require 'google/container/property/regionalnodepool_management_upgrade_options'
require 'google/container/property/regionalnodepool_max_pods_constraint'

# A provider to manage Google Kubernetes Engine resources.
class ContainerRegionalNodePool < GcpResourceBase
  name 'google_container_regional_node_pool'
  desc 'RegionalNodePool'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :name
  attr_reader :config
  attr_reader :initial_node_count
  attr_reader :status
  attr_reader :status_message
  attr_reader :version
  attr_reader :autoscaling
  attr_reader :management
  attr_reader :max_pods_constraint
  attr_reader :conditions
  attr_reader :pod_ipv4_cidr_size
  attr_reader :cluster
  attr_reader :location

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @name = @fetched['name']
    @config = GoogleInSpec::Container::Property::RegionalNodePoolConfig.new(@fetched['config'], to_s)
    @initial_node_count = @fetched['initialNodeCount']
    @status = @fetched['status']
    @status_message = @fetched['statusMessage']
    @version = @fetched['version']
    @autoscaling = GoogleInSpec::Container::Property::RegionalNodePoolAutoscaling.new(@fetched['autoscaling'], to_s)
    @management = GoogleInSpec::Container::Property::RegionalNodePoolManagement.new(@fetched['management'], to_s)
    @max_pods_constraint = GoogleInSpec::Container::Property::RegionalNodePoolMaxPodsConstraint.new(@fetched['maxPodsConstraint'], to_s)
    @conditions = GoogleInSpec::Container::Property::RegionalNodePoolConditionsArray.parse(@fetched['conditions'], to_s)
    @pod_ipv4_cidr_size = @fetched['podIpv4CidrSize']
    @cluster = @fetched['cluster']
    @location = @fetched['location']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "RegionalNodePool #{@params[:name]}"
  end

  private

  def product_url(beta = false)
    if beta
      'https://container.googleapis.com/v1beta1/'
    else
      'https://container.googleapis.com/v1/'
    end
  end

  def resource_base_url
    'projects/{{project}}/locations/{{location}}/clusters/{{cluster}}/nodePools/{{name}}'
  end
end
