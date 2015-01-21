class Expense
  include Mongoid::Document
  field :name, type: String
  field :amount, type: Integer
  field :description, type: String
  field :date, type: String
end
