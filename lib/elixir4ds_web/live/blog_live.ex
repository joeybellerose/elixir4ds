defmodule Elixir4dsWeb.BlogLive do
  use Elixir4dsWeb, :live_view

  alias Elixir4ds.Blog

  def mount(_params, _session, socket) do
    posts = Blog.all_posts() |> dbg
    {:ok, assign(socket, posts: posts)}
  end

  def render(assigns) do
    ~H"""
    <div class="text-white container mx-auto">
      <h1>This will be the blog page</h1>
      <%= for post <- @posts do %>
        <a href={"/blog/#{post.id}"}>
          <h2><%= post.title %></h2>
        </a>
        <p>
          <time><%= post.date %></time> by <%= post.authors %>
        </p>
      <% end %>
    </div>
    """
  end
end
