class Language < ActiveRecord::Base
  has_many :language_speakers
  has_many :speakers, through: :language_speakers
  has_many :words
end
