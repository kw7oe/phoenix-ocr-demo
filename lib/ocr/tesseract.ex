defmodule Ocr.Tesseract do
  @doc """
  Use Tesseract to perform optical character recognition on the image
  given by the file path.

  Return the OCR result.
  """
  def read(upload = %Plug.Upload{}) do
    File.cp!(upload.path, upload.filename)
    spawn_tesseract(upload.filename)
  end

  def read(image_binary) do
    # Using a constant filename might cause race condition
    filename = "image"
    File.write!(filename, Base.decode64!(image_binary))
    spawn_tesseract(filename)
  end

  defp spawn_tesseract(file_path) do
    port = Port.open({:spawn, "tesseract"}, [:binary])
    send(port, {self(), {:command, "'#{file_path}' result"}})

    receive do
      _ -> File.read!("result.txt")
    end
  end
end
