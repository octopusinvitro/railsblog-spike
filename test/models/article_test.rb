require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

  test "is invalid without a title" do
    a = Article.new
    assert a.invalid?
    assert_not a.save
  end

  test "is invalid if title length is less than minimum" do
    a = create_article_with(title: "hey")
    assert a.invalid?
    assert_not a.save
  end

  test "is valid if has a title and it is larger than the minimum" do
    a = create_article_with(title: "A title")
    assert a.valid?
    assert a.save
  end

  test "an article has many comments" do
    a = create_article_with(title: "Another title")
    assert_respond_to a, :comments
  end

  test "an article can contain comments" do
    a = create_article_with_comments
    assert_equal a.comments, [comments(:two), comments(:one)]
  end

  test "should contain only comments that belong to article" do
    a = create_article_with_comments
    assert a.comments.all? { |comment| comment.article == a }
  end

  test "should delete all comments when article is deleted" do
    a = create_article_with_comments
    a.destroy
    assert_raise(ActiveRecord::RecordNotFound) { comments(:one) }
    assert_raise(ActiveRecord::RecordNotFound) { comments(:two) }
  end

end
