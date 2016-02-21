require 'rails_helper'

RSpec.feature "User deletes an artist" do
  scenario "they see index page without deleted artist after deleting and artist" do
    Artist.create(name: "John Lennon", image_path: "john-lennon.jpeg")

    visit artists_path

    expect(page).to have_content("John Lennon")

    click_link("John Lennon")
    click_button("Delete Artist")

    expect(page).to have_content("All Artists")
    expect(page).to have_no_content("John Lennon")
  end
end
