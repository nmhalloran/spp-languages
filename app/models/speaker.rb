class Speaker < ActiveRecord::Base
  has_many :languages
  has_many :words, through: :languages

end
