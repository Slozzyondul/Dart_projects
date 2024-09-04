const {onRequest} = require("firebase-functions/v2/https");

// Take the text parameter passed to this HTTP endpoint and insert it into
// Firestore under the path /messages/:documentId/original
exports.receiveCallback = onRequest(async (req, res) => {
  const original = req.body.Body;
  console.log("received response: ", original);
  // Send back a message that we've successfully written the message
  res.json({result: "complete"});
});
  