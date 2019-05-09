defmodule OcrWeb.ImageController do
  use OcrWeb, :controller

  def create(conn, %{"data" => data}) do
    # TODO: Handle various image type
    "data:image/jpeg;base64," <> image_binary = data
    result = Ocr.Tesseract.read(image_binary)
    render(conn, "show.json", result: result)
  end
end
