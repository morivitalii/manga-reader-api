class Api::ChapterDecorator < Api::ApplicationDecorator
  decorates_association :content_language, with: Api::ContentLanguageDecorator
  decorates_association :book, with: Api::BookDecorator
  decorates_associations :pages, with: Api::PageDecorator
  decorates_association :user, with: Api::UserDecorator
  decorates_association :group, with: Api::GroupDecorator
  decorates_associations :resource_artists, with: Api::ResourceArtistDecorator
end
