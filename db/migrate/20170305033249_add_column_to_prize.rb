class AddColumnToPrize < ActiveRecord::Migration[5.1]
  def change
    add_column :prizes, :campaign_id, :integer
  end
end
