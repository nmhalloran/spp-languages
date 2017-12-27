class Language < ActiveRecord::Base
  has_many :speakers
  has_many :language_words
  has_many :words, through: :language_words

end
