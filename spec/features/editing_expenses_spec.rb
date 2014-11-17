require 'spec_helper'

feature "Editing Expense" do 
	before do
		FactoryGirl.create(:expense)

		visit expenses_path
		click_link "No. #{expense.id}"
	end

	scenario "Updating an expense" do
		fill_in "Rechnungsbetrag", with: "721.32"
		click_button "Ausgabe aktualisieren"

		expect(page).to have_content("Ausgabe wurde aktualisiert.")
	end

	scenario "Updating an expense with invalid attributes" do
		fill_in "Rechnungsbetrag", with: ""

		expect(page).to have_content("Ausgabe konnte nicht aktualisiert werden.")
	end
end



