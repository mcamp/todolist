require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def test_name
    user = FactoryGirl.build(:user, :name => '')
    assert_not user.save, "User without a Name"
  end

  def test_email
    user = FactoryGirl.build(:user, :email => '')
    assert_not user.save, "User without an Email"
  end

  def test_correct_email
    user = FactoryGirl.build(:user, :email => 'asdf')
    assert_not user.save, "User with incorrect Email"

    user.email = "hola@hola.com"
    assert user.save
  end

  def test_pass
    user = FactoryGirl.build(:user, :password => '')
    assert_not user.save, "User without a password"
  end

  def test_pass_confirmation
    user = FactoryGirl.build(:user, :password => 'foo', :password_confirmation => 'bar')
    assert_not user.save, "User password does not match password_confirmation"
  end

  def test_authentication
    user = FactoryGirl.build(:user, :email => 'email@email.com', :password => 'pass')
    assert user.save

    user = User.find_for_authentication :email => 'email@email.com'
    assert_not user.valid_password? "foo"
    assert user.valid_password? "pass"
  end

  def test_create_task
    user = FactoryGirl.build(:user)
    assert user.save

    FactoryGirl.create(:task, :user => user)
    FactoryGirl.create(:task, :user => user)

    assert_equal 2, user.tasks.size
  end

end
