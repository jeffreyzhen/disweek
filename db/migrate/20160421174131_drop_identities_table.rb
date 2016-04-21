class DropIdentitiesTable < ActiveRecord::Migration
  def up
    drop_table :identities
  end

  def down
    create_table :identities do |t|
      t.references :user, index: true, foreign_key: true
      t.string :provider
      t.string :accesstoken
      t.string :uid
      t.string :name
      t.string :email
      t.string :image
      t.string :urls

      t.timestamps null: false
    end
  end
end
