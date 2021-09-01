---
title: About the aws_ec2_vpn_gateway_route_propagation Resource
platform: aws
---

# aws_ec2_vpn_gateway_route_propagation

Use the `aws_ec2_vpn_gateway_route_propagation` InSpec audit resource to test properties of a single specific AWS EC2 VPN Gateway Route Propagation.

The AWS::EC2::VPNGatewayRoutePropagation resource enables a virtual private gateway (VGW) to propagate routes to the specified route table of a VPC.

## Syntax

Ensure that Network Interface Attachment exists.

    describe aws_ec2_network_interface_attachment(network_interface_id: 'NetworkInterfaceId') do
      it { should exist }
    end

## Parameters

`network_interface_id` _(required)_

| Property | Description |
| --- | --- | --- |
| network_interface_id | The ID of the network interface. |

For additional information, see the [AWS documentation on AWS EC2 VPN Gateway Route Propagation.](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-ec2-vpn-gatewayrouteprop.html).

## Properties

| Property | Description | Field | 
| --- | --- | --- |
| attach_time | The timestamp indicating when the attachment initiated. | attach_time |
| attachment_id | The ID of the network interface attachment. | attachment_id |
| delete_on_termination | Indicates whether the network interface is deleted when the instance is terminated. | delete_on_termination |
| device_index | The device index of the network interface attachment on the instance. | device_index |
| network_card_index | The index of the network card. | network_card_index |
| instance_id | The ID of the instance. | instance_id |
| instance_owner_id | The Amazon Web Services account ID of the owner of the instance. | instance_owner_id |
| status | The attachment state. | status |

## Examples

### Ensure a attachment id is available.
    describe aws_ec2_network_interface_attachment(network_interface_id: 'NetworkInterfaceId') do
      its('attachment_id') { should eq 'AttachmentID' }
    end

### Ensure that the status is `available`.
    describe aws_ec2_network_interface_attachment(network_interface_id: 'NetworkInterfaceId') do
        its('status') { should eq 'available' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `describe` method returns at least one result.

### exist

Use `should` to test that the entity exists.

    describe aws_ec2_network_interface_attachment(network_interface_id: 'NetworkInterfaceId') do
      it { should exist }
    end

Use `should_not` to test the entity does not exist.

    describe aws_ec2_network_interface_attachment(network_interface_id: 'dummy') do
      it { should_not exist }
    end

### be_available

Use `should` to check if the entity is available.

    describe aws_ec2_network_interface_attachment(network_interface_id: 'NetworkInterfaceId') do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `EC2:Client:DescribeVpnConnectionsResult` action with `Effect` set to `Allow`.