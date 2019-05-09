defmodule OcrWeb.OcrLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <form phx-submit="recognize">
      <input type="file" name="upload"/>
      <button class="btn btn-primary" type="submit">Upload</button>
    </form>

    <%= if @result do %><pre><%= @result %></pre><% end %>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, loading: false, result: nil)}
  end

  def handle_event("recognize", %{"upload" => upload}, socket) do
    upload |> IO.inspect()
    send(self(), {:recognize, upload.path})
    {:noreply, assign(socket, result: "Recognizing...", loading: true)}
  end

  def handle_info({:recognize, path}, socket) do
    result = TesseractOcr.read(path)
    {:noreply, assign(socket, loading: false, result: result)}
  end
end
