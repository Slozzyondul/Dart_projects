import * as admin from "firebase-admin"
import * as logger from "firebase-functions/logger"
import * as functions from "firebase-functions/v2"

admin.initializeApp()

export const makeJobTitleUppercase = functions.firestore.onDocumentWritten("/users/{uid}/jobs/{jobId}", (e) => {
  const change = e.data

  if (change === undefined) {
    // do nothing gwhen the doument is deleted
    return
  }
  const data = change.after.data()
  if (data === undefined) {
    return
  }

  const uppercase = data.title.toUpperCase()
  //if the title is already uppercase, do nothing - prevents an infinite loop
  if (uppercase == data.title) {
    return
  }
  // otherwise, write back to the same document
  logger.log(`Uppercasing ${change.after.ref.path}: ${data.title} => ${uppercase}`)
  return change.after.ref.set({ title: uppercase }, { merge: true })
})

export const deleteAllUserJobs = functions.https.onCall(async (context: functions.https.CallableRequest) => {
  const uid = context.auth?.uid

  if (uid === undefined) {
    throw new functions.https.HttpsError("unauthenticated", "you need authentication to perform this task")
  }

  const firestore = admin.firestore()
  const collectionRef = firestore.collection(`/users/${uid}/jobs`)
  const docRefs = await collectionRef.listDocuments()

  for (const docRef of docRefs) {
    await docRef.delete()
  }

  return {"success": true}

})