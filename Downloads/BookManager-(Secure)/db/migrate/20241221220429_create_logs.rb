class CreateLogs < ActiveRecord::Migration[7.2]
  def change
    create_table :logs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :action
      t.text :details

      t.timestamps
    end
  end
end
