class AddAttachmentTopicImgToTopics < ActiveRecord::Migration
  def self.up
    change_table :topics do |t|
      t.attachment :topic_img
    end
  end

  def self.down
    remove_attachment :topics, :topic_img
  end
end
