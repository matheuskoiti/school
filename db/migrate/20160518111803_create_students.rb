class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :status
      t.string :name
      t.string :register_number

      t.timestamps
    end
  end
end
