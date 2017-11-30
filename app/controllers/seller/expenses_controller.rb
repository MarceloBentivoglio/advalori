class Seller::ExpensesController < ApplicationController

  def index
    @expense = Expense.new
    @expenses = expenses.order(due_date: :asc)
  end

  def show
    @expense = expense
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.seller = current_user.seller

    if @expense.save
      redirect_to seller_expenses_path
    else
      render :new
    end
  end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    @expense.update(expense_params)
    redirect_to seller_expenses_path
    success_message
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to seller_expenses_path
  end

  private

  def expense_params
    params.require(:expense).permit(:supplier, :value, :due_date, :seller_id)
  end

  def expense
    seller.expenses.find(params[:id])
  end

  def expenses
    current_user.seller.expenses
  end

  def success_message
    flash[:notice] = "Your profile has been successfully updated"
  end

end
