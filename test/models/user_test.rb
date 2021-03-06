require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Test User', email: 'test@test.com', password: 'miaumiau', password_confirmation: 'miaumiau')
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'should be present' do
    @user.name = ''
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'name cannot be too long' do
    @user.name = 'a' * 16
    assert_not @user.valid?
  end

  test 'email cannot be too long' do
    @user.email = 'a' * 20 + 'example@example.com'
    assert_not @user.valid?
  end

  test 'email address should be unique' do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test 'password should be present' do
    @user.password = @user.password_confirmation = '' * 6
    assert_not @user.password.valid?
  end

  test 'should have a minimum password length' do
    @user.password = @user.password_confirmation = 'p' * 5
    assert_not @user.valid?
  end
end
