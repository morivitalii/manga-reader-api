class Api::Titles::Chapters::Pages::CreateView
  include ActiveModel::Model

  attr_accessor :page, :user

  def call
    ActiveRecord::Base.transaction do
      view = View.lock.where(user: user, resource: page).take

      if view.present?
        view.update!(updated_at: Time.current)
      else
        View.create(
          user: user,
          resource: page
        )
      end
    end
  end
end