class Api::UserDecorator < Api::ApplicationDecorator
  decorates_association :user_setting, with: Api::UserSettingDecorator
end
