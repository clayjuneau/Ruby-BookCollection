class ChangePublishedDateToBeDateInBooks < ActiveRecord::Migration[6.0]
  def change
    change_column :books, :published_date, 'date USING CAST(published_date AS date)'
  end
end
