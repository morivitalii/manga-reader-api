class Api::Books::Chapters::CreatePage
  include ActiveModel::Model

  attr_accessor :chapter, :user, :number, :file
  attr_reader :page

  def call
    ActiveRecord::Base.transaction do
      @page = Page.create!(
        number: number,
        file: file,
        chapter: chapter,
        user: user
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
