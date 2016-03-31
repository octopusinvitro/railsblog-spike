require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = create_comment_from_article
  end

  test "is invalid without an article" do
    comment1 = Comment.new
    comment2 = create_comment_with(article_id: nil)
    assert comment1.invalid?
    assert comment2.invalid?
  end

  test "is valid if it has an article" do
    assert @comment.valid?
  end

  test "a comment belongs to an article" do
    assert_respond_to @comment, :article
  end

  test "a comment contains a reference to its article" do
    assert_equal @comment.article, articles(:article_with_comments)
  end

  test "a comment has an association with an article" do
    assoc = Comment.reflect_on_association(:article)
    assert_equal assoc.foreign_key, "article_id"
  end

end
