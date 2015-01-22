class Expense
  include Mongoid::Document
  field :type, type: String
  field :amount, type: Integer
  field :description, type: String
  field :date, type: String
  mount_uploader :photo, PhotoUploader
end
