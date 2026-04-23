class Owner < ApplicationRecord
  has_many :pets, dependent: :destroy

  before_validation :normalize_email

  validates :first_name, :last_name, :phone, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

 before_validation :normalize_email

  private

  def normalize_email
    self.email = email.to_s.strip.downcase
  end
end