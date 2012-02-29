What you'll need:
Rails 3.x.x
MySQL preferably.
Gems
  mechanize (recommended)
  nokogiri (recommended)
  bundler
  RSpec
Anything else you need. Put it all in Gemfile

Some Hints:
Use ActiveRecord associations when appropriate
Use polymorphism when appropriate


Requirements:
Write a Rails app that manages web pages, and keeps track of any links (anchor tags) and images (img tags) on that web page.

This app has 2 pages, one controller, 3 models  (Url, Link, Image), and Rspec tests.

**********
* Models *
**********
Url properties:
  url (string upto 1024 characters)
    - validate url is not empty before saving
  title (string)
  body (text)
  last_fetch_at (date)
  fetch_error (string)

Link properties:
  url (string up to 1024 characters)
    - validate url is not empty before saving
  attributes (string containing attributes associated with the <a> tag)

Image properties:
  url (string up to 1024 characters)
    - validate url is not empty before saving
  attributes (string containing attributes associated with the <img> tag)




***************
* What to do: *
***************
path: "/"
A user enters a URL. 
Pressing "Fetch" does the following (don't worry about AJAX or jQuery):

1) saves the URL as the model Url.
  - For duplicates, freshs .

2) fetches that URL and extracts:
 - any links and images (I suggest using Mechanize and Nokogiri for this)
 - Url title
 - Url body (content of the page)

3) save those links and images as the models Link and Image

4) associate each link and image to the Url as a resource.

5) Go to the show page for that Url.

path "/urls/999/show"

1) Display the Url with associated resources
 - Each resource should open up in a new window.
 
 - Each element should have the same attributes as the original page. So if an <img> tag had width='30' and height='25' on the original Url, this list should retain that. 
 
 - Links are just <a> tags to the link
 
 - Images are an <img> tag that links to the image itself on the remote server.




*********
* RSpec *
*********
Write specs for the Url fetch process.

 - ensure you are handling timeouts, and invalid urls, invalid HTML documents, etc. It's okay if it just errors out and gives an error message, nothing to elaborate.

 - ensure you save Url, Link and Image properly

 - ensure you associate Link and Image models to Url properly

