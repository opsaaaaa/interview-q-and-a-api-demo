require "test_helper"

class DocsControllerTest < ActionDispatch::IntegrationTest
  test "should get about_api" do
    get docs_about_api_url
    assert_response :success
  end

  test "should get specs" do
    get docs_specs_url
    assert_response :success
  end

  test "should get readme" do
    get docs_readme_url
    assert_response :success
  end
end
