class Group
  include Mongoid::Document
  field :name, type: String
  field :owner, type: String
  field :members, type: String
end
