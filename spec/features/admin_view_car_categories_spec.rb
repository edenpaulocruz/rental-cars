require 'rails_helper'

feature 'Admin view car categories and return to home page' do
  scenario 'successfully' do
    CarCategory.create!(name: 'A', daily_rate: 100)
    CarCategory.create!(name: 'B', daily_rate: 80)

    visit root_path
    click_on 'Categorias de carros'

    expect(page).to have_content('A')
    expect(page).to have_content(100)
    expect(page).to have_content('B')
    expect(page).to have_content(80)

    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and view details, and return to car categories page' do
    CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 60, third_part_insurance: 30)
    CarCategory.create!(name: 'B', daily_rate: 80, car_insurance: 48, third_part_insurance: 24)

    visit root_path
    click_on 'Categorias de carros'
    click_on 'A'

    expect(page).to have_content('A')
    expect(page).to have_content(100)
    expect(page).to have_content(50)
    expect(page).to have_content(30)
    expect(page).to have_content('B')
    expect(page).to have_content(80)
    expect(page).to have_content(48)
    expect(page).to have_content(24)

    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end

  scenario 'and no car categories created' do
    visit root_path
    click_on 'Categorias de carro'

    expect(page).to have_content('Nenhuma categoria de carros cadastrada')
  end

end