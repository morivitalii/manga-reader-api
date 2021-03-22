class Api::Titles::CreateChapter
  include ActiveModel::Model

  attr_accessor :title, :user, :content_language_id, :group_id, :volume_id, :name, :number,
    :cleaner_ids, :translator_ids, :editor_ids, :typer_ids

  attr_reader :chapter

  validate :validate_cleaners_size
  validate :validate_translators_size
  validate :validate_editors_size
  validate :validate_typers_size

  def call
    validate!

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
  rescue ActiveModel::ValidationError => _invalid
    false
  end

  private

  def validate_cleaners_size
    return if cleaners.blank?

    if cleaners.size > Chapter::CLEANERS_LIMIT
      errors.add(:cleaners, :invalid)
    end
  end

  def validate_translators_size
    return if translators.blank?

    if translators.size > Chapter::TRANSLATORS_LIMIT
      errors.add(:translators, :invalid)
    end
  end

  def validate_editors_size
    return if editors.blank?

    if editors.size > Chapter::EDITORS_LIMIT
      errors.add(:editors, :invalid)
    end
  end

  def validate_typers_size
    return if typers.blank?

    if typers.size > Chapter::TYPERS_LIMIT
      errors.add(:typers, :invalid)
    end
  end

  def user_ids
    @user_ids ||= [cleaner_ids, translator_ids, editor_ids, typer_ids].compact.flatten.uniq
  end

  def users
    @users ||= User.includes(:user_setting, artist: [:cleaner, :translator, :editor, :typer]).where(id: user_ids).all
  end

  def cleaners
    return @cleaners if defined?(@cleaners)

    user_ids = cleaner_ids&.compact&.map(&:to_i)&.uniq

    @cleaners = []

    user_ids.map do |user_id|
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

    user_ids = translator_ids&.compact&.map(&:to_i)&.uniq

    @translators = []

    user_ids.map do |user_id|
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

    user_ids = editor_ids&.compact&.map(&:to_i)&.uniq

    @editors = []

    user_ids.map do |user_id|
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

    user_ids = typer_ids&.compact&.map(&:to_i)&.uniq

    @typers = []

    user_ids.map do |user_id|
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
