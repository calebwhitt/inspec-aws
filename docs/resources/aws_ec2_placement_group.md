---
title: About the aws_ec2_placement_group Resource
platform: aws
---

# aws_ec2_placement_group

Use the `aws_ec2_placement_group` InSpec audit resource to test the properties of a single specific EC2 placement group.

## Syntax

### Ensure that a placement group ID exists

    describe aws_ec2_placement_group(group_id: 'GROUP_ID') do
      it { should exist }
    end

## Parameters

`group_id` _(required)_

The ID of the placement group.

`group_name` _(required)_

The name of the placement group.

For additional information, see the [AWS documentation on EC2 placement groups](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-placementgroup.html).

## Properties

| Property | Description |
| --- | --- |
| group_name | The name of the placement group. |
| state | The state of the placement group. |
| strategy | The placement strategy. |
| partition_count | The partition count of the placement group. |
| group_id | The ID of the placement group. |
| tags | The tags of the placement group. |

## Examples

### Ensure a placement group ID is available

    describe aws_ec2_placement_group(group_id: 'GROUP_ID') do
      its('group_id') { should eq 'GROUP_ID' }
    end

### Ensure that the state is `available` or `deleted`

    describe aws_ec2_placement_group(group_id: 'GROUP_ID') do
        its('state') { should eq 'available' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `describe` method returns at least one result.

### exist

Use `should` to test that the entity exists.

    describe aws_ec2_placement_group(group_id: 'GROUP_ID') do
      it { should exist }
    end

Use `should_not` to test the entity does not exist.

    describe aws_ec2_placement_group(group_id: 'GROUP_ID') do
      it { should_not exist }
    end

### be_available

Check if the entity is available.

    describe aws_ec2_placement_group(group_id: 'GROUP_ID') do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `EC2:Client:DescribePlacementGroupsResult` action with `Effect` set to `Allow`.

See the [Actions, Resources, and Condition Keys for Amazon EC2](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_amazonec2.html) documentation for additional information.
