const { Orders, User,Products } = require("../../models");

const getOrders = async (userId) => {
  try {
    const OrdersUser = await Orders.findAll({
      where: {
        userId,
      },
    });
    return OrdersUser;
  } catch (err) {
    console.log(err);
  }
};

const createOrders = async (data) => {
  try {
    const newOrders = await Orders.create(data);
    console.log(data)
    return newOrders;
  } catch (err) {
    console.log(err);
  }
};



const updateOrders = async (id, data) => {
  try {
    const updatedOrders = await Orders.update(data, {
      where: {
        id,
      },
    });
    return updatedOrders;
  } catch (err) {
    console.log(err);
  }
};


const getListOrders = async () => {
  try {
    const listOrders = await Orders.findAll();
    return listOrders;
  } catch (err) {
    console.log(err);
  }
};


const updateOrderStatusAndDelivery = async (req, res) => {
  const { orderId, status, delivery } = req.body;

  try {
    const order = await Orders.findByPk(orderId);
    if (!order) {
      return res.status(404).json({ error: 'Order not found' });
    }

    // Update order status
    order.status = status;
    
    // Update delivery status
    order.delivery = delivery;

    await order.save();

    if (delivery) {
      // Decrease stock value
      const product = await Products.findByPk(order.productId);
      if (product) {
        product.stocks -= order.quantity;
        await product.save();
      }
    }

    res.status(200).json({ message: 'Order status and delivery updated successfully' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal server error' });
  }
};




module.exports = {
  updateOrderStatusAndDelivery,
  
  getOrders,
  createOrders,
  updateOrders,
  getListOrders,
};
