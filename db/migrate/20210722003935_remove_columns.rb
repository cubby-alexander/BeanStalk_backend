class RemoveColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :roasts, :type
  end
end
