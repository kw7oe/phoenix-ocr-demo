defmodule OcrWeb.PageController do
  use OcrWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def create(conn, %{"upload" => %Plug.Upload{} = upload}) do
    # result = Ocr.Tesseract.read(upload)
    result = TesseractOcr.read(upload.path)
    render(conn, "show.html", result: result)
  end
end
