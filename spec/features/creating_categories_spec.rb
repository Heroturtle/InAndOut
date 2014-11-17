require 'spec_helper'

feature 'Creating Category' do 
	before do
    visit settings_path
		visit categories_path

    #save_and_open_page

    click_link 'Neue Kategorie'
	end

  scenario "can create a category" do
    expect(current_path).to eq new_category_path

    fill_in 'Name', with: 'Autokosten'
    fill_in 'Beschreibung', with: 'Autoversicherung, Benzin, Reparaturen usw.'
    
    click_button 'Kategorie erstellen' 

    category = Category.last
    expect(current_path).to eq category_path(category)
    expect(page).to have_content('Kategorie wurde erstellt.')
    expect(page.current_url).to eql(category_url(category))

    title = "InAndOut | Neue Kategorie anlegen"
    expect(page).to have_title(title)
  end

  scenario "can not create an expense without data" do
  	click_button 'Kategorie erstellen'

  	expect(page).to have_content("Name muss ausgefüllt werden.")
	end
end