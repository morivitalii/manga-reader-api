class Api::Titles::Chapters::CreateView
  include ActiveModel::Model

  attr_accessor :chapter, :user
  attr_reader :view

  def call
    ActiveRecord::Base.transaction do
      @view = View.lock.where(user: user, resource: chapter).take

      if @view.present?
        @view.update!(updated_at: Time.current)
      else
        @view = View.create!(
          user: user,
          resource: chapter
        )
      end
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end