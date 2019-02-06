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
require 'google/bigquery/property/dataset_view'
module GoogleInSpec
  module BigQuery
    module Property
      class DatasetAccess
        attr_reader :domain

        attr_reader :group_by_email

        attr_reader :role

        attr_reader :special_group

        attr_reader :user_by_email

        attr_reader :view

        def initialize(args = nil)
          return if args.nil?
          @domain = args['domain']
          @group_by_email = args['groupByEmail']
          @role = args['role']
          @special_group = args['specialGroup']
          @user_by_email = args['userByEmail']
          @view = GoogleInSpec::BigQuery::Property::DatasetView.new(args['view'])
        end
      end

      class DatasetAccessArray
        def self.parse(value)
          return if value.nil?
          return DatasetAccess.new(value) unless value.is_a?(::Array)
          value.map { |v| DatasetAccess.new(v) }
        end
      end
    end
  end
end
