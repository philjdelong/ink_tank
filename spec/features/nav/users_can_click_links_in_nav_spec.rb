require 'rails_helper'

RSpec.describe "A visitor" do
   it "can click links in the nav bar" do
      visit "/"

      within "nav" do
         expect(page).to have_link("Register")
         expect(page).to have_link("Artists")
         expect(page).to have_link("Locations")
         click_link "Login"
      end
      expect(current_path).to eq("/")
   end
end