require 'spec_helper'

feature "Viewing expenses" do
	expense = FactoryGirl.create(:expense)
	visit '/'
	# click_link "No. #{expense.id}"
	click_link 'No. 1'
	expect(page.current_url).to eql(expense_url(expense))
end
