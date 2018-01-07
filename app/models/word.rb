class Word < ActiveRecord::Base
  belongs_to :language
  has_many :speaker_words
  has_many :speakers, through: :speaker_words
end
