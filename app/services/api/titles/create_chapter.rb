class Api::Titles::CreateChapter
  include ActiveModel::Model

  attr_accessor :title, :user, :group_id, :volume_id, :name, :number
  attr_reader :chapter

  def call
    ActiveRecord::Base.transaction do
      @chapter = Chapter.new(
        name: name,
        status: :draft,
        number: number,
        title: title,
        user: user,
        group_id: group_id,
        volume_id: volume_id
      )

      @chapter.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
