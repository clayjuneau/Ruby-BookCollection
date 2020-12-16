require 'simplecov'
SimpleCov.start

require 'rails_helper'

# run tests by typing "rspec spec/books_spec.rb" in command line

RSpec.describe 'Book Collection', type: :system do

  describe 'books index page' do
    it 'shows the right content' do
      visit books_path
      expect(page).to have_content('Book Collection')
    end
  end

  describe "edit - autofill" do
    it 'creates book with sample title and makes sure the book is displayed on the book collection home page' do
      visit new_book_path
  
      fill_in("book[title]", :with => "testbook1")
      click_button "Create Book"
  
      visit books_path

      expect(page).to have_content("testbook1")
    end
  end

  describe "back button" do
    it 'starts on show page and makes sure the back button returns the user to the book collection home page' do
      # we must create a book here so that we can go to the Show page of a specific book
      visit new_book_path
      fill_in("book[title]", :with => "testbook1")
      click_button "Create Book"

      visit book_path(Book.find_by_title("testbook1"))
  
      click_button "<< Back to List"
  
      expect(page).to have_content("Book Collection")
    end
  end

  describe "delete book" do
    it 'creates and then deletes a book and makes sure it does not display on the book collection home page' do
      visit new_book_path
      fill_in("book[title]", :with => "testbook1")
      click_button "Create Book"

      visit delete_book_path(Book.find_by_title("testbook1"))
      #sleep(3)
      click_button "Delete Book"

      visit books_path
  
      expect(page).to have_no_content("testbook1")
    end
  end

  describe "editing a book" do
    it 'creates and then edits the title of the book and makes sure it correctly displays new title on the book collection home page' do
      visit new_book_path
      fill_in("book[title]", :with => "testbook1")
      click_button "Create Book"

      visit edit_book_path(Book.find_by_title("testbook1"))
      
      fill_in("book[title]", :with => "testbook2")
      click_button "Update Book"

      visit books_path
      #sleep(3)
  
      expect(page).to have_content("testbook2")
    end
  end
  
  
end
