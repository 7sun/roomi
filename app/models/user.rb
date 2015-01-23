class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_secure_password

  field :email, type: String
  field :password_digest, type: String
  # field :group_owner, type: Boolean

  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true, length: { :within => 6..30 }

end
