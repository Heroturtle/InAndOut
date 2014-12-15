class ExpensesController < ApplicationController

  def index
    scope = Expense.order(:id)
    scope = scope.only_deleted if params[:archived]
    scope = scope.page(params[:page])
    @expenses = scope
    respond_to do |format|
      format.html
      format.csv { send_data @expenses.to_csv }
    end
  end

  def show
    @expense = Expense.with_deleted.find(params[:id])
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
    if @expense.update(expense_params)
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