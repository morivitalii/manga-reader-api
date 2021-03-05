class Api::Titles::CreateView
  include ActiveModel::Model

  attr_accessor :title, :user
  attr_reader :view

  def call
    ActiveRecord::Base.transaction do
      @view = View.lock.where(user: user, resource: title).take

      if @view.present?
        @view.update!(updated_at: Time.current)
      else
        @view = View.create!(
          user: user,
          resource: title
        )
      end
    end
  end
end