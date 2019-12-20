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

# A provider to manage Stackdriver Logging resources.
class LoggingOrganizationLogSink < GcpResourceBase
  name 'google_logging_organization_log_sink'
  desc 'OrganizationLogSink'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :organization
  attr_reader :name
  attr_reader :filter
  attr_reader :destination
  attr_reader :writer_identity
  attr_reader :include_children

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @organization = @fetched['organization']
    @name = @fetched['name']
    @filter = @fetched['filter']
    @destination = @fetched['destination']
    @writer_identity = @fetched['writerIdentity']
    @include_children = @fetched['includeChildren']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "OrganizationLogSink #{@params[:name]}"
  end

  private

  def product_url(_ = nil)
    'https://logging.googleapis.com/v2/'
  end

  def resource_base_url
    'organizations/{{organization}}/sinks/{{name}}'
  end
end
