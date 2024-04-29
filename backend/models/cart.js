"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
  class Cart extends Model {
   
    static associate({ User, Products, Variants }) {
      // define association here
      Cart.belongsTo(User, { foreignKey: "userId" });
      Cart.belongsTo(Products, { foreignKey: "productId" });
      Cart.belongsTo(Variants, {foreignKey:"variantID"})
    }
  }
  Cart.init(
    {
      userId: DataTypes.INTEGER,
      productId: DataTypes.INTEGER,
      productName: DataTypes.STRING,
      variantAttributes: DataTypes.STRING,
      variantPrice: DataTypes.STRING,
      count: DataTypes.INTEGER,
      img: DataTypes.STRING,
    },
    {
      sequelize,
      modelName: "Cart",
    }
  );
  // Cart.sync({ force: true });
  return Cart;
};
