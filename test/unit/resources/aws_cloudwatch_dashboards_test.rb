require 'helper'
require 'aws_cloudwatch_dashboards'
require 'aws-sdk-core'

class AWSCloudwatchDashboardsConstructorTest < Minitest::Test

  def test_empty_params_ok
    AWSCloudwatchDashboards.new(client_args: { stub_responses: true })
  end

  def test_rejects_other_args
    assert_raises(ArgumentError) { AWSCloudwatchDashboards.new('rubbish') }
  end

  def test_dashboards_non_existing_for_empty_response
    refute AWSCloudwatchDashboards.new(client_args: { stub_responses: true }).exist?
  end
end

class AWSCloudwatchDashboardsHappyPathTest < Minitest::Test

  def setup
    data = {}
    data[:method] = :list_dashboards
    mock_cloudwatch_dashboards = {}
    mock_cloudwatch_dashboards[:dashboard_name] = 'test-name'
    mock_cloudwatch_dashboards[:dashboard_arn] = 'test-arn'
    mock_cloudwatch_dashboards[:last_modified] = Time.now
    another_mock_cloudwatch_dashboards = {}
    another_mock_cloudwatch_dashboards[:dashboard_name] = 'test-name'
    another_mock_cloudwatch_dashboards[:dashboard_arn] = 'test-arn'
    mock_cloudwatch_dashboards[:last_modified] = Time.now
    data[:data] = { :dashboard_entries => [mock_cloudwatch_dashboards, another_mock_cloudwatch_dashboards] }
    data[:client] = Aws::CloudWatch::Client
    @dashboards = AWSCloudwatchDashboards.new(client_args: { stub_responses: true }, stub_data: [data])
  end

  def test_dashboards_exists
    assert @dashboards.exist?
  end

  def test_dashboards_count
    assert_equal(@dashboards.dashboard_names.count, 2)
  end

  def test_dashboards_names
    assert_equal(@dashboards.dashboard_names, %w[test-name test-name])
  end

  def test_dashboards_arns
    assert_equal(@dashboards.dashboard_arns, %w[test-arn test-arn])
  end
end