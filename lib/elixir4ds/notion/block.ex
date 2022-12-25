defmodule Elixir4ds.Notion.Block do
  alias Elixir4ds.Notion.Utilities

  def get_blocks(block_id) do
    block_id
    |> request_blocks()
    |> format_blocks()
  end

  def request_blocks(block_id) do
    # System.get_env("NOTION_API_SECRET")
    notion_api_key = "secret_bUhdEi5jZatllVhqB4vZsLrJ4LiP9AhaXhrjdCC7owv"

    HTTPoison.get!(
      "https://api.notion.com/v1/blocks/#{block_id}/children?page_size=100",
      [
        {"Notion-Version", "2022-06-28"},
        {"Authorization", "Bearer #{notion_api_key}"},
        {"Content-Type", "application/json"}
      ]
    )
    |> Map.fetch!(:body)
    |> Jason.decode!()
  end

  def format_blocks(block_res) do
    block_res
    # |> Utilities.convert_result_to_json()
    |> Utilities.get_results()
    |> iterate_blocks()
    |> Enum.reverse()
    |> Enum.group_by(&[&1[:group], &1[:type]])
    |> Enum.into([])
    |> Enum.sort_by(&{[&1]}, :asc)
  end

  def iterate_blocks(results) do
    results
    |> Enum.reduce([], fn x, acc ->
      count = Enum.count(acc)
      type = x["type"]

      group =
        cond do
          acc == [] ->
            count

          String.contains?(type, "list_item") && type == acc |> List.first() |> Map.fetch!(:type) ->
            acc |> List.first() |> Map.fetch!(:group)

          true ->
            count
        end

      html =
        type
        |> handle_type(x)

      [%{type: type, html: html, count: count, group: group} | acc]
    end)
  end

  def handle_type("image", content) do
    image_url = content["image"]["file"]["url"]

    "<img src='" <> image_url <> "'>"
  end

  def handle_type("video", content) do
    video_url = content["video"]["file"]["url"]

    "<video width=" <>
      "600" <>
      " controls autoplay>" <>
      "<source src='" <>
      video_url <>
      "' type=" <>
      "video/mp4" <>
      "></video>"
  end

  def handle_type(type, content) do
    content[type]["rich_text"]
    |> Enum.reduce("", fn x, acc ->
      href = x["href"]

      text = ~s"<span>#{x["plain_text"]}</span>"

      html = handle_link(href, text)

      acc <> html
    end)
  end

  def handle_link(nil, text), do: text

  def handle_link(href, text) do
    "<a class=" <>
      "'text-blue-400'" <>
      " target=" <>
      "'_blank'" <>
      " href=" <> "'" <> href <> "'>" <> text <> "</a>"
  end
end

# <%= if @blocks != [] do %>
#       <%= for {[_id, type], block} <- @blocks do %>

#         <%= case type do %>

#           <% "heading_1" -> %>
#               <.h1>
#                 <%= for content <- block do %>
#                   <%= for item <- content[:content]["rich_text"] do %>
#                     <%= if is_nil(item["href"]) do %>
#                       <%= item["plain_text"] %>
#                     <% else %>
#                     <a class="text-blue-400" target="_blank" href={item["href"]}>
#                       <%= item["plain_text"] %>
#                     </a>
#                     <% end %>
#                   <% end %>
#                 <% end %>
#               </.h1>
#               <br>

#             <% "heading_2" -> %>
#               <.h2>
#                 <%= for content <- block do %>
#                   <%= for item <- content[:content]["rich_text"] do %>
#                     <%= if is_nil(item["href"]) do %>
#                       <%= item["plain_text"] %>
#                     <% else %>
#                     <a class="text-blue-400" target="_blank" href={item["href"]}>
#                       <%= item["plain_text"] %>
#                     </a>
#                     <% end %>
#                   <% end %>
#                 <% end %>
#               </.h2>
#               <br>

#             <% "heading_3" -> %>
#               <.h3>
#                 <%= for content <- block do %>
#                   <%= for item <- content[:content]["rich_text"] do %>
#                     <%= if is_nil(item["href"]) do %>
#                       <%= item["plain_text"] %>
#                     <% else %>
#                     <a class="text-blue-400" target="_blank" href={item["href"]}>
#                       <%= item["plain_text"] %>
#                     </a>
#                     <% end %>
#                   <% end %>
#                 <% end %>
#               </.h3>
#               <br>

#           <% "paragraph" -> %>
#             <.p>
#             <%= for content <- block do %>
#               <%= for item <- content[:content]["rich_text"] do %>
#                 <%= if is_nil(item["href"]) do %>
#                   <%= item["plain_text"] %>
#                 <% else %>
#                 <a class="text-blue-400" target="_blank" href={item["href"]}>
#                   <%= item["plain_text"] %>
#                 </a>
#                 <% end %>
#               <% end %>
#             <% end %>
#             </.p>

#           <% "code" -> %>
#             <%!-- <pre> --%>
#             <code class="language-elixir hljs">
#             <%= for content <- block do %>
#               <%= for item <- content[:content]["rich_text"] do %>
#                 <%= if is_nil(item["href"]) do %>
#                   <%= item["plain_text"] %>
#                 <% else %>
#                 <a class="text-blue-400" target="_blank" href={item["href"]}>
#                   <%= item["plain_text"] %>
#                 </a>
#                 <% end %>
#               <% end %>
#             <% end %>
#             </code>
#             <%!-- </pre> --%>

#           <% "numbered_list_item" -> %>
#             <ol class="list-decimal">
#             <%= for content <- block do %>
#               <%= for item <- content[:content]["rich_text"] do %>
#                 <li>
#                   <%= if is_nil(item["href"]) do %>
#                     <%= item["plain_text"] %>
#                   <% else %>
#                   <a class="text-blue-400" target="_blank" href={item["href"]}>
#                     <%= item["plain_text"] %>
#                   </a>
#                   <% end %>
#                 </li>
#               <% end %>
#               <% end %>
#             </ol>

#           <% "bulleted_list_item" -> %>
#             <ul class="list-disc">
#               <%= for content <- block do %>
#                 <%= for item <- content[:content]["rich_text"] do %>
#                   <li>
#                     <%= if is_nil(item["href"]) do %>
#                       <%= item["plain_text"] %>
#                     <% else %>
#                     <a class="text-blue-400" target="_blank" href={item["href"]}>
#                       <%= item["plain_text"] %>
#                     </a>
#                     <% end %>
#                   </li>
#                 <% end %>
#               <% end %>
#             </ul>

#           <% "image" -> %>

#             <%= for content <- block do %>
#                 <img src={content[:content]["file"]["url"]} height="600" >
#             <% end %>

#           <% "video" -> %>

#             <%= for content <- block do %>
#               <video height="600" autoplay loop controls>
#                 <source src={content[:content]["file"]["url"]}>
#               </video>
#             <% end %>

#           <% _ -> %>
#             <.p>Missing Case</.p>

#         <% end %>
#       <% end %>
#     <% end %>
