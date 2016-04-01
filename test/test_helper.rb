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

  def login
    name     = 'yeqpacha'
    password = 'secret'
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(name, password)
  end

  def assert_no_auth
    assert_response 401
  end

  def assert_success
    assert_response :success
  end

  def assert_redirect
    assert_response :redirect
  end

  def assert_assigns(view_variable)
    assert_not_nil assigns(view_variable)
  end

end
