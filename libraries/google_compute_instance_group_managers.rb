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
class ComputeInstanceGroupManagers < GcpResourceBase
  name 'google_compute_instance_group_managers'
  desc 'InstanceGroupManager plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:base_instance_names, field: :base_instance_name)
  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:current_actions, field: :current_actions)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:instance_groups, field: :instance_group)
  filter_table_config.add(:instance_templates, field: :instance_template)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:named_ports, field: :named_ports)
  filter_table_config.add(:regions, field: :region)
  filter_table_config.add(:target_pools, field: :target_pools)
  filter_table_config.add(:target_sizes, field: :target_size)
  filter_table_config.add(:zones, field: :zone)

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
      'baseInstanceName' => ->(obj) { return :base_instance_name, obj['baseInstanceName'] },
      'creationTimestamp' => ->(obj) { return :creation_timestamp, parse_time_string(obj['creationTimestamp']) },
      'currentActions' => ->(obj) { return :current_actions, GoogleInSpec::Compute::Property::InstanceGroupManagerCurrentActions.new(obj['currentActions'], to_s) },
      'description' => ->(obj) { return :description, obj['description'] },
      'id' => ->(obj) { return :id, obj['id'] },
      'instanceGroup' => ->(obj) { return :instance_group, obj['instanceGroup'] },
      'instanceTemplate' => ->(obj) { return :instance_template, obj['instanceTemplate'] },
      'name' => ->(obj) { return :name, obj['name'] },
      'namedPorts' => ->(obj) { return :named_ports, GoogleInSpec::Compute::Property::InstanceGroupManagerNamedPortsArray.parse(obj['namedPorts'], to_s) },
      'region' => ->(obj) { return :region, obj['region'] },
      'targetPools' => ->(obj) { return :target_pools, obj['targetPools'] },
      'targetSize' => ->(obj) { return :target_size, obj['targetSize'] },
      'zone' => ->(obj) { return :zone, obj['zone'] },
    }
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/zones/{{zone}}/instanceGroupManagers'
  end
end
