defmodule MailifyTest do
  use ExUnit.Case
  doctest Mailify

  test "greets the world" do
    assert Mailify.hello() == :world
  end
end
