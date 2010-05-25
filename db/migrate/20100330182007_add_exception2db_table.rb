class AddException2dbTable < ActiveRecord::Migration

  def self.up
    create_table :exception2dbs do |t|
      t.text :exception

      t.timestamps
    end
  end

  def self.down
    drop_table :exception2dbs
  end

end
