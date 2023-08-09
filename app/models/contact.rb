class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :address, presence: true
  validates :phone_number, presence: true
  def self.ransackable_attributes(auth_object = nil)
    ["name", "email", "address", "phone_number"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
