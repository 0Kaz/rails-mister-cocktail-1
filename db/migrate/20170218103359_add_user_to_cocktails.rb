class AddUserToCocktails < ActiveRecord::Migration[5.0]
  def change
    add_reference :cocktails, :user, index: true
    add_foreign_key :cocktails, :users
  end
end
