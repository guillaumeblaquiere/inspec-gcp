# Copyright 2018 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
require 'google/compute/property/zone_deprecated'


# A provider to manage Google Compute Engine resources.
class Zone < GcpResourceBase

  name 'google_compute_zone'
  desc 'Zone'
  supports platform: 'gcp'

  attr_reader :creation_timestamp
  attr_reader :deprecated
  attr_reader :description
  attr_reader :id
  attr_reader :name
  attr_reader :region
  attr_reader :status
  def base
    'https://www.googleapis.com/compute/v1/'
  end

  def url
    'projects/{{project}}/zones/{{name}}'
  end

  def initialize(params)
    super(params.merge({:use_http_transport => true}))
    @fetched = @connection.fetch(base, url, params)
    parse unless @fetched.nil?
  end

  def parse
    @creation_timestamp = DateTime.parse(@fetched['creationTimestamp'])
    @deprecated = Google::Compute::Property::ZoneDeprecated.new(@fetched['deprecated'])
    @description = @fetched['description']
    @id = @fetched['id']
    @name = @fetched['name']
    @region = @fetched['region']
    @status = @fetched['status']
  end

  def exists?
    !@fetched.nil?
  end
end
