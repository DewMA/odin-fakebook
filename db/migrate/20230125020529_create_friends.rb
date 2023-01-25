class CreateFriends < ActiveRecord::Migration[7.0]
  def change
    create_table :friends do |t|
      t.references :requester
      t.references :reciever
      t.decimal :status

      t.timestamps
    end

    add_foreign_key :friends, :users, :column => :requester_id, primary_key: :id
    add_foreign_key :friends, :users, :column => :reciever_id, primary_key: :id
  end
end
