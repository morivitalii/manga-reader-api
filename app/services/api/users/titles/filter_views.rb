class Api::Users::Titles::FilterViews
  include ActiveModel::Model

  IDS_LIMIT = 100

  attr_accessor :scope, :filter
  attr_reader :views

  validate :validate_ids_size

  def call
    validate!

    if ids.present?
      scope.where!(resource_id: ids)
    else
      scope.order!(updated_at: :desc)
      scope.limit!(100)
    end

    @views = scope.all

    true
  rescue ActiveModel::ValidationError => _invalid
    false
  end

  def filter=(value)
    if value[:ids].present?
      @ids = value[:ids]&.compact&.map(&:to_i)&.uniq
    end
  end

  private

  attr_accessor :ids

  def validate_ids_size
    return if ids.blank?

    if ids.size > IDS_LIMIT
      errors.add(:ids, :invalid)
    end
  end
end
