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

# A provider to manage Cloud Pub/Sub resources.
class Topic < GcpResourceBase
  name 'google_pubsub_topic'
  desc 'Topic'
  supports platform: 'gcp'

  attr_reader :name
  def base
    'https://pubsub.googleapis.com/v1/'
  end

  def url
    'projects/{{project}}/topics/{{name}}'
  end

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @fetched = @connection.fetch(base, url, params)
    parse unless @fetched.nil?
  end

  def parse
    @name = name_from_self_link(@fetched['name'])
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end
end
