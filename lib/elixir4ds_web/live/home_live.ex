defmodule Elixir4dsWeb.HomeLive do
  use Elixir4dsWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col">
      <div class="h-40 px-8 grid grid-cols-1 place-content-center bg-gradient-to-r from-indigo-500 to-fuchsia-500">
        <h1 class="text-5xl font-extrabold text-center">Elixir For Data Science</h1>

        <h2 class="text-xl font-semibold text-white text-center pt-2">
          Build And Share Analytical Applications With Elixir
        </h2>
      </div>

      <div class="flex flex-col justify-center place-items-center mt-2">
        <h2 class="text-center pt-2 mb-2 text-yellow-500 text-3xl font-bold m-4">
          Portfolio
        </h2>
        <div class="grid sm:grid-cols-2 md:grid-cols-4 gap-2 place-content-center items-center">
          <a href="https://book.elixir4datascience.com" target="_blank">
            <.button class="flex border-2 hover:bg-zinc-800 bg-amber-400 border-amber-400 text-zinc-800  hover:text-amber-400 w-36 text-xl">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-6 h-6 mx-3"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M12 6.042A8.967 8.967 0 006 3.75c-1.052 0-2.062.18-3 .512v14.25A8.987 8.987 0 016 18c2.305 0 4.408.867 6 2.292m0-14.25a8.966 8.966 0 016-2.292c1.052 0 2.062.18 3 .512v14.25A8.987 8.987 0 0018 18a8.967 8.967 0 00-6 2.292m0-14.25v14.25"
                />
              </svg>
              Book
            </.button>
          </a>
          <a href="blog" target="_blank">
            <.button class="flex border-2 hover:bg-zinc-800 bg-amber-400 border-amber-400 text-zinc-800  hover:text-amber-400 w-36 text-xl">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-6 h-6 mx-3"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10"
                />
              </svg>
              Blog
            </.button>
          </a>
          <a href="https://github.com/joeybellerose/elixir4ds" target="_blank">
            <.button class="flex border-2 hover:bg-zinc-800 bg-amber-400 border-amber-400 text-zinc-800  hover:text-amber-400 w-36 text-xl">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-6 h-6 mx-3"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z"
                />
              </svg>
              Github
            </.button>
          </a>
          <a href="https://www.youtube.com/@titantech2271" target="_blank">
            <.button class="flex border-2 hover:bg-zinc-800 bg-amber-400 border-amber-400 text-zinc-800  hover:text-amber-400 w-36 text-xl">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-6 h-6 mx-3"
              >
                <path
                  stroke-linecap="round"
                  d="M15.75 10.5l4.72-4.72a.75.75 0 011.28.53v11.38a.75.75 0 01-1.28.53l-4.72-4.72M4.5 18.75h9a2.25 2.25 0 002.25-2.25v-9a2.25 2.25 0 00-2.25-2.25h-9A2.25 2.25 0 002.25 7.5v9a2.25 2.25 0 002.25 2.25z"
                />
              </svg>
              Videos
            </.button>
          </a>
        </div>
      </div>
      <div class="flex flex-col">
        <h2 class="text-orange-700 text-center text-3xl font-bold m-4">
          Techology
        </h2>
        <div class="grid grid-cols-4 place-items-center">
          <.button class="bg-orange-500 w-24 hover:text-orange-500">Elixir</.button>
          <.button class="bg-orange-500 w-24 hover:text-orange-500">Phoenix</.button>
          <.button class="bg-orange-500 w-24 hover:text-orange-500">Livebook</.button>
          <.button class="bg-orange-500 w-24 hover:text-orange-500">Fly.io</.button>
        </div>
        <h2 class="text-center text-indigo-500 text-3xl font-bold m-4">
          Data Science Packages
        </h2>
        <div class="grid grid-cols-4 place-items-center mb-4">
          <.button class="bg-indigo-400 w-24 hover:text-indigo-400">Nx</.button>
          <.button class="bg-indigo-400 w-24 hover:text-indigo-400">Explorer</.button>
          <.button class="bg-indigo-400 w-24 hover:text-indigo-400">VegaLite</.button>
          <.button class="bg-indigo-400 w-24 hover:text-indigo-400">Kino</.button>
        </div>
      </div>
    </div>
    """
  end
end
