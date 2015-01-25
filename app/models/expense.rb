class Expense
  include Mongoid::Document
  field :expense_type, type: String
  field :amount, type: Float
  field :description, type: String
  field :date, type: Date
  field :owner, type: String
  mount_uploader :photo, PhotoUploader

  embedded_in :group

end
