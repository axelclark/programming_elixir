defmodule Sequence.StackServer do
  use GenServer

  ## External API

  def start_link(list) do
    GenServer.start_link(__MODULE__, list, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(new_item) do
    GenServer.cast __MODULE__, {:push, new_item}
  end

  ## GenServer Implementation

  def init(list) do
    {:ok, list}
  end

  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  def handle_cast({:push, new_item}, list) do
    {:noreply, [new_item | list]}
  end
end
