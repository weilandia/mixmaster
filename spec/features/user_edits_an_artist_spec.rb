require 'rails_helper'

RSpec.feature "User edits an artist" do
  scenario "they see update artist page after editing" do
    Artist.create(name: "John Lennon", image_path: "john-lennon.jpeg")

    visit artists_path
    click_link("John Lennon")
    click_link("Edit Artist")
    fill_in("Name", :with => "Hacked!")
    click_button("Update")

    expect(page).to have_content("Hacked!")
  end
end
