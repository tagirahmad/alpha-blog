class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    # @user = User.create(username: "TestUser", email: "testuser@gmail.com", password: "password")
  end

  test "should get list of users" do
    get users_url
    assert_response :success
  end

  test "should get new users page" do
    get "/signup"
    assert_response :success
  end

  test "should get login page" do
    get "/login"
    assert_response :success
  end

  test "should create new user" do
    # @user = User.create(username: "TestUser", email: "testuser@gmail.com", password: "password")
    # assert if @user.valid?
    # assert session[:user_id] == @user.id
    assert_difference("User.count", 1) do
      post users_path, params: { user: { username: "TestUser2", email: "testuser2@gmail.com", password: "password" } }
    end

    assert_equal "Welcome to Alpha Blog, TestUser2, you have successfully signed up.", flash[:notice]
    assert_redirected_to articles_path
  end

  test "should open user's profile page" do
    @user = User.create(username: "TestUser3", email: "testuser3@gmail.com", password: "password")
    get "/users/#{@user.id}"
    assert_response :success
  end
end
