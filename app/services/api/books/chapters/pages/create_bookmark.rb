class Api::Books::Chapters::Pages::CreateBookmark
  include ActiveModel::Model

  attr_accessor :page, :user
  attr_reader :bookmark

  def call
    ActiveRecord::Base.transaction do
      @bookmark = Bookmark.lock.where(user: user, resource: page).take

      if @bookmark.present?
        @bookmark.destroy!
      end

      @bookmark = Bookmark.create!(
        user: user,
        resource: page
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end