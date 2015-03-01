require "test_helper"
require_relative "../../../app/lib/auth/visitor"

class TestAuthVisitor < Minitest::Test
  def visitor
    @visitor || Auth::Visitor.new
  end

  def test_authenticated
    refute visitor.authenticated?
  end

  def test_email
    assert_equal visitor.email, "-"
  end
end
