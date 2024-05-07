require "test_helper"

class PublishingCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @publishing_company = publishing_companies(:one)
  end

  test "should get index" do
    get publishing_companies_url, as: :json
    assert_response :success
  end

  test "should create publishing_company" do
    assert_difference("PublishingCompany.count") do
      post publishing_companies_url, params: { publishing_company: { company_name: @publishing_company.company_name } }, as: :json
    end

    assert_response :created
  end

  test "should show publishing_company" do
    get publishing_company_url(@publishing_company), as: :json
    assert_response :success
  end

  test "should update publishing_company" do
    patch publishing_company_url(@publishing_company), params: { publishing_company: { company_name: @publishing_company.company_name } }, as: :json
    assert_response :success
  end

  test "should destroy publishing_company" do
    assert_difference("PublishingCompany.count", -1) do
      delete publishing_company_url(@publishing_company), as: :json
    end

    assert_response :no_content
  end
end
