class Api::Users::SettingsController < Api::ApplicationController
  skip_after_action :verify_policy_scoped, only: [:show, :update]

  before_action -> { authorize(Api::Users::SettingsPolicy) }, only: [:show, :update]
  before_action :set_user, only: [:show, :update]
  before_action :set_user_setting, only: [:show, :update]

  def show
    cache_key = cache_key(@user_setting)

    user_setting = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @user_setting, [
          avatar_attachment: :blob,
          user: {
            excluded_tags: Tag.translations_associations,
            content_languages: [
              ContentLanguage.translations_associations,
              :locale
            ]
          },
          interface_language: [
            InterfaceLanguage.translations_associations,
            :locale
          ]
        ]
      )

      user_setting = Api::UserSettingDecorator.decorate(@user_setting)

      Api::UserSettingSerializer.serialize(user_setting).to_json
    end

    render json: user_setting, status: 200
  end

  def update
    service = Api::Users::UpdateSettings.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.user_setting, [
          avatar_attachment: :blob,
          user: {
            excluded_tags: Tag.translations_associations,
            content_languages: [
              ContentLanguage.translations_associations,
              :locale
            ]
          },
          interface_language: [
            InterfaceLanguage.translations_associations,
            :locale
          ]
        ]
      )

      user_setting = Api::UserSettingDecorator.decorate(service.user_setting)
      user_setting = Api::UserSettingSerializer.serialize(user_setting)

      render json: user_setting, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  private

  def update_params
    permitted_attributes(Api::Users::SettingsPolicy, :update).merge!(user_setting: @user_setting)
  end

  def set_user
    @user = Current.user
  end

  def set_user_setting
    @user_setting = @user.user_setting
  end
end
