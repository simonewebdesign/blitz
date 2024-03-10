defmodule Blitz.PeriodicJob do
  @moduledoc """
  The sole purpose of this module is to execute background jobs at regular intervals.
  """

  use GenServer


  # Client API

  @doc "Starts the job."
  @spec start_link(integer(), integer()) :: GenServer.on_start()
  # @spec start_link() :: GenServer.on_start()
  def start_link(interval_seconds, allowed_retries) do
    GenServer.start_link(__MODULE__, {interval_seconds * 1000, allowed_retries}, name: __MODULE__)
  end

  @doc "Stops the job."
  @spec stop() :: :ok
  def stop do
    GenServer.stop(__MODULE__)
  end


  # Callbacks

  def init(args) do
    Process.send(self(), :execute_job, [:noconnect]) # Execute first job immediately
    {:ok, args}
  end

  def handle_info(:execute_job, state) do
    {interval, _allowed_retries} = state

    # TODO: Your background job logic here.
    # Could the whole operation be astracted away and be completely decoupled?
    IO.puts("Executing periodic job...")

    schedule_job(interval)
    {:noreply, state}
  end

  defp schedule_job(interval) do
    Process.send_after(self(), :execute_job, interval) # Schedule job to run at specified interval
  end
end
