class CreateStudies < ActiveRecord::Migration[5.0]
  def change
    create_table :studies do |t|
      t.string :title
      t.text :description
      t.boolean :recruiting

      t.timestamps
    end
  end
end
