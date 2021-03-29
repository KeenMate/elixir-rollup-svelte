defmodule RollupTest.Components do
  use RollupTest.ComponentsMacro, manifest_path: "/static/components/manifest.json"

  def collect_scripts([]), do: []

  def collect_scripts(wanted) when is_list(wanted) do
    Enum.map(wanted, &component_script/1)
  end

  def collect_styles([]), do: []

  def collect_styles(wanted) when is_list(wanted) do
    Enum.map(wanted, &component_style/1)
  end

  def include(conn, components) when is_list(components) do
    conn
    |> Plug.Conn.assign(:additional_scripts, collect_scripts(components))
    |> Plug.Conn.assign(:additional_styles, collect_styles(components))
  end
end
