class Group
  include Mongoid::Document
  field :name, type: String
  field :home_type, type: String
  field :owner_id, type: String
  field :address, type: String
  field :member_emails, type: Array

  has_many :users #need to limit users to 6

  validates :name, uniqueness: {case_sensitive: false}
end
