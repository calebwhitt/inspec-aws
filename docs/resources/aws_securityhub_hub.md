---
title: About the aws_securityhub_hub Resource
platform: aws
---

# aws_securityhub_hub

Use the `aws_securityhub_hub` InSpec audit resource to test properties of a single AWS Security Hub.

## Syntax

Ensure that the hub exists.

    describe aws_securityhub_hub(hub_arn: 'HUB_ARN') do
      it { should exist }
    end

## Parameters

`hub_arn` _(required)_

The ARN of the Hub resource that was retrieved.

For additional information, see the [AWS documentation on AWS Security Hub.](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-cloudwatch-compositealarm.html).

## Properties

| Property | Description |
| --- | --- |
| hub_arn | The ARN of the Hub resource that was retrieved. |
| subscribed_at | The date and time when Security Hub was enabled in the account. |
| auto_enable_controls |Whether to automatically enable new controls when they are added to standards that are enabled. |


## Examples

### Ensure an auto enable controls is true.
    describe aws_securityhub_hub(hub_arn: 'HUB_ARN') do
      its('auto_enable_controls') { should eq true }
    end

### Ensure an hub arn is available.
    describe aws_securityhub_hub(hub_arn: 'HUB_ARN') do
        its('hub_arn') { should eq 'ALARM_NAME' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `describe` method returns at least one result.

### exist

Use `should` to test that the entity exists.

    describe aws_securityhub_hub(hub_arn: 'HUB_ARN') do
      it { should exist }
    end

Use `should_not` to test the entity does not exist.

    describe aws_securityhub_hub(hub_arn: 'HUB_ARN') do
      it { should_not exist }
    end

### be_available

Use `should` to check if the entity is available.

    describe aws_securityhub_hub(hub_arn: 'HUB_ARN') do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `SecurityHub:Client:DescribeHubResponse` action with `Effect` set to `Allow`.