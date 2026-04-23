class Vet < ApplicationRecord
  has_many :appointments, dependent: :destroy

  before_validation :normalize_email

  validates :first_name, :last_name, :specialization, :email, presence: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  scope :by_specialization, ->(specialization) { where(specialization: specialization) }

before_validation :normalize_email

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end