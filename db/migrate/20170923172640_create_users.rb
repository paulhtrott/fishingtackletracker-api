class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: true, unique: true
      t.string :encrypted_password, null: false

      t.string :name
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state
      t.string :country
      t.string :zipcode

      t.string   :reset_password_token, unique: true
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end
  end
end
