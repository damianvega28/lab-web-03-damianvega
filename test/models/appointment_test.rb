require "test_helper"

class AppointmentTest < ActiveSupport::TestCase
  def setup
    @owner = Owner.create!(
      first_name: "Juan",
      last_name: "Perez",
      email: "owner2@test.com",
      phone: "123456789"
    )

    @pet = Pet.create!(
      name: "Rex",
      species: "dog",
      date_of_birth: Date.new(2020,1,1),
      weight: 10,
      owner: @owner
    )

    @vet = Vet.create!(
      first_name: "Ana",
      last_name: "Lopez",
      email: "vet2@test.com",
      phone: "999999",
      specialization: "General"
    )
  end

  test "valid appointment saves" do
    appointment = Appointment.new(
      pet: @pet,
      vet: @vet,
      date: Time.now,
      reason: "Checkup",
      status: :scheduled
    )
    assert appointment.valid?
  end

  test "invalid without reason" do
    appointment = Appointment.new(
      pet: @pet,
      vet: @vet,
      date: Time.now,
      status: :scheduled
    )
    assert_not appointment.valid?
  end

  test "enum works" do
    appointment = Appointment.create!(
      pet: @pet,
      vet: @vet,
      date: Time.now,
      reason: "Checkup",
      status: :completed
    )

    assert appointment.completed?
  end
end