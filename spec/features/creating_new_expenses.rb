require 'spec_helper'

feature 'Creating Expense' do 
	before do
		visit 'expense_path'

		click_button 'Neue Ausgabe'
	end

  scenario "can create an expense" do
    fill_in 'invoice_number', with: '47293'
    fill_in 'transaction_date', with: '17.08.2014'
    fill_in 'Rechnungsbetrag', with: 7547.20
    fill_in 'Waehrung', with: CHF
    fill_in 'Zahlungsdatum', with: '31.08.2014'
    fill_in 'Beschreibung', with: 'Das ist eine neue Ausgabe zum anlegen'
    click_button 'Neue Ausgabe anlegen' 

    expect(page).to have_content('Ausgabe wurde gebucht.')

    expense = Expense.where(invoice_number: "47293").first

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