class Speaker < ActiveRecord::Base
  has_secure_password
  has_many :language_speakers
  has_many :languages, through: :language_speakers
  has_many :speaker_words
  has_many :words, through: :speaker_words

end
