class AddColumnToSubscribers < ActiveRecord::Migration[5.1]
  def change
    add_column :subscribers, :campaign_id, :integer
  end
end
