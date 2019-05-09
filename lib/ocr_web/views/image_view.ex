defmodule OcrWeb.ImageView do
  use OcrWeb, :view

  def render("show.json", %{result: result}) do
    %{result: result}
  end
end
