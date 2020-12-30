# Locales
ActiveRecord::Base.transaction do
  # English locale
  @english_locale = Locale.create!(key: "en")

  # Russian locale
  @russian_locale = Locale.create!(key: "ru")
end

# Content languages
# Because content language model refers to itself this operations MUST be done in one transaction
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

# Interface languages
ActiveRecord::Base.transaction do
  Current.set(content_languages: @all_content_languages, content_language: @english_content_language) do
    I18n.with_locale(:en) do
      # English interface language with english translation
      @english_interface_language = InterfaceLanguage.new(locale: @english_locale, title: "English")
      @english_interface_language.save!

      # Russian interface language with english translation
      @russian_interface_language = InterfaceLanguage.new(locale: @russian_locale, title: "Russian")
      @russian_interface_language.save!
    end
  end

  Current.set(content_languages: @all_content_languages, content_language: @russian_content_language) do
    I18n.with_locale(:ru) do
      # Russian translations for english interface language
      @english_interface_language.assign_attributes(title: "Английский")
      @english_interface_language.save!

      # Russian translations for russian interface language
      @russian_interface_language.assign_attributes(title: "Русский")
      @russian_interface_language.save!
    end
  end
end

# Genres
ActiveRecord::Base.transaction do
  # Seed only with english content language
  Current.set(content_languages: @all_content_languages, content_language: @english_content_language) do
    I18n.with_locale(:en) do
      # Adventure genre
      @adventure_tag = Tag.new(key: :adventure, title: "Adventure")
      @adventure_tag.save

      @adventure_genre = Genre.create!(tag: @adventure_tag)

      # Drama genre
      @drama_tag = Tag.new(key: :drama, title: "Drama")
      @drama_tag.save

      @drama_genre = Genre.create!(tag: @drama_tag)
    end
  end
end

# Formats
ActiveRecord::Base.transaction do
  # Seed only with english content language
  Current.set(content_languages: @all_content_languages, content_language: @english_content_language) do
    I18n.with_locale(:en) do
      # Doujinshi format
      @doujinshi_tag = Tag.new(key: :doujinshi, title: "Doujinshi")
      @doujinshi_tag.save

      @doujinshi_format = Format.create!(tag: @doujinshi_tag)

      # Yonkoma format
      @yonkoma_tag = Tag.new(key: :yonkoma, title: "Yonkoma")
      @yonkoma_tag.save

      @yonkoma_format = Format.create!(tag: @yonkoma_tag)
    end
  end
end

# Demographics
ActiveRecord::Base.transaction do
  # Seed only with english content language
  Current.set(content_languages: @all_content_languages, content_language: @english_content_language) do
    I18n.with_locale(:en) do
      # Seinen demographic
      @seinen_tag = Tag.new(key: :seinen, title: "Seinen")
      @seinen_tag.save

      @seinen_demographic = Demographic.create!(tag: @seinen_tag)

      # Josei demographic
      @josei_tag = Tag.new(key: :josei, title: "Josei")
      @josei_tag.save

      @josei_demographic = Demographic.create!(tag: @josei_tag)
    end
  end
end

# Marks
ActiveRecord::Base.transaction do
  # Seed only with english content language
  Current.set(content_languages: @all_content_languages, content_language: @english_content_language) do
    I18n.with_locale(:en) do
      # Explicit mark
      @explicit_tag = Tag.new(key: :explicit, title: "Explicit")
      @explicit_tag.save

      @explicit_mark = Mark.create!(tag: @explicit_tag)
    end
  end
end