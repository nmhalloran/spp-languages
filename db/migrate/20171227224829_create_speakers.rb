class CreateSpeakers < ActiveRecord::Migration
  def change
    create table :speakers do |t|
      t.string :name
  end
end
