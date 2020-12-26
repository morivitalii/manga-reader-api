# Locales

# English locale
@english_locale = Locale.create!(key: "en")

# Russian locale
@russian_locale = Locale.create!(key: "ru")

# Because content language model refers to itself this operations must be done in one transaction
ActiveRecord::Base.transaction do
  # English content language
  @english_content_language = ContentLanguage.new(locale: @english_locale)
  @english_content_language.save(validate: false)

  # Russian content language
  @russian_content_language = ContentLanguage.new(locale: @russian_locale)
  @russian_content_language.save(validate: false)

  # All content languages
  @all_content_languages = ContentLanguage.all

  Current.set(content_languages: @all_content_languages) do
    I18n.with_locale(:en) do
      # English translations for english content language
      @english_content_language.translations.build(
        resource: @english_content_language,
        content_language: @english_content_language,
        title: "English"
      )

      @english_content_language.save!

      # English translations for russian content language
      @russian_content_language.translations.build(
        resource: @russian_content_language,
        content_language: @english_content_language,
        title: "Russian"
      )

      @russian_content_language.save
    end
  end

  Current.set(content_languages: @all_content_languages) do
    I18n.with_locale(:ru) do
      # Russian translations for english content language
      @english_content_language.translations.build(
        resource: @english_content_language,
        content_language: @russian_content_language,
        title: "Английский"
      )

      @english_content_language.save!

      # Russian translations for russian content language
      @russian_content_language.translations.build(
        resource: @russian_content_language,
        content_language: @russian_content_language,
        title: "Русский"
      )

      @russian_content_language.save!
    end
  end
end
