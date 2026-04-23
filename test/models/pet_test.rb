require "test_helper"

class PetTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.create!(
      first_name: "Juan",
      last_name: "Perez",
      email: "owner@test.com",
      phone: "123456789"
    )
  end

  test "valid pet saves" do
    pet = Pet.new(
      name: "Rex",
      species: "dog",
      date_of_birth: Date.new(2020,1,1),
      weight: 10,
      owner: @owner
    )
    assert pet.valid?
  end

  test "invalid species" do
    pet = Pet.new(
      name: "Rex",
      species: "dragon",
      date_of_birth: Date.today,
      weight: 10,
      owner: @owner
    )
    assert_not pet.valid?
  end

  test "invalid future birth date" do
    pet = Pet.new(
      name: "Rex",
      species: "dog",
      date_of_birth: Date.tomorrow,
      weight: 10,
      owner: @owner
    )
    assert_not pet.valid?
  end

  test "invalid weight zero" do
    pet = Pet.new(
      name: "Rex",
      species: "dog",
      date_of_birth: Date.today,
      weight: 0,
      owner: @owner
    )
    assert_not pet.valid?
  end
end