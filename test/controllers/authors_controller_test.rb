require "test_helper"

class AuthorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @author = authors(:one)
  end

  test "should get index" do
    get authors_url, as: :json
    assert_response :success
  end

  test "should create author" do
    assert_difference("Author.count") do
      post authors_url, params: { author: { biography: @author.biography, name: @author.name, picture: @author.picture } }, as: :json
    end

    assert_response :created
  end

  test "should show author" do
    get author_url(@author), as: :json
    assert_response :success
  end

  test "should update author" do
    patch author_url(@author), params: { author: { biography: @author.biography, name: @author.name, picture: @author.picture } }, as: :json
    assert_response :success
  end

  test "should destroy author" do
    assert_difference("Author.count", -1) do
      delete author_url(@author), as: :json
    end

    assert_response :no_content
  end
end
