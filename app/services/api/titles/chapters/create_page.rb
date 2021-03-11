class Api::Titles::Chapters::CreatePage
  include ActiveModel::Model

  attr_accessor :chapter, :user, :number, :file
  attr_reader :page

  def call
    ActiveRecord::Base.transaction do
      @page = Page.new(
        number: number,
        file: file,
        chapter: chapter,
        user: user
      )

      @page.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
