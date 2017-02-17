class RemoveColumnFromCoktail < ActiveRecord::Migration[5.0]
  def change
    remove_column :cocktails, :photo_url, :string
  end
end
