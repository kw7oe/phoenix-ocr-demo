defmodule OcrWeb.PageController do
  use OcrWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, %{"upload" => %Plug.Upload{} = upload}) do
    File.cp!(upload.path, "image")
    port = Port.open({:spawn, "tesseract image result"}, [:binary])
    result = File.read!("result.txt")
    render(conn, "show.html", result: result)
  end
end
