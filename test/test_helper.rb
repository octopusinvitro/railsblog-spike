ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def create_article_with(params)
    Article.new(params)
  end

  def create_article_with_comments
    articles(:article_with_comments)
  end

  def create_comment_with(params)
    Comment.new(params)
  end

  def create_comment_from_article
    comments(:one)
  end

end
