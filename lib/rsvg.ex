defmodule RSVG do
  @on_load :load_nifs

  def load_nifs, do: :erlang.load_nif(:code.priv_dir(:rsvg) ++ '/rsvg', 0)

  @spec render(svg :: binary, format :: :png) :: binary
  def render(svg, :png) do
    # TODO: Extract dimensions from svg
    nif_render_png(svg, 347, 126)
  end

  def nif_render_png(_svg, _width, _height), do: raise("NIF nif_render_png/3 not implemented")
end
