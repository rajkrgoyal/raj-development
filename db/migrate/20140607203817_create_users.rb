class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :tracking_code
      t.string :ip_address

      t.timestamps
    end
  end
end
