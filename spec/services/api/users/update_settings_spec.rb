require "rails_helper"

RSpec.describe Api::Users::UpdateSettings do
  describe ".call" do
    it "does what it should" do
      user = create(:user)
      user_setting = create(:user_setting, user: user)
      interface_language = create(:interface_language)
      content_languages = create_list(:content_language, 2)
      tags = create_list(:tag, 2)

      service = described_class.new(
        user_setting: user_setting,
        name: "Name",
        surname: "Surnameother",
        sex: "other",
        content_language_ids: content_languages.map(&:id),
        excluded_tag_ids: tags.map(&:id),
        interface_language_id: interface_language.id
      )

      result = service.call

      expect(result).to be_truthy
      expect(user.user_setting.interface_language).to eq(interface_language)
      expect(user.content_languages).to eq(content_languages)
      expect(user.user_excluded_tags.map(&:tag)).to eq(tags)
    end
  end
end
