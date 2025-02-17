---
title: About the aws_transit_gateway_route Resource
platform: aws
---

# aws_transit_gateway_route

Use the `aws_transit_gateway_route` InSpec audit resource to test the properties of a single AWS transit gateway route.

## Syntax

An `aws_transit_gateway_route` resource block declares the tests for a single AWS transit gateway route by `transit_gateway_route_table_id`.

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e589', cidr_block: '0.0.0.0/16') do
      it { should exist }
    end

### Parameters

To set the parameters of the AWS transit gateway route table, **ID** and **CIDR** block is required.

#### transit\_gateway\_route\_table\_id _(required)_

The **ID** of the AWS transit gateway route table:

- must contain alphanumeric characters between 1 to 50, or hyphens
- should start with `tgw-rtb-`
- cannot end with a hyphen or contain two consecutive hyphens

The ID of the AWS transit gateway route table should be passed as a `transit_gateway_route_table_id: 'value'` key-value entry in a hash.

#### cidr\_block _(required)_

The **CIDR** block range of the route is associated to the AWS transit gateway route table. It should be passed as a `cidr_block: 'value'` key-value entry in a hash.

## Properties

|Property               | Description                                             |
| ---                   | ---                                                     |
|cidr_block             | The CIDR block used for destination matches.            |
|prefix_list_id         | The ID of the prefix list used for destination matches. |
|type                   | The type of route. Valid values: `propagated` or `static`. |
|state                  | The state of the route. Valid values: `active` or `blackhole`. |
|attachment_resource_id | The resource ID of the transit gateway attachment. Identifiers of relevant resource type.                  |
|attachment_id          | The ID of the transit gateway attachment.                                      |
|attachment_resource_type| The attachment resource type. Valid values are `vpc`, `vpn`, `direct-connect-gateway`, `peering`, `connect`. |

## Examples

### Test if a transit gateway route exists for a transit gateway route table and CIDR block range

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e589', cidr_block: '0.0.0.0/16') do
        it { should exist }
    end

### Test that the ID of the attached VPC is `vpc-00727fc4213acee4a`

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e589', cidr_block: '0.0.0.0/16') do
        its('attachment_resource_id') { should eq 'vpc-00727fc4213acee4a' }
    end

### Test that the ID of the Transit Gateway Attachment is `tgw-attach-0aab89f748131532e`

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e589', cidr_block: '0.0.0.0/16') do
        its('attachment_id') { should eq 'tgw-attach-0aab89f748131532e' }
    end

### Test that the attachment resource type is `vpc`

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e589', cidr_block: '0.0.0.0/16') do
        its('attachment_resource_type') { should eq 'vpc' }
    end

### Test that the prefix list ID is `pl-4ca54025`

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e589', cidr_block: '0.0.0.0/16') do
        its('prefix_list_id') { should eq 'pl-4ca54025' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a complete list of available matchers, visit [matchers page](https://www.inspec.io/docs/reference/matchers/).

### exist

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e589', cidr_block: '0.0.0.0/16') do
        it { should exist }
    end

### be_static

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e589', cidr_block: '0.0.0.0/16') do
        it { should be_static }
    end

### be_propagated

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e911', cidr_block: '0.0.0.0/16') do
        it { should be_propagated }
    end

### be_active

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e589', cidr_block: '0.0.0.0/16') do
        it { should be_active }
    end

### be_blackhole

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e911', cidr_block: '0.0.0.0/17') do
        it { should be_blackhole }
    end

### be_vpc_attachment

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e589', cidr_block: '0.0.0.0/16') do
        it { should be_vpc_attachment }
    end

### be_vpn_attachment

    describe aws_transit_gateway_route(transit_gateway_route_table_id: 'tgw-rtb-08acd74550c99e711', cidr_block: '0.0.0.0/16') do
        it { should be_vpn_attachment }
    end

## AWS Permissions

To set the `allow` permission for the [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal), you need the `EC2:Client:DescribeTransitGatewayRouteTablesResult` action.

Get the detailed document at [Actions, Resources, and Condition Keys for transit gateway route](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-policy-examples.html), and [Actions, Resources, and Condition Keys for Identity And Access Management](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_identityandaccessmanagement.html).
