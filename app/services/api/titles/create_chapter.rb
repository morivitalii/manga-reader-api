class Api::Titles::CreateChapter
  include ActiveModel::Model

  attr_accessor :title, :user, :content_language_id, :group_id, :volume_id, :name, :number,
    :cleaner_ids, :translator_ids, :editor_ids, :typer_ids

  attr_reader :chapter

  def call
    ActiveRecord::Base.transaction do
      @chapter = Chapter.new(
        name: name,
        status: :draft,
        number: number,
        title: title,
        user: user,
        content_language_id: content_language_id,
        group_id: group_id,
        volume_id: volume_id,
        cleaners: cleaners,
        translators: translators,
        editors: editors,
        typers: typers
      )

      @chapter.save!
    end

    true
  rescue ActiveRecord::RecordInvalid => invalid
    errors.merge!(invalid.record.errors)

    false
  end

  private

  def user_ids
    @user_ids ||= [cleaner_ids, translator_ids, editor_ids, typer_ids].compact.flatten.uniq
  end

  def users
    @users ||= User.includes(:user_setting, artist: [:cleaner, :translator, :editor, :typer]).where(id: user_ids).limit(users_limit).all
  end

  def users_limit
    Chapter::CLEANERS_LIMIT + Chapter::TRANSLATORS_LIMIT + Chapter::EDITORS_LIMIT + Chapter::TYPERS_LIMIT
  end

  def cleaners
    return @cleaners if defined?(@cleaners)

    @cleaners = []

    cleaner_ids.map do |user_id|
      user = users.find { |user| user.id == user_id }

      next if user.blank?

      if user.artist.blank?
        artist = user.build_artist
        artist.save!
      end

      if user.artist.cleaner.blank?
        user.artist.create_cleaner!
      end

      @cleaners << user.artist.cleaner
    end

    @cleaners
  end

  def translators
    return @translators if defined?(@translators)

    @translators = []

    translator_ids.map do |user_id|
      user = users.find { |user| user.id == user_id }

      next if user.blank?

      if user.artist.blank?
        artist = user.build_artist
        artist.save!
      end

      if user.artist.translator.blank?
        user.artist.create_translator!
      end

      @translators << user.artist.translator
    end

    @translators
  end

  def editors
    return @editors if defined?(@editors)

    @editors = []

    editor_ids.map do |user_id|
      user = users.find { |user| user.id == user_id }

      next if user.blank?

      if user.artist.blank?
        artist = user.build_artist
        artist.save!
      end

      if user.artist.editor.blank?
        user.artist.create_editor!
      end

      @editors << user.artist.editor
    end

    @editors
  end

  def typers
    return @typers if defined?(@typers)

    @typers = []

    typer_ids.map do |user_id|
      user = users.find { |user| user.id == user_id }

      next if user.blank?

      if user.artist.blank?
        artist = user.build_artist
        artist.save!
      end

      if user.artist.typer.blank?
        user.artist.create_typer!
      end

      @typers << user.artist.typer
    end

    @typers
  end
end
