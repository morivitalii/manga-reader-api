class Api::Books::Chapters::UpdateParams < Api::ApplicationParams
	def cleaner_ids
		params.cleaner_ids&.compact&.map(&:to_i)&.uniq
	end

	def translator_ids
		params.translator_ids&.compact&.map(&:to_i)&.uniq
	end

	def editor_ids
		params.editor_ids&.compact&.map(&:to_i)&.uniq
	end

	def typer_ids
		params.typer_ids&.compact&.map(&:to_i)&.uniq
	end
end