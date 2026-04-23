require "test_helper"

class VetTest < ActiveSupport::TestCase
  test "valid vet saves" do
    vet = Vet.new(
      first_name: "Ana",
      last_name: "Lopez",
      email: "ana@vet.com",
      phone: "123456789",
      specialization: "Surgery"
    )
    assert vet.valid?
  end

  test "invalid without specialization" do
    vet = Vet.new(
      first_name: "Ana",
      last_name: "Lopez",
      email: "ana@vet.com",
      phone: "123456789"
    )
    assert_not vet.valid?
  end

  test "invalid duplicate email" do
    Vet.create!(first_name: "A", last_name: "B", email: "dup@vet.com", phone: "1", specialization: "General")
    vet = Vet.new(first_name: "C", last_name: "D", email: "dup@vet.com", phone: "2", specialization: "Surgery")
    assert_not vet.valid?
  end
end