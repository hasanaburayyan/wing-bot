// bring cloud;
// bring util;
// bring sim;
// bring http;

// pub struct DisplayInformation {
//   name: str;
//   description: str?;
//   long_description: str?;
//   background_color: str?;
// }

// pub struct SlackAppManifest {
//   display_information: DisplayInformation; 
// }

// pub class App {
//   manifest: Json;
//   service: cloud.Service;
//   apiURL: str;
//   token: str;

//   new (manifest: Json) {
//     this.manifest = manifest;
//     this.token = util.env("SLACK_TOKEN"); 
//     this.apiURL = "https://slack.com/api";

//     let headers = {
//       "Authorization" => "Bearer {this.token}",
//       "Content-Type" => "application/json",
//     };

//     let url = this.apiURL;
//     if !nodeof(this).app.isTestEnvironment {
//       this.service = new cloud.Service(inflight () => {
//         let resp = http.post("{url}/apps.manifest.create", {
//           headers: headers,
//           body: Json.stringify({manifest: manifest})
//         });
  
//         let body = resp.body;
//         let appId = Json.parse(body).get("app_id");
  
//         let installResponse = http.post("{url}/admin.apps.approve", {
//           headers: headers,
//           body: Json.stringify({
//             app_id: appId,
//             team_id: "T027Q7W5ZB2"
//           })
//         });
  
//         log("Install Response: {installResponse.body}");
  
//         return () => {
//           log("NEED TO KILL: {appId}");
//           let response = http.post("{url}/apps.manifest.delete", {
//             headers: headers,
//             body: Json.stringify({app_id: appId})
//           });
  
//           log("Response: {response.body}");
//         };
//       });
//     }
//   }

//   pub inflight makeCall(endpoint: str, body: Json): http.Response {
//     let resp = http.post("{this.apiURL}{endpoint}", {
//       headers: {
//         "Authorization" => "Bearer {this.token}",
//         "Content-Type" => "application/json",
//       },
//       body: Json.stringify(body)
//     });

//     return resp;
//   }

//   pub inflight cleanup() {
//     this.service.stop();
//   }

//   pub inflight start() {
//     this.service.start();
//   }
// }