defmodule Elixir4ds.Notion.Database do
  def get_all_posts() do
    # System.get_env("NOTION_API_SECRET")
    notion_api_key = System.get_env("NOTION_API_SECRET")
    # System.get_env("NOTION_BLOG_DB_ID")
    blog_db_id = System.get_env("NOTION_BLOG_DB_ID")

    query_db_list_all()
    |> make_request(blog_db_id, notion_api_key)
    |> format_response()
  end

  def get_individual_post(slug) do
    # System.get_env("NOTION_API_SECRET")
    notion_api_key = System.get_env("NOTION_API_SECRET")
    # System.get_env("NOTION_BLOG_DB_ID")
    blog_db_id = System.get_env("NOTION_BLOG_DB_ID")

    query = query_single_page_from_slug(slug)

    make_request(query, blog_db_id, notion_api_key)
    |> Map.fetch!("results")
    |> Enum.reduce("", fn x, acc ->
      id = x["properties"]["AmplenoteID"]["rich_text"] |> List.first() |> Map.fetch!("plain_text")
      acc <> id
    end)
  end

  def query_db_list_all() do
    %{
      filter: %{
        property: "Status",
        select: %{
          equals: "Published"
        }
      }
    }
    |> Jason.encode!()
  end

  def query_single_page_from_slug(slug) do
    %{
      filter: %{
        property: "Slug",
        rich_text: %{
          equals: slug
        }
      }
    }
    |> Jason.encode!()
  end

  def make_request(query, blog_db_id, notion_api_key) do
    HTTPoison.post!(
      "https://api.notion.com/v1/databases/#{blog_db_id}/query",
      query,
      [
        {"Notion-Version", "2022-06-28"},
        {"Authorization", "Bearer #{notion_api_key}"},
        {"Content-Type", "application/json"}
      ]
    )
    |> Map.fetch!(:body)
    |> Jason.decode!()
  end

  def format_response(body) do
    body
    # |> Jason.decode!()
    |> Map.fetch!("results")
    |> Enum.map(fn x ->
      title =
        x["properties"]["Title"]["title"]
        |> Enum.map(fn y ->
          y["text"]["content"]
        end)
        |> List.first()

      description =
        x["properties"]["Description"]["rich_text"]
        |> Enum.reduce("", fn y, acc ->
          acc <> y["plain_text"]
        end)

      cover_image = x["properties"]["CoverImage"]["url"]

      authors =
        x["properties"]["Authors"]["multi_select"]
        |> Enum.map(fn y ->
          y["name"]
        end)

      tags =
        x["properties"]["Tags"]["multi_select"]
        |> Enum.map(fn y ->
          y["name"]
        end)

      slug = x["properties"]["Slug"]["formula"]["string"]

      page_id = x["id"]

      %{
        title: title,
        description: description,
        cover_image: cover_image,
        authors: authors,
        tags: tags,
        slug: slug,
        page_id: page_id
      }
    end)
  end
end
