class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.column :name, :string
      t.column :number, :int
      t.timestamps
    end
  end
end
