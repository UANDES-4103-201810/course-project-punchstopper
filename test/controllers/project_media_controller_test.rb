require 'test_helper'

class ProjectMediaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_medium = project_media(:one)
  end

  test "should get index" do
    get project_media_url
    assert_response :success
  end

  test "should get new" do
    get new_project_medium_url
    assert_response :success
  end

  test "should create project_medium" do
    assert_difference('ProjectMedium.count') do
      post project_media_url, params: { project_medium: { link: @project_medium.link, link_type: @project_medium.link_type, project_id: @project_medium.project_id } }
    end

    assert_redirected_to project_medium_url(ProjectMedium.last)
  end

  test "should show project_medium" do
    get project_medium_url(@project_medium)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_medium_url(@project_medium)
    assert_response :success
  end

  test "should update project_medium" do
    patch project_medium_url(@project_medium), params: { project_medium: { link: @project_medium.link, link_type: @project_medium.link_type, project_id: @project_medium.project_id } }
    assert_redirected_to project_medium_url(@project_medium)
  end

  test "should destroy project_medium" do
    assert_difference('ProjectMedium.count', -1) do
      delete project_medium_url(@project_medium)
    end

    assert_redirected_to project_media_url
  end
end
