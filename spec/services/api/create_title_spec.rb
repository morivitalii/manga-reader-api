require "rails_helper"

RSpec.describe Api::CreateTitle do
  describe ".call" do
    it "does what it should" do
      original_content_language = create(:content_language)
      writers = create_list(:writer, 2)
      painters = create_list(:painter, 2)
      genres = create_list(:genre, 2)
      formats = create_list(:format, 2)
      demographics = create_list(:demographic, 2)
      marks = create_list(:mark, 2)
      themes = create_list(:theme, 2)

      service = described_class.new(
        title: "Title",
        description: "Description",
        publication_status: "ongoing",
        original_content_language_id: original_content_language.id,
        writer_ids: writers.map(&:id),
        painter_ids: painters.map(&:id),
        genre_ids: genres.map(&:id),
        format_ids: formats.map(&:id),
        demographic_ids: demographics.map(&:id),
        mark_ids: marks.map(&:id),
        theme_ids: themes.map(&:id)
      )

      result = service.call

      expect(result).to be_truthy
      expect(service.title_object.status).to eq("draft")
      expect(Title.count).to eq(1)
    end
  end
end
