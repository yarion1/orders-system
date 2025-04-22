-- migrations/001_create_orders_table.up.sql
CREATE TABLE orders
(
    id          VARCHAR(36)    NOT NULL PRIMARY KEY,
    price       DECIMAL(10, 2) NOT NULL,
    tax         DECIMAL(10, 2) NOT NULL,
    final_price DECIMAL(10, 2) NOT NULL
);