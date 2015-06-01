class CreatePapers < ActiveRecord::Migration
  def change
    create_table :papers do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
  end
end
