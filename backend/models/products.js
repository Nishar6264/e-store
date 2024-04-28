// Product.js
"use strict";
const { Model, DataTypes } = require("sequelize");

module.exports = (sequelize) => {
  class Products extends Model {
    static associate({ Cart, ProductVariants, Categories }) {
      // Define associations here
      Products.hasMany(Cart, {
        foreignKey: "idProduct",
        // as: "cart",
      });
      Products.hasMany(ProductVariants, {
        foreignKey: "productId",
        // as: "productVariants",
        onDelete: "CASCADE", // onDelete cascade
        onUpdate: "CASCADE", // onUpdate cascade
      });
      Products.belongsTo(Categories, {
        foreignKey: "categoryID",
        // as: "categories",
      });
    }
  }
  Products.init(
    {
      id: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
      },
      name: DataTypes.STRING,
      description: DataTypes.TEXT,
      img1: DataTypes.TEXT,
      img2: DataTypes.TEXT,
      img3: DataTypes.TEXT,
      img4: DataTypes.TEXT,
      categoryID: DataTypes.INTEGER,
      category: DataTypes.STRING,
      stocks: DataTypes.STRING, // Define stock field
      promotionPercent: DataTypes.INTEGER,
    },
    {
      sequelize,
      modelName: "Products",
    }
  );

  // Products.sync({ alter: true });
  return Products;
};
