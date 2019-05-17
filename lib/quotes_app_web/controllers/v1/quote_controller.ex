defmodule QuotesAppWeb.V1.QuoteController do
    use QuotesAppWeb, :controller

    def index(conn, %{"format" => "html"}) do
        case QuotesApp.Quotes.get_quote_of_the_day do
            {:ok, quote} ->
                conn
                |> assign(:quote, quote)
                |> render(:index)
            _ ->
                conn
                |> put_flash(:danger, "Bad things happened!")
                |> redirect(to: "/")
        end
    end

    def index(conn, _params) do
        case QuotesApp.Quotes.get_quote_of_the_day do
            {:ok, quote} ->
                conn
                |> json(%{content: quote.content, author: quote.author})
            _ ->
                conn
                |> json(%{error: "Error getting quote of the day."})
        end
    end

    def random(conn, %{"format" => "html"}) do
        case QuotesApp.Quotes.get_random_quote do
            {:ok, quote} ->
                conn
                |> assign(:quote, quote)
                |> render(:index)
            _ ->
                conn
                |> put_flash(:danger, "Bad things went down.")
                |> redirect(to: "/")
        end
    end

    def random(conn, _params) do
        case QuotesApp.Quotes.get_random_quote do
            {:ok, quote} ->
                conn
                |> json(%{content: quote.content, author: quote.author})
            _ ->
                conn
                |> json(%{error: "Error getting random quote."})
        end
    end
end