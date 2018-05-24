defmodule ReleasesTest do
  use ExUnit.Case
  doctest Releases

  test "greets the world" do
    assert Releases.hello() == :world
  end
end
