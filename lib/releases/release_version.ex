defmodule ReleaseVersion do
  use GenServer

  def start_link, do: GenServer.start_link(__MODULE__, [], name: __MODULE__)

  def get, do: GenServer.call(__MODULE__, :get)

  def init(_), do: {:ok, %{}}

  def handle_call(:get, _from, state) do
    {:reply, "0.1.0", state}
  end
end
