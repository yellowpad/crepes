class RemoveColumnFromCampaigns < ActiveRecord::Migration[5.1]
  def change
  	remove_column :campaigns, :start_date
  end
end
