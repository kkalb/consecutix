defmodule Consecutix.MixProject do
  use Mix.Project

  @version "0.1.0"
  @url "https://github.com/kkalb/consecutix"

  def project do
    [
      app: :consecutix,
      version: @version,
      elixir: "~> 1.14",
      name: "Consecutix",
      description: "Identifies consecutive elements within a given list of elements",
      deps: deps(),
      package: package(),
      preferred_cli_env: [test: :test]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dialyxir, "~> 1.3", only: [:dev], runtime: false}
    ]
  end

  defp package do
    %{
      licenses: ["MIT"],
      maintainers: ["kkalb"],
      links: %{"GitHub" => @url}
    }
  end
end
