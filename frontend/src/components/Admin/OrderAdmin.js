import React, { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { getListOrderUser, updateOrderStatus, sendMailStatus } from "../../services/API/orderApi";
import { useFormik } from "formik";
import * as Yup from "yup";


export default function OrderAdmin() {
  // const { currentUser } = useSelector((state) => state.auth.login);
  // const [success, setSuccess] = useState(false);
  // const dispatch = useDispatch();
  // const { orders } = useSelector((state) => state.order?.listOrder);
  const [text, setText] = useState("");
  // const [load, setLoad] = useState(false);
  const { currentUser } = useSelector((state) => state.auth.login);
  const dispatch = useDispatch();
  const { orders } = useSelector((state) => state.order?.listOrder);
  const [selectedOrder, setSelectedOrder] = useState(null);
  const [load, setLoad] = useState(false);

  const formik = useFormik({
    initialValues: {
      status: "",
      delivery: "",
    },
    
    onSubmit: async (values) => {
      if (selectedOrder) {
        await updateOrderStatus(dispatch, {
          orderId: selectedOrder.id,
          status: values.status,
          delivery: values.delivery,
        });
        setLoad(!load);
        await sendMailStatus(dispatch, selectedOrder, currentUser.token);
        setLoad(!load);
        setTimeout(() => {
          setLoad(false);
          setSelectedOrder(null);
        }, 4000);
      }
    }
  });
  const handleStatusClick = (order) => {
    setSelectedOrder(order);
    formik.setValues({
      status: order.status ? "1" : "", // Assuming "1" represents shipped status
      delivery: order.delivery ? "1" : "", // Assuming "1" represents delivered status
    });
  };

  useEffect(() => {
    getListOrderUser(dispatch);
  }, []);

  return (
    <div className="page-wrapper">
         <div className="page-breadcrumb">
        <div className="row">
          <div className="col-7 align-self-center">
            <h4 className="page-title text-truncate text-dark font-weight-medium mb-1">
              Basic Initialisation
            </h4>
            <div className="d-flex align-items-center">
              <nav aria-label="breadcrumb">
                <ol className="breadcrumb m-0 p-0">
                  <li className="breadcrumb-item">
                    <a href="/" className="text-muted">
                      Order
                    </a>
                  </li>
                  <li
                    className="breadcrumb-item text-muted active"
                    aria-current="page"
                  >
                    Table
                  </li>
                </ol>
              </nav>
            </div>
          </div>
        </div>
      </div>
      <div className="container-fluid">
        <div className="row">
          <div className="col-12">
            <div className="card">
              <div className="card-body">
                <h4 className="card-title">Order</h4>
                <h3>{text}</h3>
                <input
                  className="form-control w-25"
                  type="text"
                  placeholder="Enter Search!"
                />
                <br />
                <div className="table-responsive">
                  <table className="table table-striped table-bordered no-wrap">
                    <thead>
                      <tr>
                        <th>OrderID</th>
                        <th>Name</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Product Name</th>
                        <th>Total</th>
                        <th>Delivery</th>
                        <th>Status</th>
                        <th>Detail</th>
                      </tr>
                    </thead>
                    <tbody>
                      {orders?.map((item, index) => (
                        <tr key={index}>
                          <td>{item.id}</td>
                          <td>{item.fullname}</td>
                          <td>{item.phone}</td>
                          <td>{item.address}</td>
                          <td>{item.productName}</td>
                          <td>{item.totalPrices}</td>
                          <td>
                            {item.delivery
                              ? "Delivered"
                              : "Not Delivered"}
                          </td>
                          <td>
                            {item.status ? "Shipped" : "Not Shipped yet"}
                          </td>
                          <td>
                            <a
                              style={{ cursor: "pointer", color: "white" }}
                              className="btn btn-primary ml-2"
                              data-toggle="modal"
                              data-target=".bd-example-modal-lg"
                              onClick={() => handleStatusClick(item)}
                            >
                              Status
                            </a>
                            <div
                              className="modal fade bd-example-modal-lg"
                              tabIndex={-1}
                              role="dialog"
                              aria-labelledby="myLargeModalLabel"
                              aria-hidden="true"
                            >
                              <div className="modal-dialog modal-lg">
                                <form onSubmit={formik.handleSubmit}>
                                  <div className="modal-content">
                                    <div className="modal-header">
                                      <h5
                                        className="modal-title"
                                        id="exampleModalLongTitle"
                                      >
                                        Status
                                      </h5>
                                      <button
                                        type="button"
                                        className="close"
                                        data-dismiss="modal"
                                        aria-label="Close"
                                      >
                                        <span aria-hidden="true">×</span>
                                      </button>
                                    </div>
                                    <div className="container-fluid">
                                      <div className="row p-3">
                                        <div className="col-6">
                                          <div className="form-group">
                                            <label htmlFor="status">Status</label>
                                            <input
                                              type="text"
                                              name="status"
                                              className="form-control"
                                              id="status"
                                              placeholder="Enter value 1"
                                              onChange={formik.handleChange}
                                              value={formik.values.status}
                                            />
                                            <p className="text-2xs text-danger">
                                             
                                            </p>
                                          </div>
                                          <div className="form-group">
                                            <label htmlFor="delivery">Delivery</label>
                                            <input
                                              name="delivery"
                                              type="number"
                                              className="form-control"
                                              id="delivery"
                                              placeholder="Enter value 1"
                                              onChange={formik.handleChange}
                                              value={formik.values.delivery}
                                            />
                                            <p className="text-2xs text-danger">
                                              
                                            </p>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <div className="modal-footer">
                                      <button
                                        type="button"
                                        className="btn btn-secondary"
                                        data-dismiss="modal"
                                      >
                                        Close
                                      </button>
                                      <button type="submit" className="btn btn-success">
                                        Save changes
                                      </button>
                                    </div>
                                  </div>
                                </form>
                              </div>
                            </div>
                            <a
                              style={{ cursor: "pointer", color: "white" }}
                              className="btn btn-danger ml-2"
                            >
                              Cancel
                            </a>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <footer className="footer text-center text-muted">
        All Rights Reserved by AdminEcom. Designed and Developed by{" "}
        <a href="">Nishar Alam</a>.
      </footer>
    </div>
  );
}
