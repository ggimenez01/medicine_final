class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :province
  validates :email, presence: true, uniqueness: true,
format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :encrypted_password, :address, :province_id, :name, presence: true
  validates :province_id, numericality: { only_integer: true }


  has_many :orders

  def self.ransackable_attributes(auth_object = nil)
    %w[id name address email province_id created_at updated_at]
  end
end
