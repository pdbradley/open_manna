class AddActiveToSubscription < ActiveRecord::Migration
  def change
    add_column :subscriptions, :active, :boolean, null: false, default: false
  end
end
