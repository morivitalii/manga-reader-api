class Api::Users::UpdateSettings
  include ActiveModel::Model

  attr_accessor :user_setting, :name, :surname, :sex, :avatar, :interface_language_id, :content_language_ids, :excluded_tag_ids

  def call
    ActiveRecord::Base.transaction do
      user_setting.update!(
        interface_language_id: interface_language_id,
        name: name,
        surname: surname,
        sex: sex,
        avatar: avatar
      )

      user_setting.user.update!(
        content_language_ids: content_language_ids,
        excluded_tag_ids: excluded_tag_ids
      )
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end
end
