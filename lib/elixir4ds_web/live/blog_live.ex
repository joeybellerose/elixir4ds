defmodule Elixir4dsWeb.BlogLive do
  use Elixir4dsWeb, :live_view

  # alias Elixir4dsweb.Notion.Database
  alias Elixir4ds.Notion.Database

  alias PetalComponents.Card
  alias PetalComponents.Button
  alias PetalComponents.HeroiconsV1

  def mount(_params, _session, socket) do
    # posts = Database.get_all_posts() |> Enum.reverse() |> dbg()

    if connected?(socket) do
      posts = Database.get_all_posts() |> dbg()
      socket = socket |> assign(posts: posts)
      {:ok, socket}
    else
      posts = []
      socket = socket |> assign(posts: posts)
      {:ok, socket}
      # socket = socket |> assign(posts: posts)
    end
  end

  def render(assigns) do
    ~H"""
    <div class="grid sm:grid-cols-2 lg:grid-cols-3 gap-3">
      <%= for post <- @posts do %>
        <Card.card class="hover:drop-shadow-xl">
          <Card.card_media src={post.cover_image} />
          <Card.card_content category={post.tags} heading={post.title}>
            <%= post.description %>
          </Card.card_content>
          <Card.card_footer>
            <Button.button link_type="a" to={"/blog/#{post.slug}"} label="Read More">
              <HeroiconsV1.Solid.eye class="w-4 h-4 mr-2" />Read More
            </Button.button>
          </Card.card_footer>
        </Card.card>
      <% end %>
    </div>
    """
  end
end

# <div class="grid grid-cols-3 gap-4">
#       <%= for post <- @posts do %>
#         <div>
#           <a href={"/blog/#{post[:page_id]}"} target="_blank">
#             <img src={post.cover_image} />
#           </a>
#           <div heading={post.title}></div>
#           <a href={"/blog/#{post[:page_id]}"} target="_blank">Click Here To Read</a>
#         </div>
#       <% end %>
#     </div>
