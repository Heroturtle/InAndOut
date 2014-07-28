class ExpensesController < ApplicationController

  def index
    @expenses = Expense.order(updated_at: :desc).limit(25)
  end

  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to @expense, notice: 'Ausgabe wurde gebucht'
    else
      flash[:alert] = "Etwas ging falsch, genau spezifieren was"
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:reference, :transaction_date, :lc_amount, :payment_date, :comments)
  end

end
