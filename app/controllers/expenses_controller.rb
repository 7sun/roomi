class ExpensesController < ApplicationController

  def new
    @expense = Expense.new
  end

  def edit
    group = Group.where(:member_emails.in => [current_user.email]).first
    @expense = group.expenses.find(params[:id])
  end

  def update
    group = Group.where(:member_emails.in => [current_user.email]).first
    @expense = group.expenses.find(params[:id])

    if @expense.update(expense_params)
      redirect_to home_path
    else
      render :edit
    end
  end

  def create
    group = Group.where(:member_emails.in => [current_user.email]).first
    group.expenses.create(expense_params)
    redirect_to home_path
  end

  def destroy
    group = Group.where(:member_emails.in => [current_user.email]).first
    @expense = group.expenses.find(params[:id])
    @expense.destroy
    redirect_to home_path
  end



  def expense_params
    params.require(:expense).permit(:expense_type, :amount, :description, :date, :photo, :owner, :owner_name)
  end



end