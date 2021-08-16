class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :company_name
      t.string :email
      t.string :password_digest
      t.boolean :admin_flg

      t.timestamps
    end
  end
end
