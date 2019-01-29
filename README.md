# Bookmark Manager

Template is:

As a <Stakeholder>
  So that <Motivation>
    I'd like <Task>

```
 As a User.
 So that I can be even lazier than I normally am.
 I'd like to show a list of bookmarks.
 ```
 ```
 As a User
 So that I can save some precious time.
 I'd like to add a new bookmark to the bookmark list.
 ```


Show a list of bookmarks
Add new bookmarks
Delete bookmarks
Update bookmarks
Comment on bookmarks
Tag bookmarks into categories
Filter bookmarks by tag
Users manage their bookmarks

### To set up the databace
Connect to `psql` and create the `bookrmar_manager` database:
```
CREATE DATABASE bookmark_manager;
```

To set up the appropriate tables, connect to the database in `psql` and run the SQL scripts in the `db/migrations` folder in the given order.

### To run the Bookmark Manager app:

```
rackup -p 1234
```
To view bookmarks, navigate to `localhost:1234/bookmarks`.
