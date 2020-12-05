const { Client } = require('tplink-smarthome-api');

const env = process.env;
const client = new Client();

client.getDevice({ host: env.DEVICE_IP }).then((device) => {
    device.getSysInfo().then(console.log);
    device.setPowerState(false);
});
