defmodule Blitz.PeriodicJob do
  @moduledoc """
  The sole purpose of this module is to execute background jobs at regular intervals.
  """

  use GenServer


  # Client API

  @doc """
  Starts the periodic job with the specified interval in seconds.

  ## Example

      iex> {:ok, _pid} = Blitz.PeriodicJob.start_link(&(&1), 5)
  """
  @spec start_link((-> :ok), pos_integer()) :: GenServer.on_start()
  def start_link(fun, interval_seconds) do
    IO.puts("Starting periodic job with interval #{interval_seconds} seconds")
    GenServer.start_link(__MODULE__, {fun, interval_seconds * 1000}, name: __MODULE__)
  end

  @doc "Stops the job."
  @spec stop() :: :ok
  def stop do
    GenServer.stop(__MODULE__)
  end


  # Callbacks

  def init(args) do
    IO.puts("Initializing periodic job")
    Process.send(self(), :execute_job, [:noconnect]) # Execute first job immediately
    {:ok, args}
  end

  def handle_info(:execute_job, state) do
    {fun, interval} = state

    fun.()

    schedule_job(interval)
    {:noreply, state}
  end

  defp schedule_job(interval) do
    Process.send_after(self(), :execute_job, interval) # Schedule job to run at specified interval
  end
end
