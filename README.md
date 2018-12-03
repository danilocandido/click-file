# File System

Rails, JS-Tree, Rspec

## Getting Started

This project is about a file storage with active-storage and view using js-tree

### Prerequisites

ruby 2.5.1

### Yarn dependencies

yarn add boostrap
yarn add jquery
yarn add popper.js

### The Project
Rails 5.2.5
> rails new click-file -T --skip-turbolinks --skip-action-mailer --skip-coffee

I made a self join-association in the model FileSystems to represent a File and its *parent*, this way I can display folders, subfolders, files.
This way I do not need a gem.

To store files I will use active_storage from Rails 5.2.

To display files/folders I used jstree - https://jstree.com

> rails active_storage:install
  rails db:migrate

``` ruby
class FileSystem < ApplicationRecord
  has_many :files, class_name: 'FileSystem', foreign_key: 'folder_id'
  belongs_to :folder, class_name: 'FileSystem', optional: true # this is the self-join in Model
  has_one_attached :attached_file
end
```

and the migration
```` ruby
def change
  create_table :file_systems do |t|
    t.boolean :file, null: false, default: true
    t.references :folder, index: true # this is the self-join in Migration
  end
end
```

### Installing

rails db:create  
rails db:migrate  
rails db:seed  

rails s  

> http://localhost:3000/  

## Running the tests
Models and Controllers

bundle exec rspec

## Authors

* **Danilo Cândido** - *Initial work* - [danilocandido](https://github.com/danilocandido)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* First time I used JS-TREE
