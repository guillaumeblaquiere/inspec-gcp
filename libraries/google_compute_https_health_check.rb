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
class HttpsHealthCheck < GcpResourceBase
  name 'google_compute_https_health_check'
  desc 'HttpsHealthCheck'
  supports platform: 'gcp'

  attr_reader :check_interval_sec
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :healthy_threshold
  attr_reader :host
  attr_reader :id
  attr_reader :name
  attr_reader :port
  attr_reader :request_path
  attr_reader :timeout_sec
  attr_reader :unhealthy_threshold
  def base
    'https://www.googleapis.com/compute/v1/'
  end

  def url
    'projects/{{project}}/global/httpsHealthChecks/{{name}}'
  end

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @fetched = @connection.fetch(base, url, params)
    parse unless @fetched.nil?
  end

  def parse
    @check_interval_sec = @fetched['checkIntervalSec']
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @healthy_threshold = @fetched['healthyThreshold']
    @host = @fetched['host']
    @id = @fetched['id']
    @name = @fetched['name']
    @port = @fetched['port']
    @request_path = @fetched['requestPath']
    @timeout_sec = @fetched['timeoutSec']
    @unhealthy_threshold = @fetched['unhealthyThreshold']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end
end
