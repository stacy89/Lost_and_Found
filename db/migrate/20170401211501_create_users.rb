class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username, {null: false, unique: true}
      t.string :first_name, {null: false}
      t.string :last_name, {null: false}
      t.string :location, {null: false}
      t.string :email, {null: false}
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at
      t.string :password_hash

  		t.timestamps(null: false)
  	end
  end
end
