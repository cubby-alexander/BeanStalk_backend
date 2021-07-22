class CreateRoasts < ActiveRecord::Migration[6.1]
  def change
    create_table :roasts do |t|
      t.string :name
      t.string :picture
      t.string :notes
      t.string :origin
      t.string :description
      t.references :roaster, null: false, foreign_key: true
      t.string :beanType
      t.string :productionDate

      t.timestamps
    end
  end
end
