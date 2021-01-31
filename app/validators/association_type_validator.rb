class AssociationTypeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.class.name.in?(options[:in])
      record.errors.add(attribute, :inclusion)
    end
  end
end