class AddProvinceToRepositories < ActiveRecord::Migration
  def change
    add_column :repositories, :province, :string
  end
end
