# Mailify
Validate emails by checking if they are disposed or not. 

> The types of disposable email addresses

- Throwaway 
- Forwarding 
- Alias 

*Disposable Email Addresses are exactly what they sound like: email addresses that individuals use once and then discard. The use of these email addresses isn't against the law. You may entirely safeguard your real mailbox against the loss of personal information by using temporary mail.*

> How do you detect these?

By going through a huge list of email services provided by [kickbox.com](https://kickbox.com/)

## Usage

```
iex> Mailify.disposed("email@yopmail.com")
%{"disposable" => true}

iex> Mailify.disposed("email@gmail.com")
%{"disposable" => false}
```

## Installation
[Hex.pm](https://hex.pm/packages/mailify)

By adding it to your `mix.exs`

```elixir
defp deps do
    [
      {:mailify, "~> 0.1.0"}
    ]
end
```