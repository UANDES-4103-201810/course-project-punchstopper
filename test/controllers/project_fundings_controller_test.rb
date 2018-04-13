require 'test_helper'

class ProjectFundingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_funding = project_fundings(:one)
  end

  test "should get index" do
    get project_fundings_url
    assert_response :success
  end

  test "should get new" do
    get new_project_funding_url
    assert_response :success
  end

  test "should create project_funding" do
    assert_difference('ProjectFunding.count') do
      post project_fundings_url, params: { project_funding: { amount: @project_funding.amount, project_id: @project_funding.project_id, project_promise_id: @project_funding.project_promise_id, user_id: @project_funding.user_id } }
    end

    assert_redirected_to project_funding_url(ProjectFunding.last)
  end

  test "should show project_funding" do
    get project_funding_url(@project_funding)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_funding_url(@project_funding)
    assert_response :success
  end

  test "should update project_funding" do
    patch project_funding_url(@project_funding), params: { project_funding: { amount: @project_funding.amount, project_id: @project_funding.project_id, project_promise_id: @project_funding.project_promise_id, user_id: @project_funding.user_id } }
    assert_redirected_to project_funding_url(@project_funding)
  end

  test "should destroy project_funding" do
    assert_difference('ProjectFunding.count', -1) do
      delete project_funding_url(@project_funding)
    end

    assert_redirected_to project_fundings_url
  end
end
