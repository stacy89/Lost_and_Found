class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username, {null: false, unique: true}
      t.string :first_name, {null: false}
      t.string :last_name, {null: false}
      t.string :location, {null: false}
      t.string :email, {null: false}
      t.string :password_hash

  		t.timestamps(null: false)
  	end
  end
end
