class AddColumnAtArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :count, :integer
    add_column :articles, :isActive, :boolean
    add_column :articles, :check_active, :boolean
  end
end
