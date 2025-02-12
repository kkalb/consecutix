# Consecutix (WIP)

Identifies consecutive elements within a given list of elements

## Installation

Add `consecutix` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:consecutix, "~> 0.1.1"}
  ]
end
```

## Examples
```elixir
iex> Consecutix.consecutive_lists([1, 1, 2, 3, 3, 3, 4])
[[1, 1, 2, 3, 3, 3, 4]]

iex> Consecutix.consecutive_lists([1, 1, 3, 3, 3, 4])
[[1, 1], [3, 3, 3, 4]]

iex> Consecutix.consecutive_lists([1, 3, 5])
[[1], [3], [5]]

iex> Consecutix.consecutive_lists([1, 3, 5, 1, 1])
[[1, 1, 1], [3], [5]]

```

## Notes

Written and tested in Elixir 1.14.1 and 1.16.2.
