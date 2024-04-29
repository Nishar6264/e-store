const { User, Products, Variants, Cart } = require('../../models');

async function addToCart(req, res) {
  try {
    const { userId, productId, variantId, quantity } = req.body;
console.log(req.body);
    const user = await User.findByPk(userId);
    if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }

    const product = await Products.findByPk(productId);
    if (!product) {
      return res.status(404).json({ error: 'Product not found' });
    }

    const variant = await Variants.findByPk(variantId);

    // console.log(variant);
    if (!variant) {
      return res.status(404).json({ error: 'Variant not found' });
    }

    if (variant.productId !== productId) {
      return res.status(400).json({ error: 'Variant does not belong to the specified product' });
    }

    const cartItem = await Cart.create({
      userId,
      productId,
      variantId,
      quantity
    });

    res.status(201).json({ message: 'Item added to cart successfully', cartItem });
  } catch (error) {
    console.error('Error adding item to cart:', error.message);
    res.status(500).json({ error: 'Internal server error' });
  }
}

async function getCartByUser(req, res) {
    try {
      const userId = req.params.userId;
  
      // Check if the user exists
      const user = await User.findByPk(userId);
      if (!user) {
        return res.status(404).json({ error: 'User not found' });
      }
  
      // Retrieve cart items for the user
      const cartItems = await Cart.findAll({
        where: { userId },
        include: [
          { model: Products },
          { model: Variants }
        ]
      });
  
      res.status(200).json({ cartItems });
    } catch (error) {
      console.error('Error retrieving cart items:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  }

module.exports = {
  addToCart,
  getCartByUser,
};
