class Category < ApplicationRecord
  has_many :menus

  validates :name, presence: true, uniqueness: true

  def self.by_letter(letter)
    where("name LIKE ?", "#{letter}%").order(:name)
  end
end
