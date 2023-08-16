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
      deps: deps(),
      package: package()
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
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
