class AddDefaultValueToCampaigns < ActiveRecord::Migration[5.1]
  def change
  	change_column :campaigns, :duration, :integer, default: 30
  end
end
