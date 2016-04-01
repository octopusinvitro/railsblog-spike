require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  def setup
    @id = articles(:one).id
  end

  test "should get the articles index" do
    get :index
    assert_success
    assert_not_nil assigns(:articles)
  end

  test "should get an article's page" do
    get :show, {id: @id}
    assert_success
    assert_not_nil assigns(:article)
  end

  test "should not allow to edit, add new, create, update or destroy articles if not authenticated" do
    get :edit, {id: @id}
    assert_no_auth

    get :new
    assert_no_auth

    post :create, article: {title: 'A title'}
    assert_no_auth

    put  :update, id: @id, article: {title: 'Yet another title'}
    assert_no_auth

    delete :destroy, id: @id
    assert_no_auth
  end

  test "should allow to edit, add new, create, update or destroy articles if authenticated" do
    login

    get  :edit, {id: @id}
    assert_success

    get  :new
    assert_success

    post :create, article: {title: 'Another title'}
    assert_redirect

    put :update, id: @id, article: {title: 'Yet another title'}
    assert_redirect

    delete :destroy, id: @id
    assert_redirect
  end

  test "should post a new article page" do
    login
    get :new
    assert_not_nil assigns(:article)
  end

  test "should create article if no errors" do
    login
    assert_difference('Article.count') do
      post :create, article: {title: 'Some title'}
    end
    assert_redirected_to article_path(assigns(:article))
  end

  test "should render new if it couldn't create article" do
    login
    bad_title = ''
    assert_no_difference('Article.count') do
      post :create, article: {title: bad_title}
    end
    assert_routing new_article_path, controller: 'articles', action: 'new'
  end

  test "should update an article if no errors" do
    login
    assert_no_difference('Article.count') do
      put :update, id: @id, article: {id: @id}
    end
    assert_redirected_to article_path(assigns(:article))
  end

  test "should render new if there were errors" do
    login
    bad_title = ''
    assert_no_difference('Article.count') do
      put :update, id: @id, article: {title: bad_title}
    end
    assert_routing new_article_path, controller: 'articles', action: 'new'
  end

  test "deletes an article" do
    login
    delete :destroy, id: @id
    assert_redirected_to articles_path
  end
end
