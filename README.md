Simple CRUD Book Collection Application
by Clay Juneau

Notes:
  * Book model has attributes - title (String), author (String), genre (String), price (Number), published-date (String)
  * On a high level the application contains 5 views -
    * HomePage - Servers two purpose, first is to view all books, second is to contain handlers (button) to perform the CRUD functions
    * Add a Book Page - contain a form with the configuration options
    * Update a Book Page - pre-populated with the current details and can be updated
    * Show Details Page - to view the details of the book
    * Delete Page - contains a confirmation message.
  * There is a flash notice popping up on the HomePage after performing each operation. 
  * All the pages have a link to the HomePage and the routes are resourceful - REST Guidelines
  * Classes are modeled adhering to MVC design pattern. 