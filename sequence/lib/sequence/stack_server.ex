defmodule Sequence.StackServer do
  use GenServer

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
