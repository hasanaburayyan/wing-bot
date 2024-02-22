const { WebClient } = require("@slack/web-api");

exports.createApp = async (token, manifest) => {
  fetch;
  console.log("TOKEN: ", token);
  console.log("MANIFEST: ", manifest);
  const web = new WebClient(token);

  const response = await web.apps.manifest.create({
    manifest: JSON.stringify(manifest)
  });

  console.log("Response: ", response);

  return response;
}

exports.deleteApp = async (id) => {
  console.log("DELETING: ", id);
};