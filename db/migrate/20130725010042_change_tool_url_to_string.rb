class ChangeToolUrlToString < ActiveRecord::Migration
  def self.up
  	change_table :tools do |t|
      t.change :url, :string
    end
  end
end
