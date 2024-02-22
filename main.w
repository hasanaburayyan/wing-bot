bring "./slack" as slack;

bring cloud;
bring ngrok;

let s = new slack.App({
  oathToken: "xoxb-2262268203376-6681161858742-vS7ivoSHI1u2fr6dKlzZCHEA"
});

let api = new cloud.Api();

api.get("/", inflight () => {
  return {
    status: 200,
    body: "Hello, Outside World!"
  };
});


let t = new ngrok.Tunnel(api.url, domain: "loved-intimate-pony.ngrok-free.app");

new cloud.Function(inflight () => {
  log("Tunnel connected to: {t.url}");
});
