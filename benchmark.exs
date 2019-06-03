Benchee.run(%{
  "System.cmd" => fn -> TesseractOcr.read("test-image.jpg") end,
  "Port.open" => fn ->
    port = Port.open({:spawn, "tesseract test-image.jpg stdout"}, [:binary])

    receive do
      {^port, {:data, result}} -> result
    end
  end
})
