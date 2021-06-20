class Api::BookDecorator < Api::ApplicationDecorator
  decorates_association :original_content_language, with: Api::ContentLanguageDecorator
  decorates_association :resource_artists, with: Api::ResourceArtistDecorator
  decorates_association :resource_tags, with: Api::ResourceTagDecorator
  decorates_association :volumes, with: Api::VolumeDecorator
end
