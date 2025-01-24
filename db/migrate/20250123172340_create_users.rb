class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.datetime :birthdate
      t.string :password
      t.text :description
      t.binary :image

      t.timestamps
    end
  end
end
