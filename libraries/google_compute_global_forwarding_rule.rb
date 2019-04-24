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

# A provider to manage Compute Engine resources.
class GlobalForwardingRule < GcpResourceBase
  name 'google_compute_global_forwarding_rule'
  desc 'GlobalForwardingRule'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :id
  attr_reader :ip_address
  attr_reader :ip_protocol
  attr_reader :ip_version
  attr_reader :load_balancing_scheme
  attr_reader :name
  attr_reader :network
  attr_reader :port_range
  attr_reader :target

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params)
    parse unless @fetched.nil?
  end

  def parse
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @id = @fetched['id']
    @ip_address = @fetched['IPAddress']
    @ip_protocol = @fetched['IPProtocol']
    @ip_version = @fetched['ipVersion']
    @load_balancing_scheme = @fetched['loadBalancingScheme']
    @name = @fetched['name']
    @network = @fetched['network']
    @port_range = @fetched['portRange']
    @target = @fetched['target']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "GlobalForwardingRule #{@params[:name]}"
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/forwardingRules/{{name}}'
  end
end
