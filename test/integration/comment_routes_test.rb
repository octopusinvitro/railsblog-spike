# frozen_string_literal: true

require 'test_helper'

class ArticleRoutesTest < ActionDispatch::IntegrationTest
  test 'should route to create comment' do
    assert_routing(
      { method: 'post', path: '/articles/1/comments' },
      controller: 'comments', action: 'create', article_id: '1'
    )
  end

  test 'should route to destroy comment' do
    assert_routing(
      { method: 'delete', path: '/articles/1/comments/1' },
      controller: 'comments', action: 'destroy', article_id: '1', id: '1'
    )
  end
end
