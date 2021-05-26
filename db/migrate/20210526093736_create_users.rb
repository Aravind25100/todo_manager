class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
      t.text :password
    end
  end
end
