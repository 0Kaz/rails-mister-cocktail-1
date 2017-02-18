class AddUserIdToCocktails < ActiveRecord::Migration[5.0]
  def change
    remove_reference :cocktails, :user, foreign_key: true
  end
end
