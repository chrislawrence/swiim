require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'has correct default values' do
    card = Card.new
    expect(card.low_bgl).to eq 4
  end

  it 'can change the default value' do
    card = Card.new(low_bgl: 5)
    expect(card.low_bgl).to eq 5
  end

  it 'sets the units per exchange' do
  card = Card.new(units_per_exchange: 1)
  expect(card.units_per_exchange).to eq 1
  end

  it 'returns units of insulin given carb and bgl' do
    card = Card.new(units_per_exchange: 1, correction_factor: 0.1)
    expect(card.dose(1, 4.3)).to eq 1
  end

  it 'rounds to half units as expected' do
    card = Card.new(units_per_exchange: 1.75, correction_factor: 0.8)
    expect(card.dose(2,4)).to eq(3.5)
  end

  it 'rounds to whole units as expected' do
    card = Card.new(units_per_exchange: 1.75, correction_factor: 0.8, half_units: false)
    expect(card.dose(2,4)).to eq(3)
  end

  it 'reduces the dose for low bgl' do
    card = Card.new(units_per_exchange: 1, correction_factor: 0.1)
    expect(card.dose(1,2.9)).to eq 0
  end

  it 'adds correction for high bgl' do
    card = Card.new(units_per_exchange: 1, correction_factor: 1)
    expect(card.dose(1,9.5)).to eq 4
  end

  it 'displays an array of doses' do
    card = Card.new(units_per_exchange: 1.75, correction_factor: 0.8)
    expect(card.to_display(6)[1][4]).to eq 3.5
  end
end
