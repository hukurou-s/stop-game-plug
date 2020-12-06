const { Client } = require('tplink-smarthome-api');

const env = process.env;
const client = new Client({
    defaultSendOptions: { timeout: 20000, transport: 'tcp' },
});

const monitorEvents = function monitorEvents(device) {
    device.on('in-use', () => {
        device.setPowerState(false);
        console.log("turn off");
    });

    device.startPolling(5000);
};

(async () => {
    const device = await client.getDevice({ host: env.DEVICE_IP });
    console.log(device);

    monitorEvents(device);
})();
