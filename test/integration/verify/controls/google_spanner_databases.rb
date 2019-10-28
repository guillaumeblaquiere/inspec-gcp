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

title 'Test GCP google_spanner_databases resource.'

gcp_project_id = attribute(:gcp_project_id, default: 'gcp_project_id', description: 'The GCP project identifier.')
spannerdatabase = attribute('spannerdatabase', default: {
  "name": "spdatabase",
  "instance": "spinstance",
  "ddl": "CREATE TABLE test (test STRING(MAX),) PRIMARY KEY (test)"
}, description: 'Cloud Spanner definition') 

control 'google_spanner_databases-1.0' do
  impact 1.0
  title 'google_spanner_databases resource test'


  describe google_spanner_databases(project: gcp_project_id, instance: spannerdatabase['instance']) do
    its('name') { should include spannerdatabase['name'] }
  end
end
