class ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
  end

  def new
    @expense = Expense.new
  end

  # def show
  #   group = Group.where(:member_emails.in => [current_user.email]).first
  #   @expenses = group.expenses.where(:owner == current_user.id)
  # end

  def create
    group = Group.where(:member_emails.in => [current_user.email]).first
    group.expenses.create(expense_params)
    redirect_to home_path
    # if expense.valid?
    #   expense.owner = current_user.id
    #   if group.expenses.save
    #     redirect_to home_path
    #   end
    # else
    #   render :new
    # end
  end


  def expense_params
    params.require(:expense).permit(:expense_type, :amount, :description, :date, :photo, :owner)
  end



end