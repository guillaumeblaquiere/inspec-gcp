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

title 'Test GCP google_spanner_instances resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
spannerinstance = attribute('spannerinstance', default: {
  "config": "regional-us-east1",
  "name": "inspec_inst",
  "display_name": "inspectest",
  "node_count": 2,
  "label_key": "env",
  "label_value": "test"
}, description: 'Cloud Spanner definition') 

control 'google_spanner_instances-1.0' do
  impact 1.0
  title 'google_spanner_instances resource test'


  describe google_spanner_instances(project: gcp_project_id, config: spannerinstance['config']) do
    its('config') { should eq spannerinstance['config'] }
  end
end
