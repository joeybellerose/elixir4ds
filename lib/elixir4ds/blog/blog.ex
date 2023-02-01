defmodule Elixir4ds.Blog do
  alias Elixir4ds.Blog.Post

  use NimblePublisher,
    build: Post,
    from: Application.app_dir(:elixir4ds, "priv/posts/**/*.md"),
    as: :posts,
    highlighters: [:makeup_elixir, :makeup_erlang]

  # The @posts variable is first defined by NimblePublisher.
  # Let's further modify it by sorting all posts by descending date.
  @posts Enum.sort_by(@posts, & &1.date, {:desc, Date})

  # Let's also get all tags
  @tags @posts |> Enum.flat_map(& &1.tags) |> Enum.uniq() |> Enum.sort()

  # Let's also get all authors
  @authors @posts |> Enum.flat_map(& &1.authors) |> Enum.uniq() |> Enum.sort()

  # And finally export them
  def all_posts, do: @posts
  def all_tags, do: @tags

  def all_authors, do: @authors

  def recent_posts(num \\ 5), do: Enum.take(all_posts(), num)

  defmodule NotFoundError do
    defexception [:message, plug_status: 404]
  end

  def get_post_by_id!(id) do
    Enum.find(all_posts(), &(&1.id == id)) ||
      raise NotFoundError, "post with id=#{id} not found"
  end

  def get_posts_by_tag!(tag) do
    case Enum.filter(all_posts(), &(tag in &1.tags)) do
      [] -> raise NotFoundError, "posts with tag=#{tag} not found"
      posts -> posts
    end
  end

  def get_posts_by_author!(author) do
    case Enum.filter(all_posts(), &(author in &1.authors)) do
      [] -> raise NotFoundError, "posts with author=#{author} not found"
      posts -> posts
    end
  end
end
