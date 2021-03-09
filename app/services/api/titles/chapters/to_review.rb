class Api::Titles::Chapters::ToReview
  include ActiveModel::Model

  attr_accessor :chapter

  def call
    ActiveRecord::Base.transaction do
      chapter.update!(status: :review)
    end
  end
end