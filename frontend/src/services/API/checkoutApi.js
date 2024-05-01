import axios from "axios";
import {
  checkOutFailed,
  checkOutStart,
  checkOutSuccess,
  sendMailFailed,
  sendMailStart,
  sendMailSuccess,
} from "../../redux/checkoutSlice";
import { DOMAIN } from "../../utils/settings/config";


export const checkoutProduct = async (dispatch, query, token, userId) => {
  dispatch(checkOutStart());
  try {
    await axios.post(`${DOMAIN}/api/v1/carts${query}`, null, {
      headers: {
        token: `Bearer ${token}`,
      },
      params: { userId }, 
    });
    dispatch(checkOutSuccess());
  } catch (err) {
    dispatch(checkOutFailed(err));
  }
};


export const sendMailCheckout = async (dispatch, user, accessToken) => {
  dispatch(sendMailStart());
  try {
    await axios.post(`${DOMAIN}/api/v1/emails`, user, {
      headers: {
        token: `Bearer ${accessToken}`,
      },
    });
    dispatch(sendMailSuccess());
  } catch (err) {
    dispatch(sendMailFailed(err));
  }
};