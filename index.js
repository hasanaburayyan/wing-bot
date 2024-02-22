const fs = require('fs');
const path = require('path');
const { WebClient } = require("@slack/web-api")

const token ="xoxe.xoxp-1-Mi0yLTIyNjIyNjgyMDMzNzYtMjIzODU3NzQyNzc5NC02NjgxMzAwMzA0NDY4LTY2NzIyMzcyMjI2NzgtOGEyZDA5NjlmOTg2OTY4NmI0ZGUwNWZkYWI3ZGYzNzlmNzQwODAxNDhmMjhlZmU5NGNiNzY0YTA0NjhmNTRlOA";

const web = new WebClient(token);

const conversationId = 'C06L15GURQC';

const manifest = fs.readFileSync(path.join(__dirname, 'manifest.json'), 'utf8');


async function createApp() {
  const response = await web.apps.manifest.create({
    manifest: JSON.parse(manifest)
  });

  console.log('Message sent: ', response);
}

async function deleteApp(id) {
  const response = await web.apps.manifest.delete({app_id: id});
  console.log('Message sent: ', response);
}

(async () => {
  await createApp();
  // await deleteApp('A06KJ990RJB');
})();

