require "test_helper"
require "ostruct"
require_relative "../../../app/lib/auth/authenticated_user"

class TestAuthAuthenticatedUser < Minitest::Test
  def current_user
    @current_user || user.extend(Auth::AuthenticatedUser)
  end

  def test_authenticated
    assert current_user.authenticated?
  end

  def test_email
    assert_equal current_user.email, "tester@example.com"
  end

  private
  
  def user
    OpenStruct.new(email: "tester@example.com")
  end
end
