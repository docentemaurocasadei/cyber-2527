-- ============================================
-- PostgreSQL schema: ricambi
-- ============================================

CREATE SCHEMA IF NOT EXISTS ricambi;

SET search_path TO ricambi;

-- ============================================
-- Table: workshops
-- ============================================

CREATE TABLE workshops (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    business_name VARCHAR(80) NOT NULL,
    vat_number VARCHAR(13) NOT NULL UNIQUE,
    street_address VARCHAR(45),
    street_number VARCHAR(20),
    city VARCHAR(50),
    province VARCHAR(2),
    phone VARCHAR(20),
    email VARCHAR(200)
);

-- ============================================
-- Table: categories
-- ============================================

CREATE TABLE categories (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    description TEXT
);

-- ============================================
-- Table: suppliers
-- ============================================

CREATE TABLE suppliers (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    company_name VARCHAR(80) NOT NULL,
    vat_number VARCHAR(13) NOT NULL UNIQUE,
    street_address VARCHAR(45),
    street_number VARCHAR(20),
    city VARCHAR(50),
    province VARCHAR(2),
    phone VARCHAR(20),
    email VARCHAR(200)
);

-- ============================================
-- Table: products
-- ============================================

CREATE TABLE products (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    category_id INT NOT NULL,
    sku VARCHAR(13) NOT NULL UNIQUE,
    name VARCHAR(45),
    sell_price DECIMAL(10,2),
    description TEXT,
    stock_quantity INT,
    CONSTRAINT fk_products_categories
        FOREIGN KEY (category_id)
        REFERENCES categories (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- ============================================
-- Table: product_supplier (many-to-many)
-- ============================================

CREATE TABLE product_supplier (
    product_id INT NOT NULL,
    supplier_id INT NOT NULL,
    supply_cost DECIMAL(10,2),
    PRIMARY KEY (product_id, supplier_id),
    CONSTRAINT fk_product_supplier_product
        FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_product_supplier_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES suppliers (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ============================================
-- Table: orders
-- ============================================

CREATE TABLE orders (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    workshop_id INT NOT NULL,
    order_date DATE,
    status VARCHAR(20),
    CONSTRAINT fk_orders_workshops
        FOREIGN KEY (workshop_id)
        REFERENCES workshops (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- ============================================
-- Table: order_item
-- ============================================

CREATE TABLE order_item (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    unit_price DECIMAL(10,2),
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order_item_order
        FOREIGN KEY (order_id)
        REFERENCES orders (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_order_item_product
        FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);
