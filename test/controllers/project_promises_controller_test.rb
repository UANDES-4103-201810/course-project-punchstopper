require 'test_helper'

class ProjectPromisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_promise = project_promises(:one)
  end

  test "should get index" do
    get project_promises_url
    assert_response :success
  end

  test "should get new" do
    get new_project_promise_url
    assert_response :success
  end

  test "should create project_promise" do
    assert_difference('ProjectPromise.count') do
      post project_promises_url, params: { project_promise: { cost: @project_promise.cost, description: @project_promise.description, project_id: @project_promise.project_id } }
    end

    assert_redirected_to project_promise_url(ProjectPromise.last)
  end

  test "should show project_promise" do
    get project_promise_url(@project_promise)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_promise_url(@project_promise)
    assert_response :success
  end

  test "should update project_promise" do
    patch project_promise_url(@project_promise), params: { project_promise: { cost: @project_promise.cost, description: @project_promise.description, project_id: @project_promise.project_id } }
    assert_redirected_to project_promise_url(@project_promise)
  end

  test "should destroy project_promise" do
    assert_difference('ProjectPromise.count', -1) do
      delete project_promise_url(@project_promise)
    end

    assert_redirected_to project_promises_url
  end
end
