class ExpensesController < ApplicationController

def download_invoice
  @invoice = Expense.where({:trip_id=>BusinessTravel.where({:id=>session[:business_travel_id]}).at(0).trips.ids}).order(:trip_id)

    render pdf: "Invoice No. #{session[:business_travel_id]}",
    page_size: 'A4',
    template: "expenses/pdf.html.erb",
    layout: "pdf.html",
    orientation: "Landscape",
    lowquality: true,
    zoom: 1,
    dpi: 75
end

  def index
    matching_expenses = Expense.all

    @list_of_expenses = matching_expenses.order({ :created_at => :desc })

    render({ :template => "expenses/index.html.erb" })
  end

  def add
    matching_trips = Trip.all
    matching_trips = matching_trips.where({:business_travel_id => session[:business_travel_id]})
    @list_of_trips = matching_trips.order({ :start_date => :asc })

    session[:indicator] = TRUE

    render({ :template => "expenses/add.html.erb" })

  end

  def add_expense
    render({ :template => "expenses/add_expense.html.erb" })

  end

  def update_expense
    render({ :template => "expenses/update_expense.html.erb" })

  end
  
  def show
    the_id = params.fetch("path_id")

    matching_expenses = Expense.where({ :id => the_id })

    @the_expense = matching_expenses.at(0)

    render({ :template => "expenses/show.html.erb" })
  end

  def create
    the_expense = Expense.new
    the_expense.trip_id = session[:trip_id]
    the_expense.expense = params.fetch("query_expense")
    the_expense.expense_type = params.fetch("query_expense_type")
    the_expense.payment_type = params.fetch("query_payment_type")
    the_expense.description = params.fetch("query_description")

    if the_expense.valid?
      the_expense.save
      redirect_to("/manage_expenses", { :notice => "Expense created successfully." })
    else
      redirect_to("/manage_expenses", { :alert => "Failed to create Expense." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_expense = Expense.where({ :id => the_id }).at(0)

    the_expense.trip_id = session[:trip_id]
    the_expense.expense = params.fetch("query_expense")
    the_expense.expense_type = params.fetch("query_expense_type")
    the_expense.payment_type = params.fetch("query_payment_type")
    the_expense.description = params.fetch("query_description")

    if the_expense.valid?
      the_expense.save
      redirect_to("/manage_expenses", { :notice => "Expense updated successfully."} )
    else
      redirect_to("/manage_expenses", { :alert => "Failed to update Expense." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_expense = Expense.where({ :id => the_id }).at(0)

    the_expense.destroy

    redirect_to("/manage_expenses", { :notice => "Expense deleted successfully."} )
  end
end
