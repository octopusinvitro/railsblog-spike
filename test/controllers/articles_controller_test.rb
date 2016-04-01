require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase

  def setup
    @id = articles(:one).id
  end

  def index
    get :index
  end

  def edit
    get :edit, {id: @id}
  end

  def show
    get :show, {id: @id}
  end

  def new_article
    get :new
  end

  def create
    post :create, article: {title: 'A title'}
  end

  def update
    put  :update, id: @id, article: {title: 'Yet another title'}
  end

  def destroy
    delete :destroy, id: @id
  end

  def assert_assigns(view_variable)
    assert_not_nil assigns(view_variable)
  end

  def assert_renders(template, partial = '')
    assert_template template
    if partial.empty?
      assert_template layout: "layouts/application"
    else
      assert_template layout: "layouts/application", partial: partial
    end
  end

  test "should get the articles index" do
    index
    assert_success
    assert_assigns(:articles)
  end

  test "should get an article's page" do
    show
    assert_success
    assert_assigns(:article)
  end

  test "should not allow to edit, add new, create, update or destroy articles if not authenticated" do
    edit
    assert_no_auth

    new_article
    assert_no_auth

    create
    assert_no_auth

    update
    assert_no_auth

    destroy
    assert_no_auth
  end

  test "should allow to edit, add new, create, update or destroy articles if authenticated" do
    login

    edit
    assert_success

    new_article
    assert_success

    create
    assert_redirect

    update
    assert_redirect

    destroy
    assert_redirect
  end

  test "should post a new article page" do
    login
    new_article
    assert_assigns(:article)
  end

  test "should create article if no errors" do
    login
    assert_difference('Article.count') do
      create
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
      update
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
    destroy
    assert_redirected_to articles_path
  end

  test "renders the index template" do
    index
    assert_renders(:index)
  end

  test "renders the edit template" do
    login
    edit
    assert_renders(:edit, "_form")
  end

  test "renders the show template" do
    show
    assert_renders(:show)
  end

  test "renders the new template" do
    login
    new_article
    assert_renders(:new, "_form")
  end

  test "renders the new template if there are errors when creating article" do
    login
    bad_title = ''
    post :create, article: {title: bad_title}
    assert_renders(:new, "_form")
  end

  test "renders the edit template if there are errors when updating article" do
    login
    bad_title = ''
    put :update, id: @id, article: {title: bad_title}
    assert_renders(:edit, "_form")
  end

end
