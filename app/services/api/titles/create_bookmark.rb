class Api::Titles::CreateBookmark
  include ActiveModel::Model

  attr_accessor :title, :user
  attr_reader :bookmark

  def call
    ActiveRecord::Base.transaction do
      @bookmark = Bookmark.lock.where(user: user, resource: title).take

      if @bookmark.present?
        @bookmark.destroy!
      end

      @bookmark = Bookmark.create!(
        user: user,
        resource: title
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end