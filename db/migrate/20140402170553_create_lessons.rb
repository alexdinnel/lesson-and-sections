class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.column :name, :string
      t.column :text, :string
      t.timestamps
    end
  end
end
