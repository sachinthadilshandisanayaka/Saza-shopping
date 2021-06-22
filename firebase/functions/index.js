const functions = require("firebase-functions");

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
const stripe = require('stripe')(functions.config().stripe.testKey);

exports.stripePay = functions.https.onRequest(async (req, res) => {
    const stripeVendorAccount = '';
    stripe.paymentMethods.create({
        payment_method: req.query.paym
    }, {
        stripeAccount: stripeVendorAccount
    },
        function (err, rpaymentMethod) {
            if (err != null) {
                console.log(err);
            } else {
                stripe.paymentIntents.create({
                    amount: req.query.amount,
                    currency: req.query.currency,
                    payment_method: rpaymentMethod.id,
                    confirmation_method: 'automatic',
                    confirm: true,
                    description: req.query.description,
                }, function (err, paymentIndent) {
                    if (err != null) {
                        console.log(err);
                    } else {
                        res.json({
                            paymentIndent: paymentIndent,
                            stripeAccount: stripeVendorAccount
                        });
                    }
                }
                )
            }
        }

    )
});