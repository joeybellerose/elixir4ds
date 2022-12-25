defmodule Elixir4ds.Notion.Utilities do
  # def convert_result_to_json(result) do
  #   result
  #   |> Map.fetch!(:body)
  #   |> Jason.decode!()
  # end

  def get_results(json) do
    json |> Map.fetch!("results")
  end
end
