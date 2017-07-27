class User < ActiveRecord::Base
  validates :first_name, :second_name, :email, :password_digest, presence: { message: "Field must be given, please" }
  validates :email, uniqueness: { message: "Hello again my friend! This mail already exists" }
  validates :password,  format: {:with => /\A(?=.*[a-zA-Z])(?=.*[0-9]).{3,}/, message: "Must be at least 3 characters and include one number and one letter."}
  #validates :password_digest,  length: { minimum: 3, maximum: 20 },
  has_secure_password #cause password has a type -> password:digest
end
