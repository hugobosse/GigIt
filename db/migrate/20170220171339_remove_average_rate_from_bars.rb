class RemoveAverageRateFromBars < ActiveRecord::Migration[5.0]
  def change
    remove_column :bars, :Average_Rate, :integer
  end
end
