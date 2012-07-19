class CreateRepositories < ActiveRecord::Migration
  def change
    create_table :repositories do |t|
      t.string :name
      t.string :city
      t.string :country
      t.string :address
      t.string :postal
      t.string :website
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
