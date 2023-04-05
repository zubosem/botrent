CREATE TABLE "user" (
  user_id INT PRIMARY KEY,
  username TEXT,
  first_name TEXT,
  second_name TEXT,
  telegram_id INT,
  telephone TEXT,
  email TEXT,
  access_level INT,
  shop_id INT,
  created_at TIMESTAMP,
  modify_at TIMESTAMP
);

CREATE TABLE product (
  id INT PRIMARY KEY,
  name TEXT,
  description TEXT,
  sku TEXT,
  category_id INT,
  price FLOAT,
  discount_id INT,
  created_at TIMESTAMP,
  modified_at TIMESTAMP
);

CREATE TABLE season_ticket (
  id INT PRIMARY KEY,
  user_id INT,
  money INT,
  created_at TIMESTAMP,
  modified_at TIMESTAMP,
  expires_at TIMESTAMP
);

CREATE TABLE booking (
  id INT PRIMARY KEY,
  user_id INT,
  product_id INT,
  services JSONB,
  price FLOAT,
  shop_id INT,
  created_at TIMESTAMP,
  modified_at TIMESTAMP
);

CREATE TABLE shop_services (
  id INT PRIMARY KEY,
  shop_id INT,
  custom_price FLOAT,
  has_custom_price BOOLEAN,
  name TEXT,
  hours TEXT,
  created_at TIMESTAMP,
  modified_at TIMESTAMP
);

CREATE TABLE shopping_session (
  id INT PRIMARY KEY,
  user_id INT,
  total FLOAT,
  created_at TIMESTAMP,
  modified_at TIMESTAMP
);

CREATE TABLE order_details (
  id INT PRIMARY KEY,
  user_id INT,
  total FLOAT,
  payment_id INT,
  created_at TIMESTAMP,
  modified_at TIMESTAMP
);

CREATE TABLE payment_details (
  id INT PRIMARY KEY,
  order_id INT,
  type TEXT,
  amount FLOAT,
  provider TEXT,
  status TEXT,
  created_at TIMESTAMP,
  modified_at TIMESTAMP
);

CREATE TABLE money (
  id INT PRIMARY KEY,
  user_id INT,
  shop_id INT,
  payment_type_id INT
);

CREATE TABLE order_items (
  id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  created_at TIMESTAMP,
  modified_at TIMESTAMP
);

CREATE TABLE "order" (
  id INT PRIMARY KEY,
  user_id INT,
  total FLOAT,
  payment_id INT,
  created_at TIMESTAMP,
  modified_at TIMESTAMP
);

CREATE TABLE discount (
  id INT PRIMARY KEY,
  name TEXT,
  category_id INT,
  description TEXT,
  discount_percent FLOAT,
  created_at TIMESTAMP,
  modified_at TIMESTAMP
);

CREATE TABLE category (
  id INT PRIMARY KEY,
  name TEXT,
  shop_id INT
);

CREATE TABLE bot_message (
  user_id INT,
  shop_id INT,
  telegram_message_id INT,
  telegram_chat_id INT,
  payment_id INT,
  body TEXT,
  type TEXT,
  created_at TIMESTAMP,
  modified_at TIMESTAMP
);
