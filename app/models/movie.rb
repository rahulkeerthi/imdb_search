class Movie < ApplicationRecord
  belongs_to :director

  searchkick

  def search_data
    {
      title: title,
      syllabus: syllabus,
      director: self.director
    }
  end

  # include PgSearch::Model
  # multisearchable against: [:title, :syllabus]

  # pg_search_scope :search_by_title_and_syllabus,
  #   against: [ :title, :syllabus ],
  #   associated_against: {
  #     director: [:first_name, :last_name]
  #   },
  #   using: {
  #     tsearch: { prefix: true } # <-- now `superman batm` will return something!
  #   }
end
