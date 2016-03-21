class AddAttachmentFileToGames < ActiveRecord::Migration
  def self.up
    change_table :games do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :games, :file
  end
end
