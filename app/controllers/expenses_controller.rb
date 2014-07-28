class ExpensesController < ApplicationController

	def index
		@expenses = Expense.order(updated_at: :desc).limit(25)
	end

	def new
		@expense = Expense.new
	end

	def create
		@expense = Expense.new(expense_params)
		if @expense.save
			flash[:success] = "Ausgabe wurde gebucht"
			redirect_to @expense
		else
			flash[:success] = "Etwas ging falsch, genau spezifieren was"
			render 'new'
		end
	end

	def show
		@expense = Expense.find(params[:id])
	end

	private

		def expense_params
			params.require(:expense).permit(:reference, :transaction_date, :lc_amount, :payment_date, :comments)
		end

end
