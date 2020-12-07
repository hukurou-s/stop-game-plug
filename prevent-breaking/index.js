const { Client } = require('tplink-smarthome-api');
const { IncomingWebhook } = require('@slack/webhook');

const env = process.env;
const url = process.env.SLACK_WEBHOOK_URL;

const client = new Client({
    defaultSendOptions: { timeout: 20000, transport: 'tcp' },
});
const webhook = new IncomingWebhook(url);

const monitorEvents = function monitorEvents(device) {
    device.on('in-use', () => {
        device.setPowerState(false);
        console.log("turn off");
        (async () => {
            await webhook.send({
                text: '起動されたので、電源を切りました。',
            });
        })();
    });

    device.startPolling(5000);
};

(async () => {
    const device = await client.getDevice({ host: env.DEVICE_IP });
    console.log(device);
    await device.setPowerState(false);

    monitorEvents(device);
})();
