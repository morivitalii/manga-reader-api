class Api::Titles::Chapters::CreateView
  include ActiveModel::Model

  attr_accessor :chapter, :user

  def call
    ActiveRecord::Base.transaction do
      view = View.lock.where(user: user, resource: chapter).take

      if view.present?
        view.update!(updated_at: Time.current)
      else
        View.create(
          user: user,
          resource: chapter
        )
      end
    end
  end
end