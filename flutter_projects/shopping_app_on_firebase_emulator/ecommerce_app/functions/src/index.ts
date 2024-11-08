import * as admin from "firebase-admin"
//import * as functions from "firebase-functions"
import * as logger from "firebase-functions/logger"
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
    logger.log(`custom claim ${email} is now admin`)
})