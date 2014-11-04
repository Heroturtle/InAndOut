class ExpensesController < ApplicationController

  def index
    @expenses = Expense.order("id").page(params[:page]).per_page(3)
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new(expense_params)
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to @expense, notice: 'Ausgabe wurde gebucht.'
    else
      render :new
    end
  end

  def edit
    load_expense
  end

  def update
    load_expense
    if @expense.update(revenue_params)
      redirect_to @expense, notice: 'Ausgabe wurde aktualisiert.'
    else
      render :edit, notice: 'Ausgabe konnte nicht aktualisiert werden.'
    end
  end

  def destroy
    load_expense
    @expense.destroy
    redirect_to expenses_path, notice: 'Ausgabe wurde gelöscht'
  end

  private

    def load_expense
      @expense = Expense.find(params[:id])
    end

    def expense_params
      expense_params = params[:expense] || ActionController::Parameters.new
      expense_params.permit(Expense.permitted_params)
    end

end