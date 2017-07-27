class User < ActiveRecord::Base
  validates :first_name, :second_name, :email, :password_digest, presence: { message: "Field must be given, please" }
  validates :email, uniqueness: { message: "Hello again my friend! This mail already exists" }
  has_secure_password #cause password has a type -> password:digest
end
