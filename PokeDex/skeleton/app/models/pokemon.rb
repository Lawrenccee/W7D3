# == Schema Information
#
# Table name: pokemons
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  moves      :string           default([]), not null, is an Array
#  image_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pokemon < ApplicationRecord
  TYPES = [
    'fire',
    'electric',
    'normal',
    'ghost',
    'psychic',
    'water',
    'bug',
    'dragon',
    'grass',
    'fighting',
    'ice',
    'flying',
    'poison',
    'ground',
    'rock',
    'steel'
  ].sort.freeze

  validates :attack, :defense, :image_url, :name, :poke_type, presence: true
  validates :name, uniqueness: true
  validates :attack, :defense, numericality: true
  validates :poke_type, inclusion: { in: TYPES }
  validate :valid_url

  has_many :items

  def valid_url
    (image_url.include?("http") || has_asset?(image_url))
  end
end
