class Api::VolumeDecorator < Api::ApplicationDecorator
  decorates_association :title, with: Api::TitleDecorator
end
