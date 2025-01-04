import requests
from bs4 import BeautifulSoup
import json

# Base URL of the Hindawi free books page
BASE_URL = "https://www.hindawi.org/books/"


# Define a function to scrape free book data
def scrape_free_books():
    try:
        response = requests.get(BASE_URL)
        response.raise_for_status()

        soup = BeautifulSoup(response.text, "html.parser")
        books = []
        for page in soup.find("div", class_="pages").find_all(
            "a", {"aria-label": True}
        ):
            page_link = page["href"]
            page_url = (
                BASE_URL + page_link.replace("/books/", "")
                if not page_link.startswith(BASE_URL)
                else page_link
            )
            responsePage = requests.get(page_url)

            # If page is fetched successfully
            if responsePage.status_code == 200:
                soupByOnePage = BeautifulSoup(responsePage.text, "html.parser")

            # Loop through each book item
            for book in soupByOnePage.find_all("li", class_="bookCover"):
                title = (
                    book.find("img")["alt"].replace("كتاب بعنوان ", "")
                    # book.find("a", class_="book-title").get_text(strip=True)
                    if book.find("img")["alt"].replace("كتاب بعنوان ", "")
                    else "N/A"
                )

                link = (
                    BASE_URL + book.find("a")["href"].replace("/books/", "")
                    if book.find("a")
                    else "N/A"
                )
                cover_image = book.find("img")["src"] if book.find("img") else "N/A"

                books.append(
                    {
                        "title": title,
                        "link": link,
                        "cover_image": cover_image,
                    }
                )

        # Save the data to a JSON file
        with open("free_books.json", "w", encoding="utf-8") as f:
            json.dump(books, f, ensure_ascii=False, indent=2)

        print("✅ Free books data saved to free_books.json")
        print("total books:", books.__len__())

    except requests.exceptions.RequestException as e:
        print(f"❌ Error: {e}")


# Run the scraper
if __name__ == "__main__":
    scrape_free_books()
