defmodule Mailify.MixProject do
  use Mix.Project

  @github_url "https://github.com/vKxni/mailify"

  def project do
    [
      app: :mailify,
      version: "0.1.0",
      elixir: "~> 1.13",
      description: "An Elixir library to check if an email is disposed or not.",
      name: "Mailify",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: [
        maintainers: ["vKxni"],
        licenses: ["MIT"],
        links: %{
          GitHub: @github_url
        }
      ],
      source_url: @github_url,
      docs: [
        main: "readme",
        extras: [
          "README.md"
        ]
      ]
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
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0"},
      {:jason, "~> 1.3"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
