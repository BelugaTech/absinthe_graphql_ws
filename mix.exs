defmodule AbsintheGraphqlWS.MixProject do
  use Mix.Project

  @version "0.1.0"
  def project do
    [
      app: :absinthe_graphql_ws,
      deps: deps(),
      description: "Add graphql-ws websocket transport for Absinthe",
      dialyzer: dialyzer(),
      docs: docs(),
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      homepage_url: "https://github.com/geometerio/absinthe_graphql_ws",
      name: "AbsintehGrahqlWS",
      package: package(),
      preferred_cli_env: [credo: :test, dialyzer: :test],
      source_url: "https://github.com/geometerio/absinthe_graphql_ws",
      start_permanent: Mix.env() == :prod,
      version: @version
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:absinthe, "~> 1.6"},
      {:absinthe_phoenix, "> 0.0.0"},
      {:credo, "~> 1.4", only: [:dev, :test], runtime: false},
      {:cowlib, "~> 2.8", only: :test, override: true},
      {:dialyxir, "~> 1.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:gun, "~> 1.3", only: [:test]},
      {:jason, "~> 1.2"},
      {:mix_audit, "~> 0.1", only: [:dev, :test], runtime: false},
      {:phoenix, "~> 1.5"},
      {:plug_cowboy, "~> 2.5", only: :test, override: true}
    ]
  end

  defp dialyzer do
    [
      plt_add_apps: [:ex_unit, :mix],
      plt_add_deps: :app_tree,
      plt_file: {:no_warn, "priv/plts/dialyzer.plt"}
    ]
  end

  defp docs do
    [
      extras: [
        "guides/overview.md",
        "guides/installation.md",
        "README.md"
      ],
      groups_for_modules: docs_module_groups(),
      main: "overview",
      source_ref: "v#{@version}"
    ]
  end

  defp docs_module_groups do
    [
      Socket: [
        Absinthe.GraphqlWS.Socket,
        Absinthe.GraphqlWS.Transport,
        Absinthe.GraphqlWS.Util
      ],
      Messages: [
        Absinthe.GraphqlWS.Message.ConnectionAck,
        Absinthe.GraphqlWS.Message.Complete,
        Absinthe.GraphqlWS.Message.Error,
        Absinthe.GraphqlWS.Message.Next
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp package do
    [
      licenses: ["MIT"],
      maintainers: ["Geometer"],
      links: %{"GitHub" => "https://github.com/geometerio/absinthe_graphql_ws"}
    ]
  end
end