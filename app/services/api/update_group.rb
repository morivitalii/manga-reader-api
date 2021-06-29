class Api::UpdateGroup
  include ActiveModel::Model

  attr_accessor :group, :title

  def call
    ActiveRecord::Base.transaction do
      group.update!(
        title: title
      )

      Search::Indexing::CreateWorker.perform_async(group.class.name, group.id)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end