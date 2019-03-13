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
require 'google/compute/property/disk_disk_encryption_key'
require 'google/compute/property/disk_source_image_encryption_key'
require 'google/compute/property/disk_source_snapshot_encryption_key'

# A provider to manage Compute Engine resources.
class Disk < GcpResourceBase
  name 'google_compute_disk'
  desc 'Disk'
  supports platform: 'gcp'

  attr_reader :label_fingerprint
  attr_reader :creation_timestamp
  attr_reader :description
  attr_reader :id
  attr_reader :last_attach_timestamp
  attr_reader :last_detach_timestamp
  attr_reader :labels
  attr_reader :licenses
  attr_reader :name
  attr_reader :size_gb
  attr_reader :users
  attr_reader :physical_block_size_bytes
  attr_reader :type
  attr_reader :source_image
  attr_reader :zone
  attr_reader :source_image_encryption_key
  attr_reader :source_image_id
  attr_reader :disk_encryption_key
  attr_reader :source_snapshot
  attr_reader :source_snapshot_encryption_key
  attr_reader :source_snapshot_id

  def initialize(params)
    super(params.merge({ use_http_transport: true }))
    @fetched = @connection.fetch(product_url, resource_base_url, params)
    parse unless @fetched.nil?
  end

  def parse
    @label_fingerprint = @fetched['labelFingerprint']
    @creation_timestamp = parse_time_string(@fetched['creationTimestamp'])
    @description = @fetched['description']
    @id = @fetched['id']
    @last_attach_timestamp = parse_time_string(@fetched['lastAttachTimestamp'])
    @last_detach_timestamp = parse_time_string(@fetched['lastDetachTimestamp'])
    @labels = @fetched['labels']
    @licenses = @fetched['licenses']
    @name = @fetched['name']
    @size_gb = @fetched['sizeGb']
    @users = @fetched['users']
    @physical_block_size_bytes = @fetched['physicalBlockSizeBytes']
    @type = @fetched['type']
    @source_image = @fetched['sourceImage']
    @zone = @fetched['zone']
    @source_image_encryption_key = GoogleInSpec::Compute::Property::DiskSourceImageEncryptionKey.new(@fetched['sourceImageEncryptionKey'])
    @source_image_id = @fetched['sourceImageId']
    @disk_encryption_key = GoogleInSpec::Compute::Property::DiskDiskEncryptionKey.new(@fetched['diskEncryptionKey'])
    @source_snapshot = @fetched['sourceSnapshot']
    @source_snapshot_encryption_key = GoogleInSpec::Compute::Property::DiskSourceSnapshotEncryptionKey.new(@fetched['sourceSnapshotEncryptionKey'])
    @source_snapshot_id = @fetched['sourceSnapshotId']
  end

  # Handles parsing RFC3339 time string
  def parse_time_string(time_string)
    time_string ? Time.parse(time_string) : nil
  end

  def exists?
    !@fetched.nil?
  end

  private

  def product_url
    'https://www.googleapis.com/compute/v1/'
  end

  def resource_base_url
    'projects/{{project}}/zones/{{zone}}/disks/{{name}}'
  end
end
