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
class ComputeNodeTemplates < GcpResourceBase
  name 'google_compute_node_templates'
  desc 'NodeTemplate plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:node_affinity_labels, field: :node_affinity_labels)
  filter_table_config.add(:node_types, field: :node_type)
  filter_table_config.add(:node_type_flexibilities, field: :node_type_flexibility)
  filter_table_config.add(:server_bindings, field: :server_binding)
  filter_table_config.add(:regions, field: :region)

  filter_table_config.connect(self, :table)

  def initialize(params = {})
    super(params.merge({ use_http_transport: true }))
    @params = params
    @table = fetch_wrapped_resource('items')
  end

  def fetch_wrapped_resource(wrap_path)
    # fetch_resource returns an array of responses (to handle pagination)
    result = @connection.fetch_all(product_url, resource_base_url, @params, 'Get')
    return if result.nil?

    # Conversion of string -> object hash to symbol -> object hash that InSpec needs
    converted = []
    result.each do |response|
      next if response.nil? || !response.key?(wrap_path)
      response[wrap_path].each do |hash|
        hash_with_symbols = {}
        hash.each_key do |key|
          name, value = transform(key, hash)
          hash_with_symbols[name] = value
        end
        converted.push(hash_with_symbols)
      end
    end

    converted
  end

  def transform(key, value)
    return transformers[key].call(value) if transformers.key?(key)

    [key.to_sym, value]
  end

  def transformers
    {
      'creationTimestamp' => ->(obj) { return :creation_timestamp, parse_time_string(obj['creationTimestamp']) },
      'description' => ->(obj) { return :description, obj['description'] },
      'name' => ->(obj) { return :name, obj['name'] },
      'nodeAffinityLabels' => ->(obj) { return :node_affinity_labels, obj['nodeAffinityLabels'] },
      'nodeType' => ->(obj) { return :node_type, obj['nodeType'] },
      'nodeTypeFlexibility' => ->(obj) { return :node_type_flexibility, GoogleInSpec::Compute::Property::NodeTemplateNodeTypeFlexibility.new(obj['nodeTypeFlexibility'], to_s) },
      'serverBinding' => ->(obj) { return :server_binding, GoogleInSpec::Compute::Property::NodeTemplateServerBinding.new(obj['serverBinding'], to_s) },
      'region' => ->(obj) { return :region, obj['region'] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url(beta = false)
    if beta
      'https://www.googleapis.com/compute/beta/'
    else
      'https://www.googleapis.com/compute/v1/'
    end
  end

  def resource_base_url
    'projects/{{project}}/regions/{{region}}/nodeTemplates'
  end
end
