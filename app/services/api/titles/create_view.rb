class Api::Titles::CreateView
  include ActiveModel::Model

  attr_accessor :title, :user

  def call
    ActiveRecord::Base.transaction do
      view = View.lock.where(user: user, resource: title).take

      if view.present?
        view.update!(updated_at: Time.current)
      else
        View.create(
          user: user,
          resource: title
        )
      end
    end
  end
end