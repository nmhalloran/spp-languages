class CreateWords < ActiveRecord::Migration
  def change
    create table :words do |t|
      t.string :word
      t.integer :language_id
    end
  end
end