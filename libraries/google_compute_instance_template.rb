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
require 'google/compute/property/instancetemplate_properties'
require 'google/compute/property/instancetemplate_properties_disks'
require 'google/compute/property/instancetemplate_properties_guest_accelerators'
require 'google/compute/property/instancetemplate_properties_network_interfaces'
require 'google/compute/property/instancetemplate_properties_scheduling'
require 'google/compute/property/instancetemplate_properties_service_accounts'
require 'google/compute/property/instancetemplate_properties_tags'

# A provider to manage Compute Engine resources.
class ComputeInstanceTemplate < GcpResourceBase
  name 'google_compute_instance_template'
  desc 'InstanceTemplate'
  supports platform: 'gcp'

  attr_reader :params
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :id
  attr_reader :name
  attr_reader :properties

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @params = params
    @fetched = @connection.fetch(product_url, resource_base_url, params, 'Get')
    parse unless @fetched.nil?
  end

  def parse
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @id = @fetched['id']
    @name = @fetched['name']
    @properties = GoogleInSpec::Compute::Property::InstanceTemplateProperties.new(@fetched['properties'], to_s)
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  def to_s
    "InstanceTemplate #{@params[:name]}"
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/global/instanceTemplates/{{name}}'
  end
end
