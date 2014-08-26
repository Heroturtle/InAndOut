require 'spec_helper'

describe Expense do
	it { should validate_presence_of(:invoice_number) }
end	

it "creates a new expense"
  expense = FactoryGirl.create(:expense, invoice_number: "122448", )
end
