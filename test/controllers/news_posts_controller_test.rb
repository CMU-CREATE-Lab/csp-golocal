require "test_helper"

class NewsPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @news_post = news_posts(:one)
  end

  test "should get index" do
    get news_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_news_post_url
    assert_response :success
  end

  test "should create news_post" do
    assert_difference("NewsPost.count") do
      post news_posts_url, params: { news_post: { content: @news_post.content, published: @news_post.published, title: @news_post.title } }
    end

    assert_redirected_to news_post_url(NewsPost.last)
  end

  test "should show news_post" do
    get news_post_url(@news_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_news_post_url(@news_post)
    assert_response :success
  end

  test "should update news_post" do
    patch news_post_url(@news_post), params: { news_post: { content: @news_post.content, published: @news_post.published, title: @news_post.title } }
    assert_redirected_to news_post_url(@news_post)
  end

  test "should destroy news_post" do
    assert_difference("NewsPost.count", -1) do
      delete news_post_url(@news_post)
    end

    assert_redirected_to news_posts_url
  end
end
