defmodule Elixir4ds.Amplenote.Database do
  def get_all_posts() do
    [
      %{
        title: "Introduction to Elixir For Data Science",
        id: "fBj2rpchZnM1VfPGFFpB334Y",
        image:
          "https://images.amplenote.com/f9f00e4a-724c-11ed-968b-121d5d4535e4/d8ea2c75-7246-40af-be20-56d1f2f7961f.jpg",
        description: "Is there room in the Data Science world for another option?"
      },
      %{
        title: "Storytelling With Elixir",
        id: "fzo8B7a5mhEr51UBe8UJDL82",
        image:
          "https://images.amplenote.com/f25f9c62-7270-11ed-b774-9e6dd13ceda2/3e6e3ad3-c67a-444b-82a2-eadcd51d3b4a.jpg",
        description:
          "Storytelling is at the heart of Data Visualization. Regardless of the type of information or data, there is always a tale to tell."
      },
      %{
        title: "Data Visualization First Steps",
        id: "UWuptadB42rT5xLEQnFDHsjh",
        image:
          "https://images.amplenote.com/13cd0a2a-72a7-11ed-93f5-a2070f8c61d0/01137eac-5772-4eae-8c29-0a1e4037f961.jpg",
        description:
          "The goal for this section is for you to be able to create the same chart from a local data source (csv file on your computer) and an external data source (csv file on the web)."
      },
      %{
        title: "Breathe Life Into Your Data",
        id: "xQFYVMGnjenTGgvKbvZJGKif",
        image:
          "https://images.amplenote.com/06e67fb2-72a7-11ed-b774-9e6dd13ceda2/4819229d-d251-4d6c-921a-69b719fba563.jpg",
        description: "Any chart, on it's own, can be pretty boring and lifeless."
      },
      %{
        title: "Digging For Golden Data Nuggets",
        id: "hi96FsJjBWCX3GYZtdp8JaWf",
        image:
          "https://images.amplenote.com/58e15fa2-7316-11ed-93f5-a2070f8c61d0/cdf6f194-2b77-460e-83b5-5b625d1c96b4.jpg",
        description:
          "Everyone wants to rest easy knowing that they are making the right decision because their decisions are based on data and facts."
      },
      %{
        title: "Organizing Your Data",
        id: "ob5gHMUiQECv9rY9irhPYu3R",
        image:
          "https://images.amplenote.com/d1497590-7499-11ed-93f5-a2070f8c61d0/1d9b584e-f183-473f-b89b-0ed2228b1b0f.jpg",
        description:
          "Organizing your information is an important piece of the Data Transformation workflow and takes effort to get your data neat and tidy."
      },
      %{
        title: "Whittling Down Your Data",
        id: "h62837b11toYHGWED9C1nbVz",
        image:
          "https://images.amplenote.com/2550b224-74a0-11ed-b774-9e6dd13ceda2/d4a3f36c-ee0f-49ba-af2e-181133a6da1f.jpg",
        description:
          "It is easy to get distracted with the sheer volume of data you will need to wade through."
      }
    ]
  end
end
