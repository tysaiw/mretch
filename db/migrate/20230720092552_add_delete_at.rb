class AddDeleteAt < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :deleted_at, :datetime
  end
end
