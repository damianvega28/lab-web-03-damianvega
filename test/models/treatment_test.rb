require "test_helper"

class TreatmentTest < ActiveSupport::TestCase
  def setup
    owner = Owner.create!(
      first_name: "Juan",
      last_name: "Perez",
      email: "owner3@test.com",
      phone: "123456789"
    )

    pet = Pet.create!(
      name: "Rex",
      species: "dog",
      date_of_birth: Date.new(2020,1,1),
      weight: 10,
      owner: owner
    )

    vet = Vet.create!(
      first_name: "Ana",
      last_name: "Lopez",
      email: "vet3@test.com",
      phone: "99999",
      specialization: "General"
    )

    @appointment = Appointment.create!(
      pet: pet,
      vet: vet,
      date: Time.now,
      reason: "Checkup",
      status: :scheduled
    )
  end

  test "valid treatment saves" do
    treatment = Treatment.new(
      appointment: @appointment,
      name: "Vaccine",
      administered_at: Time.now
    )
    assert treatment.valid?
  end

  test "invalid without name" do
    treatment = Treatment.new(
      appointment: @appointment,
      administered_at: Time.now
    )
    assert_not treatment.valid?
  end
end