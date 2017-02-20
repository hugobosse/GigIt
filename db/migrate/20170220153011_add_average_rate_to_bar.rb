class AddAverageRateToBar < ActiveRecord::Migration[5.0]
  def change
    add_column :bars, :Average_Rate, :integer
  end
end
