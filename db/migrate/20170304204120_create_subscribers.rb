class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.string :email
      t.string :referral_code
      t.string :referred_by
      t.string :name

      t.timestamps
    end
  end
end
