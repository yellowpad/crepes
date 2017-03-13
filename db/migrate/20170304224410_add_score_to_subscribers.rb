class AddScoreToSubscribers < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribers, :score, :integer, default: 1
  end
end