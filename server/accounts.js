// // first, remove configuration entry in case service is already configured
// Accounts.loginServiceConfiguration.remove({
//   service: "facebook"
// });
// Accounts.loginServiceConfiguration.insert({
//   service: "facebook",
//   appId: "1568619163403472",
//   secret: "bb5fa6d109518501d9fb1a8690270c25"
// });

// // // first, remove configuration entry in case service is already configured
// // Accounts.loginServiceConfiguration.remove({
// //   service: "twitter"
// // });
// // Accounts.loginServiceConfiguration.insert({
// //   service: "twitter",
// //   consumerKey: "yourConsumerKey",
// //   secret: "yourSecret"
// // });

// // // first, remove configuration entry in case service is already configured
// // Accounts.loginServiceConfiguration.remove({
// //   service: "google"
// // });
// // Accounts.loginServiceConfiguration.insert({
// //   service: "google",
// //   clientId: "yourClientId",
// //   secret: "yourSecret"
// // });

ServiceConfiguration.configurations.update({
    service:"facebook"
}, {
    $set: {
        appId: '1568619163403472',
        secret:'bb5fa6d109518501d9fb1a8690270c25'
    }
});