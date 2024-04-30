"use strict";
const { Model } = require("sequelize");
module.exports = (sequelize, DataTypes) => {
{
      class Cart extends Model {
        static associate({ User, Products, Variants }) {
          Cart.belongsTo(User, { foreignKey: "userId" });
          Cart.belongsTo(Products, { foreignKey: "productId" });
          Cart.belongsTo(Variants, { foreignKey: "variantId" });
        }
      }
  
  Cart.init(
    {
      userId: DataTypes.INTEGER,
      productId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: "Products", 
          key: "id",
        },
      },
      variantId: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: "Variants", 
          key: "id",
        },
      },
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
  Cart.sync({ force: true });
  return Cart;
}
};
