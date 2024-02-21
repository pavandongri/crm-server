class Contact < ApplicationRecord
  belongs_to :user

  validates :name, :email, :mobile, :company, :role, presence: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "email format is invalid" }
  
  validates :mobile, format: { with: /\A[0-9]{10}\z/, message: "must be 10 digits" }
end