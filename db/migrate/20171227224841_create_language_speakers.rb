class CreateLanguageSpeakers < ActiveRecord::Migration
  def change
    create table :language_speakers do |t|
      t.integer :language_id
      t.integer :speaker_id
    end
  end
end
