class BudgetsController < ApplicationController
  def index
    matching_budgets = Budget.all

    @list_of_budgets = matching_budgets.order({ :created_at => :desc })

    render({ :template => "budgets/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_budgets = Budget.where({ :id => the_id })

    @the_budget = matching_budgets.at(0)

    render({ :template => "budgets/show.html.erb" })
  end

  def create
    the_budget = Budget.new
    the_budget.budget = params.fetch("query_budget")
    the_budget.budget_type = params.fetch("query_budget_type")
    the_budget.business_travel_id = params.fetch("query_business_travel_id")

    if the_budget.valid?
      the_budget.save
      redirect_to("/budgets", { :notice => "Budget created successfully." })
    else
      redirect_to("/budgets", { :notice => "Budget failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_budget = Budget.where({ :id => the_id }).at(0)

    the_budget.budget = params.fetch("query_budget")
    the_budget.budget_type = params.fetch("query_budget_type")
    the_budget.business_travel_id = params.fetch("query_business_travel_id")

    if the_budget.valid?
      the_budget.save
      redirect_to("/budgets/#{the_budget.id}", { :notice => "Budget updated successfully."} )
    else
      redirect_to("/budgets/#{the_budget.id}", { :alert => "Budget failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_budget = Budget.where({ :id => the_id }).at(0)

    the_budget.destroy

    redirect_to("/budgets", { :notice => "Budget deleted successfully."} )
  end
end