class Api::Titles::ToReview
  include ActiveModel::Model

  attr_accessor :title

  def call
    ActiveRecord::Base.transaction do
      title.update!(status: :review)
    end
  end
end