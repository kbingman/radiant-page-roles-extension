class AddPageRoles < ActiveRecord::Migration
  def self.up
    add_column :pages, :role, :string
  end

  def self.down
    remove_column :pages, :role
  end
end
