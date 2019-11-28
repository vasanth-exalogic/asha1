class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.date :datebirth
      t.date :datejoining
      t.numeric :age
      t.numeric :sal
      t.numeric :salpm
      t.numeric :contact
      t.string :bloodtype
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.numeric :pincode
      t.string :gender
      t.string :ename
      t.numeric :econtact
      t.string :pskill
      t.string :sskill
      t.string :sskill2
      t.numeric :notice
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
