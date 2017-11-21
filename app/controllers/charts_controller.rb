class ChartsController < ApplicationController
  def expenses_chart
    render json: Expense.group_by_day(:due_date).sum("value")
  end
end
