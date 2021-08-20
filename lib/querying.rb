def select_books_titles_and_years_in_first_series_order_by_year
  "
  SELECT books.title, books.year
  FROM books
  INNER JOIN series
  ON books.series_id = series.id
  WHERE series.id = 1
  "
end

def select_name_and_motto_of_char_with_longest_motto
  "
  SELECT name, motto
  FROM characters
  ORDER BY LENGTH(motto) DESC
  LIMIT 1
  "
end



def select_value_and_count_of_most_prolific_species
  "
  SELECT species, COUNT(species)
  FROM characters
  GROUP BY species
  ORDER BY species DESC
  LIMIT 1
  "
end

def select_name_and_series_subgenres_of_authors
  "
  SELECT authors.name, subgenres.name
  FROM authors
  INNER JOIN series
  ON authors.id = series.author_id
  INNER JOIN subgenres
  ON subgenres.id = series.subgenre_id
  "
end

def select_series_title_with_most_human_characters
  "
  SELECT series.title
  FROM series
  INNER JOIN books
  ON series.id = books.series_id
  INNER JOIN character_books
  ON books.id = character_books.book_id
  INNER JOIN characters
  ON character_books.character_id = characters.id
  GROUP BY series.title
  HAVING COUNT(characters.species = 'human')
  LIMIT 1
  "
end


def select_character_names_and_number_of_books_they_are_in
  "
  SELECT characters.name, COUNT(character_books.character_id) AS book_count
  FROM characters
  INNER JOIN character_books
  ON character_books.character_id = characters.id  
  GROUP BY characters.name
  ORDER BY book_count DESC
  "
end
# ORDER BY characters.name ASC
