defmodule DoukakuJsonLoader.MixProject do
  use Mix.Project

  def project do
    [
      app: :doukaku_json_loader,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:poison, "~> 4.0"},
      {:httpoison, "~> 1.5"}
    ]
  end
end
