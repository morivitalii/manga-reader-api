class Api::UpdateGroup
  include ActiveModel::Model

  attr_accessor :group, :title

  def call
    ActiveRecord::Base.transaction do
      group.update!(
        title: title
      )

      # To know if we need to update object in elasticsearch,
      # please take a look for attributes and associations in index schema
      Search::Indexing::UpdateObjectWorker.perform_async(group.class.name, group.id)
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end