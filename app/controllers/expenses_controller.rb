class ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
  end

  def new
  end

  def create
  end




end