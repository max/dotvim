" Highlight Ruby
au BufRead,BufNewFile Gemfile* set filetype=ruby
au BufRead,BufNewFile Guardfile set filetype=ruby
au BufRead,BufNewFile Vagrantfile set filetype=ruby
au BufRead,BufNewFile *.ru set filetype=ruby

" JSON as Javascript
au BufRead,BufNewFile *.json set filetype=javascript

" EJS as HTML
au BufRead,BufNewFile *.ejs set filetype=html
