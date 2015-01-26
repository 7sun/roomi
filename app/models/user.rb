class User
  include Mongoid::Document
  include ActiveModel::SecurePassword

  has_secure_password

  # field :name, type: String
  field :email, type: String
  field :name, type: String
  field :password_digest, type: String
  field :group_member, type: Boolean

  # belongs_to :group

  validates :email, uniqueness: { case_sensitive: false }
  validates :password, confirmation: true#, length: { :within => 6..30 }

end
