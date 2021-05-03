ActiveRecord::Base.transaction do
  # Access rights

  # Manage site settings right
  AccessRight.create!(key: :manage_settings)

  # Manage titles access right
  AccessRight.create!(key: :manage_titles)

  # Group access rights

  # Manage group access right
  GroupAccessRight.create!(key: :manage_group)

  # Manage group users access right
  AccessRight.create!(key: :manage_users)

  # Manage group chapters right
  AccessRight.create!(key: :manage_chapters)


  # Russian locale
  russian_locale = Locale.create!(key: "ru")

  # Russian content language
  unless ContentLanguage.where(locale: russian_locale).exists?
    @russian_content_language = ContentLanguage.new(locale: russian_locale)
    @russian_content_language.save(validate: false)

    @russian_content_language.translations.build(
      resource: @russian_content_language,
      content_language: @russian_content_language,
      title: "Русский"
    )

    @russian_content_language.save!
  end

  # Russian interface language
  unless InterfaceLanguage.where(locale: russian_locale).exists?
    @russian_interface_language = InterfaceLanguage.new(locale: russian_locale, title: "Русский")
    @russian_interface_language.save!
  end

  current_options = {
    content_languages: ContentLanguage.all,
    interface_languages: InterfaceLanguage.all,
    content_language: @russian_content_language,
    interface_language: @russian_interface_language
  }

  Current.set(current_options) do
    # Genres
    genres = [
      {
        key: :action,
        title: "Экшен"
      },
      {
        key: :adventure,
        title: "Приключение"
      },
      {
        key: :comedy,
        title: "Комедия"
      },
      {
        key: :drama,
        title: "Драма"
      },
      {
        key: :slice_of_life,
        title: "Повседневность"
      },
      {
        key: :fantasy,
        title: "Фэнтези"
      },
      {
        key: :magic,
        title: "Магия"
      },
      {
        key: :supernatural,
        title: "Сверхъестественное"
      },
      {
        key: :horror,
        title: "Ужасы"
      },
      {
        key: :psychological,
        title: "Психология"
      },
      {
        key: :romance,
        title: "Романтика"
      },
      {
        key: :sci_fi,
        title: "Фантастика"
      },
      {
        key: :cyberpunk,
        title: "Киберпанк"
      },
      {
        key: :harem,
        title: "Гарем"
      },
      {
        key: :martial_arts,
        title: "Боевые искуства"
      },
      {
        key: :historical,
        title: "История"
      },
      {
        key: :isekai,
        title: "Исекай"
      },
      {
        key: :mecha,
        title: "Меха"
      },
      {
        key: :music,
        title: "Музыка"
      },
      {
        key: :sports,
        title: "Спорт"
      },
      {
        key: :tragedy,
        title: "Трагедия"
      },
      {
        key: :ecchi,
        title: "Эччи"
      },
      {
        key: :yuri,
        title: "Юри"
      },
      {
        key: :yaoi,
        title: "Яой"
      }
    ]

    genres.each do |genre|
      tag = Tag.new(key: genre[:key], title: genre[:title])
      tag.save

      Genre.create!(tag: tag)
    end

    # Formats
    formats = [
      {
        key: :manga,
        title: "Манга"
      },
      {
        key: :manhwa,
        title: "Манхва"
      },
      {
        key: :manhua,
        title: "Маньхуа"
      },
      {
        key: :comic,
        title: "Комикс"
      },

    ]

    formats.each do |formats|
      tag = Tag.new(key: formats[:key], title: formats[:title])
      tag.save

      Format.create!(tag: tag)
    end

    # Marks
    marks = [
      {
        key: :explicit,
        title: "18+"
      }
    ]

    marks.each do |mark|
      tag = Tag.new(key: mark[:key], title: mark[:title])
      tag.save

      Mark.create!(tag: tag)
    end

    # Demographics
    # TODO

    # Themes
    # TODO
  end
end
