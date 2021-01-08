require "rspec/expectations"

RSpec::Matchers.define :have_error do |error|
  match do |model|
    @actual = model.errors.where(attribute).map(&:type)

    model.errors.where(attribute, error).present?
  end

  chain :on, :attribute
  diffable

  failure_message do |_|
    "expected model to have error \"#{error}\" on \"#{attribute}\" attribute"
  end

  failure_message_when_negated do |_|
    "expected model to not have error \"#{error}\" on \"#{attribute}\" attribute"
  end
end
