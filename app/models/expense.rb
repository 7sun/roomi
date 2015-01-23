class Expense
  include Mongoid::Document
  field :expense_type, type: String
  field :amount, type: Float
  field :description, type: String
  field :date, type: String
  mount_uploader :photo, PhotoUploader
end
