class AddPublishedToRoasts < ActiveRecord::Migration[6.1]
  def change
    add_column :roasts, :published, :boolean
  end
end
