class Seller::ExpensesController < ApplicationController

  def index
    @expense = Expense.new
    @expenses = expenses
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



  def update
    if expense.update(expense_params)
    end
  end

  def destroy
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
end
