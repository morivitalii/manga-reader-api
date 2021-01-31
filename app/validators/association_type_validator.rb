class AssociationTypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.in?(options[:in])
      record.errors.add(attribute, :inclusion)
    end
  end
end