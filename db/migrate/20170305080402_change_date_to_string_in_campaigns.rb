class ChangeDateToStringInCampaigns < ActiveRecord::Migration[5.1]
  def change
  	change_column :campaigns, :activate_date, :string
  end
end
