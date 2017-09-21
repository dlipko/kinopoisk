class AddRatingLimitInRewiev < ActiveRecord::Migration[5.0]
  def change
  	change_column :reviews, :rating, :integer, limit: 5
  	change_column :reviews, :rating, :integer, decimal: 1
  end
end
