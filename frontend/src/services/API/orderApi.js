import axios from "axios";
import {
  getOrderStart,
  getOrderSuccess,
  getOrderFailed,
  getListOrderStart,
  getListOrderSucess,
  getListOrderFailed,
  updateOrderStart,
  updateOrderSuccess,
  updateOrderFailed,
  sendMailStart,
  sendMailSuccess,
  sendMailFailed
} from "../../redux/orderSlice";
import { DOMAIN } from "../../utils/settings/config";

export const createOrderUser = async (dispatch, params) => {
  dispatch(getOrderStart());
  try {
    await axios.post(`${DOMAIN}/api/v1/order`, params);
    dispatch(getOrderSuccess());
  } catch (err) {
    dispatch(getOrderFailed(err));
  }
};

export const updateOrderStatus = async (dispatch, data) => {
  dispatch(updateOrderStart());
  try {
    const response = await axios.patch(`${DOMAIN}/api/v1/order/orderstatus`, data);
    dispatch(updateOrderSuccess(response.data));
  } catch (error) {
    dispatch(updateOrderFailed(error));
  }
};



export const getListOrderUser = async (dispatch, params = "") => {
  dispatch(getListOrderStart());
  try {
    const response = await axios.get(`${DOMAIN}/api/v1/order/${params}`);
    dispatch(getListOrderSucess(response.data));
  } catch (err) {
    dispatch(getListOrderFailed());
  }
};


export const sendMailStatus = async (dispatch, user, accessToken) => {
  dispatch(sendMailStart());
  try {
    await axios.post(`${DOMAIN}/api/v1/emails/status`, user, {
      headers: {
        token: `Bearer ${accessToken}`,
      },
    });
    dispatch(sendMailSuccess());
  } catch (err) {
    dispatch(sendMailFailed(err));
  }
};