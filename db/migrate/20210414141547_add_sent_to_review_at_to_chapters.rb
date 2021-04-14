class AddSentToReviewAtToChapters < ActiveRecord::Migration[6.1]
  def change
    add_column :chapters, :sent_to_review_at, :datetime
  end
end
