class ExpensesController < ApplicationController
  def index
    matching_expenses = Expense.all

    @list_of_expenses = matching_expenses.order({ :created_at => :desc })

    render({ :template => "expenses/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_expenses = Expense.where({ :id => the_id })

    @the_expense = matching_expenses.at(0)

    render({ :template => "expenses/show.html.erb" })
  end

  def create
    the_expense = Expense.new
    the_expense.trip_id = params.fetch("query_trip_id")
    the_expense.expense = params.fetch("query_expense")
    the_expense.expense_type = params.fetch("query_expense_type")
    the_expense.payment_type = params.fetch("query_payment_type")
    the_expense.invoice = params.fetch("query_invoice")
    the_expense.description = params.fetch("query_description")

    if the_expense.valid?
      the_expense.save
      redirect_to("/expenses", { :notice => "Expense created successfully." })
    else
      redirect_to("/expenses", { :notice => "Expense failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_expense = Expense.where({ :id => the_id }).at(0)

    the_expense.trip_id = params.fetch("query_trip_id")
    the_expense.expense = params.fetch("query_expense")
    the_expense.expense_type = params.fetch("query_expense_type")
    the_expense.payment_type = params.fetch("query_payment_type")
    the_expense.invoice = params.fetch("query_invoice")
    the_expense.description = params.fetch("query_description")

    if the_expense.valid?
      the_expense.save
      redirect_to("/expenses/#{the_expense.id}", { :notice => "Expense updated successfully."} )
    else
      redirect_to("/expenses/#{the_expense.id}", { :alert => "Expense failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_expense = Expense.where({ :id => the_id }).at(0)

    the_expense.destroy

    redirect_to("/expenses", { :notice => "Expense deleted successfully."} )
  end
end
