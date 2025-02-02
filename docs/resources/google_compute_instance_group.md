---
title: About the google_compute_instance_group resource
platform: gcp
---

## Syntax
A `google_compute_instance_group` is used to test a Google InstanceGroup resource

## Examples
```

describe google_compute_instance_group(project: 'chef-gcp-inspec', zone: 'zone', name: 'inspec-instance-group') do
  it { should exist }
  its('description') { should cmp 'My instance group for testing' }
  its('named_ports.count') { should cmp 1 }
  its('named_ports.first.name') { should cmp 'https' }
  its('named_ports.first.port') { should cmp '8080' }
end

describe google_compute_instance_group(project: 'chef-gcp-inspec', zone: 'zone', name: 'nonexistent') do
  it { should_not exist }
end
```

## Properties
Properties that can be accessed from the `google_compute_instance_group` resource:


  * `creation_timestamp`: Creation timestamp in RFC3339 text format.

  * `description`: An optional description of this resource. Provide this property when you create the resource.

  * `id`: A unique identifier for this instance group.

  * `name`: The name of the instance group. The name must be 1-63 characters long, and comply with RFC1035.

  * `named_ports`: Assigns a name to a port number. For example: {name: "http", port: 80}.  This allows the system to reference ports by the assigned name instead of a port number. Named ports can also contain multiple ports.  For example: [{name: "http", port: 80},{name: "http", port: 8080}]  Named ports apply to all instances in this instance group.

    * `name`: The name for this named port. The name must be 1-63 characters long, and comply with RFC1035.

    * `port`: The port number, which can be a value between 1 and 65535.

  * `network`: The network to which all instances in the instance group belong.

  * `region`: The region where the instance group is located (for regional resources).

  * `subnetwork`: The subnetwork to which all instances in the instance group belong.

  * `zone`: A reference to the zone where the instance group resides.


## GCP Permissions

Ensure the [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com/) is enabled for the current project.
