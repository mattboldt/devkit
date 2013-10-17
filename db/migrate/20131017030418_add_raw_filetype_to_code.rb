class AddRawFiletypeToCode < ActiveRecord::Migration
  def change
  	add_column :codes, :filetype, :string, :default => "txt"
  end
end
