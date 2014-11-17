require 'spec_helper'

describe Expense do
  it "has a valid factory" do
    expect(FactoryGirl.build(:expense)).to be_valid
  end
  
  it "is invalid without an invoice number" do
    expense = FactoryGirl.build(:expense, invoice_number: nil)
    expense.valid?
    expect(expense.errors[:invoice_number].to include("Rechnungsnummer muss ausgefüllt werden."))
  end

  it "is invalid without an amount" do
    expense = FactoryGirl.build(:expense, invoice_amount: nil)
    expense.valid?
    expect(expense.errors[:invoice_amount].to include("Betrag muss ausgefüllt werden."))
  end

  it "is invalid without a currency" do
    expense = FactoryGirl.build(:expense, currency: nil)
    expense.valid?
    expect(expense.errors[:currency].to include("Währung muss ausgefüllt werden."))
  end

  it "is invalid without a currency" do
    expense = FactoryGirl.build(:expense, invoice_date: nil)
    expense.valid?
    expect(expense.errors[:invoice_date].to include("Rechnungsdatum muss ausgefüllt werden."))
  end

  it "is invalid without a currency" do
    expense = FactoryGirl.build(:expense, payment_date: nil)
    expense.valid?
    expect(expense.errors[:payment_date].to include("Zahlungsdatum muss ausgefüllt werden."))
  end
end