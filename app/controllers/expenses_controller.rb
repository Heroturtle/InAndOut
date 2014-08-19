class ExpensesController < ApplicationController

def show
  @expense = Expense.find(params[:id])
end

def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to @expense, notice: 'Ausgabe wurde gebucht.'
    else
      render :new, alert: "Etwas ging falsch, genau spezifieren was"
    end
  end

  def edit
    load_expense
  end

  def update
    load_expense
    if @expense.update(expense_params)
      redirect_to @expense, notice: 'Ausgabe wurde aktualisiert'
    else
      render :edit, alert: "Etwas ging falsch, genau spezifieren was"
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
    params.require(:expense).permit(:invoice_number, :amount, :currency_code, :transaction_date, :payment_date, :description)
  end

end