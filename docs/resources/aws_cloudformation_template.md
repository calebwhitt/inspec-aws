---
title: About the aws_cloudformation_template Resource
platform: aws
---

# aws_cloudformation_template

Use the `aws_cloudformation_template` InSpec audit resource to test a single AWS CloudFormation template.

The above resource returns information about a new or existing template.

## Syntax

Ensure that the template exists by passing the `stack_name` parameter.

    describe aws_cloudformation_template(stack_name: 'STACK_NAME') do
      it { should exist }
    end

Ensure that the template exists by passing the `stack_set_name` parameter.

    describe aws_cloudformation_template(stack_set_name: 'STACK_SET_NAME') do
      it { should exist }
    end

Ensure that the template exists by passing the `template_url` parameter.

    describe aws_cloudformation_template(template_url: 'TEMPLATE_URL') do
      it { should exist }
    end

Ensure that the template exists by passing the `template_body` parameter.

    describe aws_cloudformation_template(template_body: 'TEMPLATE_BODY') do
      it { should exist }
    end

## Parameters

This resource requires one of the following parameters.
It must be passed as a `PARAMETER: 'PARAMETER_VALUE'` key-value entry in a hash.

`stack_name` _(required if another parameter not provided)_

The name or the stack ID that is associated with the stack, which are not always interchangeable.

`stack_set_name` _(required if another parameter not provided)_

The name or unique ID of the stack set from which the stack was created.

`template_url` _(required if another parameter not provided)_

Location of file containing the template body. The URL must point to a template (max size: 460,800 bytes) that is located in an Amazon S3 bucket.

`template_body` _(required if another parameter not provided)_

Structure containing the template body with a minimum length of 1 byte and a maximum length of 51,200 bytes.

For additional information, see the [AWS documentation on AWS CloudFormation templates](https://aws.amazon.com/cloudformation/resources/templates/).

## Properties

| Property                                      | Description                                                                                                 |
| :-------------------------------------------: | :---------------------------------------------------------------------------------------------------------: |
| parameter_keys                                | The name that is associated with the parameter.                                                             |
| default_values                                | The default value of the parameter.                                                                         |
| parameter_types                               | The type of parameter.                                                                                            |
| no_echos                                      | Flag that indicates whether the parameter value is shown as plain text in logs and in the AWS Management Console. |
| descriptions                                  | The description that is associate with the parameter.                                                             |
| parameter_constraints_allowed_values          | A list of values that are permitted for a parameter.                                                              |
| description                                   | The value that is defined in the Description property of the template.                                            |
| capabilities                                  | The capabilities found within the template.                                                                       |
| capabilities_reason                           | The list of resources that generated the values in the Capabilities response element.                             |
| resource_types                                | A list of all the template resource types that are defined in the template, such as `AWS::EC2::Instance`, `AWS::Dynamo::Table`, and `Custom::MyCustomInstance`.   |
| version                                       | The AWS template format version, which identifies the capabilities of the template.                               |
| metadata                                      | The value that is defined for the Metadata property of the template.                                              |
| declared_transforms                           | A list of the transforms that are declared in the template.                                                       |
| resource_types(resource_identifier_summaries) | The resource types of the resource identifier summaries.                                                          |
| logical_resource_ids                          | The logical resource id of the resource identifier summaries.                                                     |
| resource_identifiers                          | The resource identifier of the resource identifier summaries.                                                     |

## Examples

### Ensure that the parameter keys exists by passing the required parameter `stack_name`.

     describe aws_cloudformation_template(stack_name: 'STACK_NAME') do
      its('parameter_keys') {should include 'HttpsCACertificates' }
    end

### Ensure that the parameter keys exists by passing the required parameter `template_url`.

    describe aws_cloudformation_template(template_url: 'TEMPLATE_URL') do
      its('parameter_keys') {should include 'HttpsCACertificates' }
    end

### Ensure that the resource_types exists by passing the required parameter `stack_name`.

     describe aws_cloudformation_template(stack_name: 'STACK_NAME') do
      its('resource_types') {should include 'AWS::EC2::Instance' }
    end

### Ensure that the resource_types exists by passing the required parameter `template_url`.

    describe aws_cloudformation_template(template_url: 'TEMPLATE_URL') do
      its('resource_types') {should include 'AWS::EC2::Instance' }
    end

## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://www.inspec.io/docs/reference/matchers/).

The controls will pass if the `get` method returns at least one result.

### exist

Use `should` to test that the entity exists by passing the required parameter `stack_name`.

    describe aws_cloudformation_template(stack_name: 'STACK_NAME') do
      it { should exist }
    end

Use `should` to test that the entity exists by passing the required parameter `template_url`.

    describe aws_cloudformation_template(template_url: 'TEMPLATE_URL') do
      it { should exist }
    end

Use `should_not` to test that the entity exists by passing the required parameter `stack_name`.

    describe aws_cloudformation_template(stack_name: 'STACK_NAME') do
      it { should_not exist }
    end

Use `should_not` to test that the entity exists by passing the required parameter `template_url`.

    describe aws_cloudformation_template(template_url: 'TEMPLATE_URL') do
      it { should_not exist }
    end

### be_available

Use `should` to test that the entity is available by passing the required parameter `stack_name`.

    describe aws_cloudformation_template(stack_name: 'STACK_NAME') do
      it { should be_available }
    end

Use `should` to test that the entity is available by passing the required parameter `template_url`.

    describe aws_cloudformation_template(template_url: 'TEMPLATE_URL') do
      it { should be_available }
    end

## AWS Permissions

Your [Principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/intro-structure.html#intro-structure-principal) will need the `CloudFormation:Client:GetTemplateSummaryOutput` action with `Effect` set to `Allow`.
