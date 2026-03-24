CREATE DATABASE password_manager;
use password_manager;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE,
    master_password_hash VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE credentials (
    credential_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    website_name VARCHAR(150),
    account_username VARCHAR(150),
    encrypted_password VARCHAR(255),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
);