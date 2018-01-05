class CreateSpeakerWords < ActiveRecord::Migration
  def change
    create_table :speaker_words do |t|
      t.integer :speaker_id
      t.integer :word_id
    end
  end
end
