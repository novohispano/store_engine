class DeleteCategoriesFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :category_id
  end
end
