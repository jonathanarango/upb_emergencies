class DeviseCreateSystemUsers < ActiveRecord::Migration
  def self.up
    create_table(:system_users) do |t|
      t.database_authenticatable :null => false
      #t.confirmable
      t.recoverable
      t.rememberable
      t.trackable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both

      t.timestamps
    end

    add_index :system_users, :email,                :unique => true
    #add_index :system_users, :confirmation_token,   :unique => true
    add_index :system_users, :reset_password_token, :unique => true
    # add_index :system_users, :unlock_token,         :unique => true
  end

  def self.down
    drop_table :system_users
  end
end
