require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  def delete_comment
    delete :destroy,
      article_id: comments(:one).article_id,
      id: comments(:one).id
  end

  def create_comment
    post :create,
      article_id: comments(:one).article_id,
      comment: {commenter: 'foo', body: 'bar'}
  end

  test "creates a comment" do
    assert_difference('Comment.count') do
      create_comment
    end
    assert_assigns(:article)
    assert_assigns(:comment)
    assert_redirected_to article_path(comments(:one).article)
  end

  test "should not allow to delete a comment if not authenticated" do
    delete_comment
    assert_no_auth
  end

  test "should allow to delete a comment if authenticated" do
    login
    delete_comment
    assert_redirect
  end

  test "deletes a comment" do
    login
    delete_comment
    assert_assigns(:article)
    assert_assigns(:comment)
    assert_redirected_to article_path(comments(:one).article)
  end

end
