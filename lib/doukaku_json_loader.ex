defmodule DoukakuJsonLoader do
  @moduledoc """
  Parse JSON styled doukaku data.
  """

  defmodule Data, do: defstruct [:event_id, :event_url, :test_data]
  defmodule TestData, do: defstruct [:number, :src, :expected]

  alias DoukakuJsonLoader.{Data, TestData}

  def download(url) do
    resp = HTTPoison.get!(url)
    resp.body
    |> parse!()
  end

  def load_from_file(filename) do
    filename
    |> File.read!()
    |> parse!()
  end

  defp parse!(data_str) do
    data_str
    |> Poison.decode!(as: %Data{test_data: [%TestData{}]})
  end
end
