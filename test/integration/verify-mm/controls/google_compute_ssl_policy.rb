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

require_relative '../vcr_config'

title 'Test GCP google_compute_ssl_policy resource.'

project_name = attribute('project_name', default: 'graphite-test-sam-chef')
ssl_policy = attribute('ssl_policy', default: {"name"=>"inspec-gcp-ssl-policy", "min_tls_version"=>"TLS_1_2", "profile"=>"CUSTOM", "custom_feature"=>"TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384", "custom_feature2"=>"TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384"})
control 'google_compute_ssl_policy-1.0' do
  impact 1.0
  title 'google_compute_ssl_policy resource test'

  VCR.use_cassette('google_compute_ssl_policy') do
    describe google_compute_ssl_policy({project: project_name, name: ssl_policy['name']}) do
      it { should exist }
      its('min_tls_version') { should cmp ssl_policy['min_tls_version'] }
      its('profile') { should cmp ssl_policy['profile'] }
      its('custom_features') { should include ssl_policy['custom_feature'] }
      its('custom_features') { should include ssl_policy['custom_feature2'] }
    end
  end
end
