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

    <%!-- <div class="container" style="position: relative; overflow: hidden;">
      <iframe
        frameborder="0"
        src="https://notioniframe.com/notion/2nz5xup9ut"
        style="width: 100%; height: 100%;  border: 0; padding: 0;"
      >
      </iframe>
    </div> --%>

    <%!-- <%= if @blocks != [] do %>
      <%= for {[id, type], block} <- @blocks do %>
        <%= case type do %>
          <% "heading_1" -> %>
            <%= for item <- block do %>
              <Typography.h1><%= raw(item.html) %></Typography.h1>
            <% end %>
          <% "heading_2" -> %>
            <%= for item <- block do %>
              <Typography.h2><%= raw(item.html) %></Typography.h2>
            <% end %>
          <% "heading_3" -> %>
            <%= for item <- block do %>
              <Typography.h3><%= raw(item.html) %></Typography.h3>
            <% end %>
          <% "paragraph" -> %>
            <%= for item <- block do %>
              <Typography.p><%= raw(item.html) %></Typography.p>
            <% end %>
          <% "code" -> %>
            <pre id={id |> Integer.to_string()} phx-hook="Highlight">
              <code class="language-elixir"><%= for item <- block do %><%= raw(item.html |> String.trim_leading) %><% end %></code>
            </pre>
          <% "numbered_list_item" -> %>
            <Typography.ol>
              <%= for item <- block do %>
                <li><%= raw(item.html) %></li>
              <% end %>
            </Typography.ol>
          <% "bulleted_list_item" -> %>
            <Typography.ul>
              <%= for item <- block do %>
                <li><%= raw(item.html) %></li>
              <% end %>
            </Typography.ul>
          <% "image" -> %>
            <%= for item <- block do %>
              <%= raw(item.html) %>
            <% end %>
          <% "video" -> %>
            <%= for item <- block do %>
              <%= raw(item.html) %>
            <% end %>
          <% _ -> %>
            <Typography.p>Missing Case</Typography.p>
        <% end %>
      <% end %>
    <% end %> --%>

    <%!-- <div class="container mx-auto px-40">
      <div class="amplenote-embed" data-note-token={@id}>
        <iframe frameborder="0" src={"https://public.amplenote.com/embed/#{@id}"}></iframe>
      </div>
    </div>
    <br />

    <div class="grid justify-center">
      <.h3>Subscribe For More Like This</.h3>
      <div class="flex justify-center">
        <form
          class="input-with-button"
          action="https://app.gumroad.com/follow_from_embed_form"
          method="post"
          style="--accent:var(--accent);--contrast-accent:var(--contrast-accent)"
          id="gumroad-follow-form-embed"
        >
          <input type="hidden" name="seller_id" value="8390302265508" />
          <input
            id="gumroad-follow-form-embed-input"
            type="email"
            placeholder="Your email address"
            name="email"
            value=""
          />
          <button
            id="gumroad-follow-form-embed-button"
            class="primary rounded py-2 px-4 bg-blue-400 hover:bg-blue-600"
            type="submit"
          >
            Follow
          </button>
        </form>
      </div>
    </div> --%>
    """
  end
end
