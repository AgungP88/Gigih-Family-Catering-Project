require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with a name' do
    category = Category.new(
      name: 'Makanan'
    )

    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = Category.create(
      name: nil
    )

    category.valid?

    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'is invalid when name have less than or equal to 4 characters' do
    category = Category.create(
      name: 'tes'
    )

    category.valid?

    expect(category.errors[:name]).to include("is too short (minimum is 4 characters)")
  end
end
