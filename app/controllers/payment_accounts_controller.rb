class PaymentAccountsController < ApplicationController

	def index
		@payment_accounts = PaymentAccount.all
	end

	def show
		load_payment_account
	end

	def new
		@payment_account = PaymentAccount.new
	end

	def create
		@payment_account = PaymentAccount.new(payment_account_params)
		if @payment_account.save
			redirect_to @payment_account, notice: 'Zahlungskonto wurde erstellt.'
    else
      render :edit, alert: "Etwas ging falsch, genau spezifieren was"
		end
	end

	def edit
		load_payment_account
	end

	def update
		load_payment_account
    if @payment_account.update(payment_account_params)
      redirect_to @payment_account, notice: 'Zahlungskonto wurde aktualisiert'
    else
      render :edit, alert: "Etwas ging falsch, genau spezifieren was"
    end
  end

	def destroy
		load_payment_account
		@payment_account.destroy
		redirect_to payment_accounts_path, notice: 'Zahlungskonto wurde gelöscht.'
	# rescue ActiveRecord::DeleteRestrictionError
	# 	redirect_to @category, alert: "Mit dieser Kategorie sind Ausgaben verbunden. Sie kann daher nicht gelöscht werden."
	end

	private

		def load_payment_account
      @payment_account = PaymentAccount.find(params[:id])
    end

		def payment_account_params
			params.require(:payment_account).permit(:name, :description, :account_number, :text)
		end

end