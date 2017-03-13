class AddActivateDateToCampaigns < ActiveRecord::Migration[5.1]
  def change
    add_column :campaigns, :activate_date, :datetime
  end
end
