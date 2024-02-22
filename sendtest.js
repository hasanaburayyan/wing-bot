const { WebClient } = require('@slack/web-api');

const token = "xoxp-2262268203376-2238577427794-6681341809380-d5ac60ca01d145182bff8e12def089e0";

const web = new WebClient(token);

const conversationId = 'C06KVUQ1BV3';

async function sendTestMessage(msg) {
  
  const response = await web.chat.postMessage({
    channel: conversationId,
    text: msg
  });

  console.log('Message sent: ', response);
}

(async () => {
  await sendTestMessage('Hello, world!');
})();