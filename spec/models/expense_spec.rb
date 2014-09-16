require 'spec_helper'

describe Expense do
	subject(:expense) { FactoryGirl.create(:expense) }
	it { should validate_presence_of(:invoice_number) }
end