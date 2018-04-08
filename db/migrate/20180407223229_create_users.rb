class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :bio
      t.string :title
      t.boolean :host

      t.timestamps
    end
  end
end
