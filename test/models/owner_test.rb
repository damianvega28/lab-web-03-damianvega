require "test_helper"

class OwnerTest < ActiveSupport::TestCase
  test "valid owner saves" do
    owner = Owner.new(
      first_name: "Juan",
      last_name: "Perez",
      email: "juan@test.com",
      phone: "123456789"
    )
    assert owner.valid?
  end

  test "invalid without first_name" do
    owner = Owner.new(last_name: "Perez", email: "juan@test.com", phone: "123456789")
    assert_not owner.valid?
    assert_includes owner.errors[:first_name], "can't be blank"
  end

  test "invalid without last_name" do
    owner = Owner.new(first_name: "Juan", email: "juan@test.com", phone: "123456789")
    assert_not owner.valid?
  end

  test "invalid without email" do
    owner = Owner.new(first_name: "Juan", last_name: "Perez", phone: "123456789")
    assert_not owner.valid?
  end

  test "invalid without phone" do
    owner = Owner.new(first_name: "Juan", last_name: "Perez", email: "juan@test.com")
    assert_not owner.valid?
  end

  test "invalid duplicate email" do
    Owner.create!(first_name: "A", last_name: "B", email: "repeat@test.com", phone: "111")
    owner = Owner.new(first_name: "C", last_name: "D", email: "repeat@test.com", phone: "222")
    assert_not owner.valid?
  end
end