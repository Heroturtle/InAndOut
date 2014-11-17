require 'spec_helper'

describe Expense do
  subject { build(:expense) }
  it { should be_valid }

  describe 'validations' do
    it { should validate_presence_of(:invoice_number) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:currency_code) }
    it { should validate_presence_of(:transaction_date) }
    it { should validate_presence_of(:payment_date) }
    it { should validate_presence_of(:category_id) }
    it { should validate_inclusion_of(:currency_code).in_array(CURRENCY_CODES) }
  end
end