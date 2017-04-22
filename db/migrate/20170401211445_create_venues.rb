class CreateVenues < ActiveRecord::Migration
  def change
  	create_table :venues do |t|
  		t.string :username, {null: false}
  		t.string :name, {null: false}
  		t.string :location, {null: false}
  		t.string :email, {null: false}
  		t.string :password_hash

  		t.timestamps ({null: false})
  	end
  end
end
