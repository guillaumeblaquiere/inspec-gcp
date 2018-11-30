

---
title: About the SslPolicy resource
platform: gcp
---


## Syntax
A `google_compute_ssl_policies` is used to test a Google SslPolicy resource

## Examples
```
resource = google_compute_ssl_policies({project: 'graphite-test-sam-chef'})
describe resource do
  it { should exist }
  its('names') { should include 'inspec-gcp-ssl-policy' }
  its('profiles') { should include 'CUSTOM' }
  its('count') { should eq 1 }
end

resource.names.each do |policy_name|
  describe google_compute_ssl_policy({project: 'graphite-test-sam-chef', name: policy_name}) do
    its('min_tls_version') { should cmp 'TLS_1_2' }
  end
end
```

## Properties
Properties that can be accessed from the `google_compute_ssl_policies` resource:

See [google_compute_ssl_policy.md](google_compute_ssl_policy.md) for more detailed information
  * `creation_timestamps`: an array of `google_compute_ssl_policy` creation_timestamp
  * `descriptions`: an array of `google_compute_ssl_policy` description
  * `ids`: an array of `google_compute_ssl_policy` id
  * `names`: an array of `google_compute_ssl_policy` name
  * `profiles`: an array of `google_compute_ssl_policy` profile
  * `min_tls_versions`: an array of `google_compute_ssl_policy` min_tls_version
  * `enabled_features`: an array of `google_compute_ssl_policy` enabled_features
  * `custom_features`: an array of `google_compute_ssl_policy` custom_features
  * `fingerprints`: an array of `google_compute_ssl_policy` fingerprint
  * `warnings`: an array of `google_compute_ssl_policy` warnings

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
