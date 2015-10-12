class RemoveTopidIdToReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :topic_id, :integer
  end
end
