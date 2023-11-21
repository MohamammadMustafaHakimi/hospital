class CreateEducations < ActiveRecord::Migration[7.1]
  def change
    create_table :educations do |t|
      t.string :university
      t.string :degree_name
      t.references :doctor, null: false, foreign_key: true
      t.integer :score

      t.timestamps
    end
  end
end
