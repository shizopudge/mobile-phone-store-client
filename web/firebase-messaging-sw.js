importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");

firebase.initializeApp({
    apiKey: "AIzaSyA1VTeiARvajJKZS4NRp6zNQPb8SlHoH4A",
    authDomain: "mobile-store-475a0.firebaseapp.com",
    projectId: "mobile-store-475a0",
    storageBucket: "mobile-store-475a0.appspot.com",
    messagingSenderId: "366249433376",
    appId: "1:366249433376:web:1f87e63b1d0920914c1f45"
});

const messaging = firebase.messaging();

messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});