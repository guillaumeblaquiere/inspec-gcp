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
class LoggingFolderExclusion < GcpResourceBase
  name 'google_logging_folder_exclusion'
  desc 'FolderExclusion'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :folder
  attr_reader :name
  attr_reader :description
  attr_reader :filter
  attr_reader :disabled

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url(params[:beta]), resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @folder = @fetched['folder']
    @name = @fetched['name']
    @description = @fetched['description']
    @filter = @fetched['filter']
    @disabled = @fetched['disabled']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "FolderExclusion #{@params[:name]}"
  end

  private

  def product_url(_)
    'https://logging.googleapis.com/v2/'
  end

  def resource_base_url
    'folders/{{folder}}/exclusions/{{name}}'
  end
end
