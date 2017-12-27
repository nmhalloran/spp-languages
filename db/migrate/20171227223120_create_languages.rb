class CreateLanguages < ActiveRecord::Migration
  def change
    create table :languages do |t|
      t.string :language_name
  end
end
