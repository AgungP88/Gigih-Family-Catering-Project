class Menu < ApplicationRecord
  belongs_to :category

  has_many :order_details
  has_many :orders, through: :order_details

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, numericality: true, comparison: {greater_than_or_equal_to: 0.01}

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end
end
