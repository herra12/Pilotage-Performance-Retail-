-- Table des achats (fact_purchases)
CREATE TABLE fact_purchases (
    Order_ID VARCHAR(50) NOT NULL,
    Product_ID VARCHAR(50) NOT NULL,
    Purchase_Amount DECIMAL(10, 2),
    Quantity INT,
    Achats_Année_Précédente DECIMAL(10, 2),
    Coût_Moyen_du_Produit DECIMAL(10, 2),
    Quantity_Total INT,
    Total_Achats DECIMAL(10, 2),
    PRIMARY KEY (Order_ID, Product_ID)
);

-- Table des produits (dim_product)
CREATE TABLE dim_product (
    Product_ID VARCHAR(50) PRIMARY KEY,
    Product_Name VARCHAR(255),
    Sub_Category VARCHAR(100)
);

-- Table géographique (dim_geo)
CREATE TABLE dim_geo (
    GeolID VARCHAR(50) PRIMARY KEY,
    City VARCHAR(100),
    Region VARCHAR(100),
    Réduire VARCHAR(50)  -- Remarque: Le nom de colonne "Réduire" semble inhabituel
);

-- Optionnel: Ajout des clés étrangères pour fact_purchases
ALTER TABLE fact_purchases
ADD CONSTRAINT fk_product
FOREIGN KEY (Product_ID) REFERENCES dim_product(Product_ID);



-- Version avec relation géographique
CREATE TABLE fact_purchases (
    Order_ID VARCHAR(50) NOT NULL,
    Product_ID VARCHAR(50) NOT NULL,
    GeolID VARCHAR(50),  -- Ajouté pour lier à la table géographique
    Purchase_Amount DECIMAL(10, 2),
    Quantity INT,
    Achats_Année_Précédente DECIMAL(10, 2),
    Coût_Moyen_du_Produit DECIMAL(10, 2),
    Quantity_Total INT,
    Total_Achats DECIMAL(10, 2),
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Product_ID) REFERENCES dim_product(Product_ID),
    FOREIGN KEY (GeolID) REFERENCES dim_geo(GeolID)
);

