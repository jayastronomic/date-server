class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest
      t.integer :age
      t.date :birth_date
      t.string :bio
      

      t.timestamps
    end
  end
end
