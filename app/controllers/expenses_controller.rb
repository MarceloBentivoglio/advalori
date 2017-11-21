class ExpensesController < ApplicationController

  def index
    @expense = Expense.all
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.seller = current_user.seller

    if @expense.save
      redirect_to expenses_path
    else
      render :new
    end
  end



  def update
  end

  def destroy
  end

  private

  def expense_params
    params.require(:expense).permit(:supplier, :value, :due_date, :seller_id)
  end
end
