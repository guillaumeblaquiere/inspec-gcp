---
title: About the google_resourcemanager_project_iam_policy resource
platform: gcp
---

## Syntax
A `google_resourcemanager_project_iam_policy` is used to test a Google Project Iam Policy resource

## Examples
```
describe google_resourcemanager_project_iam_policy(project_id: "projectId") do
  it { should exist }
end

google_resourcemanager_project_iam_policy(project_id: "projectId").bindings.each do |binding|
  describe binding do
    its('role') { should eq 'roles/editor'}
    its('members') { should include 'user:testuser@example.com'}
  end
end
```

## Properties
Properties that can be accessed from the `google_resourcemanager_project_iam_policy` resource:

  * `bindings`: Associates a list of members to a role.

    * `role`: Role that is assigned to members. For example, roles/viewer, roles/editor, or roles/owner.

    * `members`: Specifies the identities requesting access for a Cloud Platform resource.

  * `audit_configs`: Specifies cloud audit logging configuration for this policy.

    * `service`: Specifies a service that will be enabled for audit logging. For example, `storage.googleapis.com`, `cloudsql.googleapis.com`. `allServices`  is a special value that covers all services.

    * `audit_log_configs`: The configuration for logging of each type of permission.



## GCP Permissions

Ensure the [Cloud Resource Manager API](https://console.cloud.google.com/apis/library/cloudresourcemanager.googleapis.com/) is enabled for the current project.
