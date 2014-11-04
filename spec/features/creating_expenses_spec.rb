require 'spec_helper'

feature 'Creating Expense' do 
	before do
		visit 'expense_path'
    visit expenses_path

    save_and_open_page

    click_link 'Neue Ausgabe'
	end

  scenario "can create an expense" do
    expect(current_path).to eq new_expense_path

    fill_in 'Rechnungsnummer', with: '47293'
    fill_in 'Rechnungsbetrag', with: '1234'
    fill_in 'transaction_date', with: '17.08.2014'
    fill_in 'Rechnungsbetrag', with: 7547.20
    fill_in 'Währung', with: 'CHF'
    fill_in 'Zahlungsdatum', with: '31.08.2014'
    fill_in 'Beschreibung', with: 'Das ist eine neue Ausgabe zum anlegen'
    click_button 'Ausgabe erstellen' 

    expense = Expense.last
    expect(current_path).to eq expense_path(expense)
    expect(page).to have_content('Ausgabe wurde gebucht.')
    expect(page.current_url).to eql(expense_url(expense))

    title = "InAndOut | Neue Ausgabe anlegen"
    expect(page).to have_title(title)
  end

  scenario "can not create an expense without data" do
  	click_button 'Neue Ausgabe anlegen'

  	expect(page).to have_content("Rechnungsnummer muss ausgefüllt werden")
  	expect(page).to have_content("Betrag muss ausgefüllt werden")
    expect(page).to have_content("Waehrung muss ausgefüllt werden")
    expect(page).to have_content("Transaktionsdatum muss ausgefüllt werden")
    expect(page).to have_content("Zahlungsdatum muss ausgefüllt werden")
	end
end