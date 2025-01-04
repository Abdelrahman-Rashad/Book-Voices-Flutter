import json
import requests
from bs4 import BeautifulSoup


def scrape_free_book_details():
    try:
        # Step 1: Load the JSON data from a file
        with open("./free_books.json", "r", encoding="utf-8") as file:
            books = json.load(file)  # Parse the JSON content into a Python list

        addDescriptionToBooks = []
        # Step 2: Access and print the 'link' field from each book
        for book in books:
            response = requests.get(book["link"])
            response.raise_for_status()

            soup = BeautifulSoup(response.text, "html.parser")
            content_div = soup.find("div", class_="content")
            description = ""

            if content_div:
                paragraphs = content_div.find_all("p")
                description = " ".join(p.get_text(strip=True) for p in paragraphs)
                book["description"] = description

            book_index = []
            for li in soup.select(".bookIndex ul.list li"):
                a_tag = li.find("a")
                if a_tag:
                    section = {
                        "ChapterTitle": a_tag.text.strip(),
                        "ChapterLink": a_tag["href"].rstrip("/").split("/")[-1] + "/",
                    }
                    book_index.append(section)

            book["bookChapters"] = book_index
            addDescriptionToBooks.append(book)
        with open("free_books.json", "w", encoding="utf-8") as file:
            json.dump(addDescriptionToBooks, file, ensure_ascii=False, indent=2)

    except requests.exceptions.RequestException as e:
        print(f"❌ Error: {e}")


# Run the scraper
if __name__ == "__main__":
    scrape_free_book_details()
