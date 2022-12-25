defmodule Elixir4dsWeb.TestLive do
  use Elixir4dsWeb, :live_view

  alias PetalComponents.Button

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <h1>This is the Test Page</h1>
    <Button.button class="bg-blue-500">Send!</Button.button>
    """
  end
end
