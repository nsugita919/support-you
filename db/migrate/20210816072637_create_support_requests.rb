class CreateSupportRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :support_requests do |t|
      t.string :product_name
      t.text :contents
      t.string :status
      
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
