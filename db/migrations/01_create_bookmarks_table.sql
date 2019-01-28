CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));


SELECT * FROM bookmarks;

INSERT INTO bookmarks (url) VALUES ('https://www.google.com');
INSERT INTO bookmarks (url) VALUES ('https:/www.comparethemarket.com');
INSERT INTO bookmarks (url) VALUES ('https://www.tesco.com');
