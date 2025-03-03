const express = require("express");
const EventEmitter = require("events");

const myEmiter = new EventEmitter();
const orders = {};
const app = express();
app.use(express.json());
app.post("/order", (req, res) => {
  const { orderId, Fooditem, CoustomerName } = req.body;

  if (!orderId || !Fooditem || !CoustomerName) {
    return res.status(400).json({ message: "Missing Order Details!..." });
  }

  orders[orderId] = { orderId, Fooditem, CoustomerName };
  console.log(`order Recived For order Id ${orderId}`);

  setTimeout(() => {
    orders[orderId].status = "Ready";
    myEmiter.emit("orderReady", orderId);
  }, 4000);
  res.json({ Message: "Order Ricived", orderId });
});

app.get("/order/:id", (req, res) => {
  const orderId = req.params.id;
  const order = orders[orderId];

  if (!order) {
    return res.status(404).json({ message: "Oredr Not Found" });
  }
  res.json({ "order Id": order.orderId, Status: order.status });
});

myEmiter.on("orderReady", (orderId) => {
  console.log(`order Ready For Order Id ${orderId}`);
});

app.listen(3000, () => {
  console.log("Server running on http://localhost:3000");
});
