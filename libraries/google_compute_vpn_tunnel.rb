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
class ComputeVpnTunnel < GcpResourceBase
  name 'google_compute_vpn_tunnel'
  desc 'VpnTunnel'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :id
  attr_reader :creation_timestamp
  attr_reader :name
  attr_reader :description
  attr_reader :target_vpn_gateway
  attr_reader :router
  attr_reader :peer_ip
  attr_reader :shared_secret
  attr_reader :shared_secret_hash
  attr_reader :ike_version
  attr_reader :local_traffic_selector
  attr_reader :remote_traffic_selector
  attr_reader :region

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @id = @fetched['id']
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @name = @fetched['name']
    @description = @fetched['description']
    @target_vpn_gateway = @fetched['targetVpnGateway']
    @router = @fetched['router']
    @peer_ip = @fetched['peerIp']
    @shared_secret = @fetched['sharedSecret']
    @shared_secret_hash = @fetched['sharedSecretHash']
    @ike_version = @fetched['ikeVersion']
    @local_traffic_selector = @fetched['localTrafficSelector']
    @remote_traffic_selector = @fetched['remoteTrafficSelector']
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
    "VpnTunnel #{@params[:name]}"
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/regions/{{region}}/vpnTunnels/{{name}}'
  end
end
