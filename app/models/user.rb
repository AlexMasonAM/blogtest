class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  field :password_digest, type: String
  field :username, type: String
  field :email, type: String

  has_secure_password

  has_many :comments

 
  validates_confirmation_of :password # ensure password confirmation is filled out and m
  validates :password, length: { minimum: 6 } # ensure password has at least 6 characters
end

