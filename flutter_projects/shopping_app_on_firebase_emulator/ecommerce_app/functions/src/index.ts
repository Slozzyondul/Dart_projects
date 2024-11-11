import * as admin from "firebase-admin"
import * as logger from "firebase-functions/logger"
import * as firestore from "@google-cloud/firestore"
import * as functions from 'firebase-functions/v1';


admin.initializeApp()

export const makeAdminIfWhitelisted = functions.auth.user().onCreate(async (user, _) => {
    const email = user.email
    if (email === undefined) {
        logger.log(`User ${user.uid} has no email`)
        return
    }
    // white list of admin email list
    const whitelisted = ["solomonondula@gmail.com"]

    if (!whitelisted.includes(email)) {
        return
    }
    //whitelist by email domain name
    // if (!email.endsWith("@gmail.com")) {
    //     logger.log(`user ${email} is not whitelisted`)
    //     return
    // }

    if (user.customClaims?.admin === true) {
        logger.log(`user ${email} is already admin`)
        return
    }
    // set custom claim
    await admin.auth().setCustomUserClaims(user.uid, {
        admin: true,
    })
    
    // write to Firestore so the client knows it needs to update
    await admin.firestore().doc(`metadata/${user.uid}`).set({
        refreshTime: firestore.FieldValue.serverTimestamp(),
    })
    logger.log(`Custom claim set! ${email} is now an admin`)
})
