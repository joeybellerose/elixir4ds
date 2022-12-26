defmodule Elixir4dsWeb.PostLive do
  use Elixir4dsWeb, :live_view

  # alias Elixir4ds.Notion.Block
  alias Elixir4ds.Notion.Database
  # alias PetalComponents.Typography

  def mount(%{"slug" => slug}, _session, socket) do
    # Get Page ID

    page_id = Database.get_individual_post(slug)

    # "7a7bf180-6810-4009-b509-e51f851c496d"
    # blocks =
    #   case connected?(socket) do
    #     true -> Block.get_blocks(page_id) |> dbg
    #     _ -> []
    #   end

    socket = socket |> assign(page_id: page_id)
    {:ok, socket}
  end

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="amplenote-embed" data-note-token={@page_id}>
      <iframe
        id="resize"
        width="100%"
        frameborder="0"
        src={"https://public.amplenote.com/embed/#{@page_id}"}
      >
      </iframe>
    </div>
    """
  end
end
