class AddSentToReviewToTitles < ActiveRecord::Migration[6.1]
  def change
    add_column :titles, :sent_to_review_at , :datetime
  end
end
