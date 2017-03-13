class ChangeColumnInCampaigns < ActiveRecord::Migration[5.1]
  def change
  	change_column :campaigns, :start_date, :duration
  	remove_column :campaigns, :end_date
  end
end
