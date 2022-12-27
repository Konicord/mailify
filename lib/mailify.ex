defmodule Mailify do
  @moduledoc """
  Mailify makes it simple to check if an email is disposed or not.
  """

  @doc """

  Mailify makes it simple to check if an email is disposed or not.

    - Without RAW API requests
    - No downtimes 
    - Easy to use

  ## Examples

    iex> Mailify.disposed("email@yopmail.com")
        %{"disposable" => true}

    iex> Mailify.disposed("email@gmail.com")
        %{"disposable" => false}
  """

  @base_url "https://open.kickbox.com/v1/disposable/"

  @type email_type() :: String.t()
  @spec disposed(email_type()) :: map()

  @doc """

  We first have to handle the HTTP request to the given api.
  Since we don't need an API key, we can simply pass the "email" only. 

  Normally HTTPoison returns a bunch of informations, but since we only want the body
  of the response, we filter it down to the "body: body"

  We could also do a "one-liner"
    - %{body: body} = HTTPoison.get!("..."); body

  Status code 200 (successful response) -> return decoded body
  Status code ?? (failure/etc.) -> return an error message
  """

  def disposed(email) when is_binary(email) do
    case Mailify.Base.get!("#{@base_url}#{URI.encode_www_form(email)}") do
      %HTTPoison.Response{body: body, status_code: 200} ->
        Poison.decode!(body)

      %HTTPoison.Response{status_code: status_code} when status_code > 399 ->
        IO.inspect(status_code, label: "STATUS_CODE")
        :error

      _response ->
        raise Mailify.Error
    end
  end
end
