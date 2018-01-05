class SpeakerWord < ActiveRecord::Base
  belongs_to :speaker
  belongs_to :word
end
