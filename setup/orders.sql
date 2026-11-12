DROP TABLE IF EXISTS orders;

CREATE TABLE orders (
    row_id         INT PRIMARY KEY,
    order_id       TEXT          NOT NULL,
    order_date     DATE          NOT NULL,
    ship_date      DATE          NOT NULL,
    ship_mode      TEXT,
    customer_id    TEXT          NOT NULL,
    customer_name  TEXT,
    segment        TEXT,
    country_region TEXT,
    city           TEXT,
    state_province TEXT,
    postal_code    TEXT,
    region         TEXT,
    product_id     TEXT          NOT NULL,
    category       TEXT,
    sub_category   TEXT,
    product_name   TEXT,
    sales          NUMERIC(10,3) NOT NULL,
    quantity       INT           NOT NULL,
    discount       NUMERIC(3,2),
    profit         NUMERIC(10,4)
);