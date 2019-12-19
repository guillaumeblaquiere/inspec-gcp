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
class ComputeGlobalForwardingRules < GcpResourceBase
  name 'google_compute_global_forwarding_rules'
  desc 'GlobalForwardingRule plural resource'
  supports platform: 'gcp'

  attr_reader :table

  filter_table_config = FilterTable.create

  filter_table_config.add(:creation_timestamps, field: :creation_timestamp)
  filter_table_config.add(:descriptions, field: :description)
  filter_table_config.add(:ids, field: :id)
  filter_table_config.add(:ip_addresses, field: :ip_address)
  filter_table_config.add(:ip_protocols, field: :ip_protocol)
  filter_table_config.add(:ip_versions, field: :ip_version)
  filter_table_config.add(:labels, field: :labels)
  filter_table_config.add(:label_fingerprints, field: :label_fingerprint)
  filter_table_config.add(:load_balancing_schemes, field: :load_balancing_scheme)
  filter_table_config.add(:metadata_filters, field: :metadata_filters)
  filter_table_config.add(:names, field: :name)
  filter_table_config.add(:networks, field: :network)
  filter_table_config.add(:port_ranges, field: :port_range)
  filter_table_config.add(:targets, field: :target)

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
      'id' => ->(obj) { return :id, obj['id'] },
      'IPAddress' => ->(obj) { return :ip_address, obj['IPAddress'] },
      'IPProtocol' => ->(obj) { return :ip_protocol, obj['IPProtocol'] },
      'ipVersion' => ->(obj) { return :ip_version, obj['ipVersion'] },
      'labels' => ->(obj) { return :labels, obj['labels'] },
      'labelFingerprint' => ->(obj) { return :label_fingerprint, obj['labelFingerprint'] },
      'loadBalancingScheme' => ->(obj) { return :load_balancing_scheme, obj['loadBalancingScheme'] },
      'metadataFilters' => ->(obj) { return :metadata_filters, GoogleInSpec::Compute::Property::GlobalForwardingRuleMetadataFiltersArray.parse(obj['metadataFilters'], to_s) },
      'name' => ->(obj) { return :name, obj['name'] },
      'network' => ->(obj) { return :network, obj['network'] },
      'portRange' => ->(obj) { return :port_range, obj['portRange'] },
      'target' => ->(obj) { return :target, obj['target'] },
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
    'projects/{{project}}/global/forwardingRules'
  end
end
