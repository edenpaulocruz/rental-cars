require 'rails_helper'

feature 'Admin view car categories' do
  scenario 'successfully' do
    CarCategory.create!(name: 'A', daily_rate: 100)
    CarCategory.create!(name: 'B', daily_rate: 80)

    visit root_path
    click_on 'Categorias de carros'

    expect(page).to have_content('A')
    expect(page).to have_content(100)
    expect(page).to have_content('B')
    expect(page).to have_content(80)
  end

  scenario 'and view details' do
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
  end

  scenario 'and no car_categories are created' do
    visit root_path
    click_on 'Categorias de carro'

    expect(page).to have_content('Nenhuma categoria de carros cadastrada')
  end

  scenario 'and return to home page' do
    CarCategory.create!(name: 'A', daily_rate: 100)
    CarCategory.create!(name: 'B', daily_rate: 80)

    visit root_path
    click_on 'Categorias de carros'
    click_on 'Voltar'

    expect(current_path).to eq root_path
  end

  scenario 'and return to car categories page' do
    CarCategory.create!(name: 'A', daily_rate: 100, car_insurance: 60, third_part_insurance: 30)
    CarCategory.create!(name: 'B', daily_rate: 80, car_insurance: 48, third_part_insurance: 24)

    visit root_path
    click_on 'Ctegorias de carros'
    click_on 'B'
    click_on 'Voltar'

    expect(current_path).to eq car_categories_path
  end
end