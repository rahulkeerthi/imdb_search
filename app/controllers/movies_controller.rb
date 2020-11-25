class MoviesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # Show all results by default - 🚀
    # Make search case insensitive - 🚀
    # Partial text search - 🚀
    # Search in syllabus too! - 🚀
    # Search by director - 🚀
    # Also show TV Shows
    # @movies = Movie.all
    # sql_query = " \
    #     movies.title @@ :query \
    #     OR movies.syllabus @@ :query \
    #     OR directors.first_name @@ :query \
    #     OR directors.last_name @@ :query \
    #   "
    # @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%") if params[:query].present?

    # PG SEARCH SINGLE SEARCH
    # @movies = Movie.search_by_title_and_syllabus(params[:query]) if params[:query].present?

    # PG SEARCH MULTISEARCH
    # @results = PgSearch.multisearch()
    # @results = PgSearch.multisearch(params[:query]) if params[:query].present?

    # SEARCHKICK
    policy_scope(Movie)
    policy_scope(TvShow)
    @results = Searchkick.search(models: [Movie, TvShow])
    @results = Searchkick.search(params[:query], models: [Movie, TvShow]) if params[:query].present?
  end
end
