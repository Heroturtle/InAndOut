require 'spec_helper'

feature 'Expenses' do
  before do
    create(:category, name: 'Eis essen')
  end

  scenario 'CRUD' do
    visit expenses_path
    click_link 'Neue Ausgabe'
    expect(current_path).to eq new_expense_path

    # Create expense
    fill_in 'Rechnungsnummer', with: '47293'
    fill_in 'Rechnungsbetrag', with: '1234'
    fill_in 'Transaktionsdatum', with: '17.08.2014'
    fill_in 'Rechnungsbetrag', with: '7547.20'
    select 'CHF', from: 'Währung'
    select 'Eis essen', from: 'Kategorie'
    fill_in 'Zahlungsdatum', with: '31.08.2014'
    fill_in 'Beschreibung', with: 'Das ist eine neue Ausgabe zum anlegen'
    click_button 'Ausgabe erstellen'

    # View expense
    expense = Expense.last
    expect(current_path).to eq expense_path(expense)
    expect(page).to have_content 'Ausgabe wurde gebucht.'

    save_and_open_page

    # Update expense
    # ...

    # Destroy expense
    # ...
  end
end