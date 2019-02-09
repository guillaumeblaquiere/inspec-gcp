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
class TargetHttpProxy < GcpResourceBase
  name 'google_compute_target_http_proxy'
  desc 'TargetHttpProxy'
  supports platform: 'gcp'

  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :id
  attr_reader :name
  attr_reader :url_map
  def base
    'https://www.googleapis.com/compute/v1/'
  end

  def url
    'projects/{{project}}/global/targetHttpProxies/{{name}}'
  end

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @fetched = @connection.fetch(base, url, params)
    parse unless @fetched.nil?
  end

  def parse
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @id = @fetched['id']
    @name = @fetched['name']
    @url_map = @fetched['urlMap']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end
end
