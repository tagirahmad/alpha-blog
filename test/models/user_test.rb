class UserTest < ActiveSupport::TestCase
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  def setup
    @user = User.new(username: "Tagirka", email: "superemail@gmail.com", password: "2110mama")
  end

  test "user should be valid" do
    # p @user.errors.full_messages
    assert @user.valid?
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "email should be unique" do
    @user.save
    @user2 = User.new(username: "Tagir2", email: "superemail@gmail.com", password: "2110mama")
    assert_not @user2.valid?
  end

  test "username should be unique" do
    @user.save
    @user2 = User.new(username: "Tagirka", email: "superemail2@gmail.com", password: "2110mama")
    assert_not @user2.valid?
  end

  test "username should not be too long" do
    @user.username = "a" * 26
    assert_not @user.valid?
  end

  test "username should not be too short" do
    @user.username = "aa"
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 106
    assert_not @user.valid?
  end

  test "email should match regexp" do
    assert @user.email =~ VALID_EMAIL_REGEX
  end

  test "email should not match regexp" do
    @user.email = "dsds"
    assert_not @user.email =~ VALID_EMAIL_REGEX
  end
end
