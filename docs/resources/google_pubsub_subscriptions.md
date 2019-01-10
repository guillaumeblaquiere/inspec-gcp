---
title: About the Subscription resource
platform: gcp
---


## Syntax
A `google_pubsub_subscriptions` is used to test a Google Subscription resource

## Examples
```
describe google_pubsub_subscriptions(project: '') do
  it { should exist }
  its('count') { should eq 1 }
end

google_pubsub_subscriptions(project: '').names.each do |subscription_name|
  describe google_pubsub_subscription(project: '', name: subscription_name) do
    its('name') { should match /#{'inspec-gcp-subscription'}/ }
  end
end

```

## Properties
Properties that can be accessed from the `google_pubsub_subscriptions` resource:

See [google_pubsub_subscription.md](google_pubsub_subscription.md) for more detailed information
  * `names`: an array of `google_pubsub_subscription` name
  * `topics`: an array of `google_pubsub_subscription` topic
  * `push_configs`: an array of `google_pubsub_subscription` push_config
  * `ack_deadline_seconds`: an array of `google_pubsub_subscription` ack_deadline_seconds

## Filter Criteria
This resource supports all of the above properties as filter criteria, which can be used
with `where` as a block or a method.
