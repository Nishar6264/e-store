

"use strict";
const { Model, DataTypes } = require("sequelize");

module.exports = (sequelize) => {
  class Variants extends Model {
    static associate({ ProductVariants }) {
      // Define association here
      Variants.belongsTo(ProductVariants, {
        foreignKey: "VariantID",
        // as: "variants",
      });
    }
  }
  Variants.init(
    {
      variantAttributes: {
        type: DataTypes.STRING,
        allowNull: false,
      },    
      price: {
        type: DataTypes.INTEGER,
        allowNull: false,
      },
      VariantID: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: "ProductVariants", 
          key: "id",
        },
      },
    },
    {
      sequelize,
      modelName: "Variants",
      timestamps: false, 
    }
  );
  Variants.sync({alter:true})
  return Variants;
};
