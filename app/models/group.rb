class Group
  include Mongoid::Document
  field :name, type: String
  field :home_type, type: String
  field :address, type: String
  field :member_emails, type: Array
  field :owner_id, type: String

  has_many :users #need to limit users to 6

  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :address, presence: true
end
