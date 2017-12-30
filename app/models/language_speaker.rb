class LanguageSpeaker < ActiveRecord::Base
  belongs_to :language
  belongs_to :speaker
end
