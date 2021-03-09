# frozen_string_literal: true

class DocumentationsController < ActionController::Base
  protect_from_forgery with: :exception
  layout false
  helper_method :schema

  def index
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  SCHEMAS_PATH = "spec/support/schemas"
  API_SCHEMAS_PATH = "controllers/api"

  def schema(file_path)
    absolute_file_path = Rails.root.join(SCHEMAS_PATH, API_SCHEMAS_PATH, "#{file_path}.json")
    file_content = File.read(absolute_file_path)
    schema_hash = JSON.parse(file_content)

    replace_schema_references(schema_hash)

    schema_hash.to_json.html_safe
  end

  def replace_schema_references(schema_hash)
    schema_hash.extend(Hashie::Extensions::DeepLocate)
    references = schema_hash.deep_locate ->(key, _value, _object) { key == "$ref" }

    references.each do |reference|
      reference["$ref"].sub!("file:/", "").sub!("#", "")
      reference_file_path = Rails.root.join(SCHEMAS_PATH, reference["$ref"])
      reference_file_content = File.read(reference_file_path)
      reference_schema_hash = JSON.parse(reference_file_content)

      replace_schema_references(reference_schema_hash)

      reference.replace(reference_schema_hash)
    end
  end
end
