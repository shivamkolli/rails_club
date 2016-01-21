class AddColumnMobileAddressOnUsers < ActiveRecord::Migration
  def change
  	add_column :users, :mobile, :string
  	add_column :users, :address, :string
  end
end
