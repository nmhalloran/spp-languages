class Language < ActiveRecord::Base
  has_many :language_speakers
  has_many :speakers, through: :language_speakers
  has_many :words

  def slug
    self.language_name.downcase.gsub(/[ ]/, "-")
  end

  def self.find_by_slug(name)
    self.all.detect do |object|
      object.slug == name
    end
  end
end
