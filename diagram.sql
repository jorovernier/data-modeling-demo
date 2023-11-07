CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    user_password VARCHAR(500),
    user_email VARCHAR(255),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    user_bio VARCHAR(255)
);

CREATE TABLE follows (
    follow_id SERIAL PRIMARY KEY,
    follower_id INT NOT NULL REFERENCES users(user_id),
    following_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE posts (
    post_id SERIAL PRIMARY KEY,
    post_content VARCHAR(1000),
    post_image VARCHAR(2000),
    author_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    comment_text VARCHAR(250),
    comment_author_id INT NOT NULL REFERENCES users(user_id),
    post_id INT NOT NULL REFERENCES posts(post_id)
);

CREATE TABLE groups (
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR(50)
);

CREATE TABLE group_users (
    group_user_id SERIAL PRIMARY KEY,
    group_id INT NOT NULL REFERENCES groups(group_id),
    user_id INT NOT NULL REFERENCES users(user_id)
);

CREATE TABLE group_posts (
    group_post_id SERIAL PRIMARY KEY,
    group_id INT NOT NULL REFERENCES groups(group_id),
    post_id INT NOT NULL REFERENCES posts(post_id)
);