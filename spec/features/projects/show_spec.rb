require "rails_helper"

#As a visitor,
#When I visit a project's show page ("/projects/:id"),
#I see that project's name and material
#And I also see the theme of the challenge that this project belongs to.
#(e.g.    Litfit
  #  Material: Lamp Shade
  #Challenge Theme: Apartment Furnishings)
RSpec.describe("projects show page") do
  it("i see that specific projects name,material and theme") do
    recycled_material_challenge = Challenge.create(    theme: "Recycled Material",     project_budget: 1000)
    news_chic = recycled_material_challenge.projects.create(    name: "News Chic",     material: "Newspaper")
    jay = Contestant.create(    name: "Jay McCarroll",     age: 40,     hometown: "LA",     years_of_experience: 13)
    gretchen = Contestant.create(    name: "Gretchen Jones",     age: 36,     hometown: "NYC",     years_of_experience: 12)
    kentaro = Contestant.create(    name: "Kentaro Kameyama",     age: 30,     hometown: "Boston",     years_of_experience: 8)
    ContestantProject.create(    contestant_id: jay.id,     project_id: news_chic.id)
    ContestantProject.create(    contestant_id: gretchen.id,     project_id: news_chic.id)
    visit("/projects/#{news_chic.id}")
    expect(page).to(have_content("News Chic"))
    expect(page).to(have_content("Newspaper"))
    expect(page).to(have_content("Recycled Material"))
  end
end
