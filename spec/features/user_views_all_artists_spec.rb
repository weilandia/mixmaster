require 'rails_helper'

RSpec.feature "User views artists index" do
  scenario "they see all artists with links to each artists' show page" do
    Artist.create(name: "John Lennon", image_path: "john-lennon.jpeg")

    Artist.create(name: "Biz Markie", image_path: "biz-markie.jpeg")

    Artist.create(name: "Jay-Z", image_path: "jay-z.jpeg")

    visit artists_path

    expect(page).to have_content "John Lennon"
    expect(page).to have_content "Biz Markie"
    expect(page).to have_content "Jay-Z"

    find_link("John Lennon", :visible => :all).visible?
  end
end

# require 'rails_helper'
#
# RSpec.feature "User submits a new artist" do
#   scenario "they see the page for the individual artist" do
#     artist_name       = "Bob Marley"
#     artist_image_path = "http://cps-static.rvicorp.com/3/JPG_400/MI0003/146/MI0003146038.jpg"
#
#     visit   artists_path
#     click_on "New artist"
#     fill_in "artist_name", with: artist_name
#     fill_in "artist_image_path", with: artist_image_path
#     click_on "Create Artist"
#
#     expect(page).to have_content artist_name
#     expect(page).to have_css("img[src=\"#{artist_image_path}\"]")
#   end
