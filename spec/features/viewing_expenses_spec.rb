require 'spec_helper'

feature "Viewing expenses" do
	# Setup
	# person = create(:person, first_name: 'Manfred')
	# visit people_path

	# Teste Liste
	# expect(page).to have_content('Manfred')

	# Test Show View
	# click_link 'Manfred'
	# expect(current_path).to eq(person_path(person))
	# expect(page).to have_content('Manfred')

	# Edit person
	# click_link 'Bearbeiten'
    # expect(current_path).to eq(edit_person_path(person))

	scenario do
		expense = FactoryGirl.create(:expense)
		visit '/'
		# click_link "No. #{expense.id}"
		click_link 'No. 1'
		expect(page.current_url).to eql(expense_url(expense))
	end
end

feature "CRUD people" do

end	