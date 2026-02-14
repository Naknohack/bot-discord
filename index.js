require("./keep_alive");
const { Client, GatewayIntentBits, REST, Routes } = require('discord.js');
const fs = require('fs');

const client = new Client({
    intents: [
        GatewayIntentBits.Guilds,
        GatewayIntentBits.GuildMessages,
        GatewayIntentBits.MessageContent
    ]
});

let data = {};
if (fs.existsSync('./data.json')) {
    data = JSON.parse(fs.readFileSync('./data.json'));
}

client.once('ready', async () => {
    console.log(`Bot đã online: ${client.user.tag}`);

    const commands = [
        {
            name: 'thêm',
            description: 'Thêm lệnh',
            options: [
                { name: 'key', description: 'Tên lệnh', type: 3, required: true },
                { name: 'value', description: 'Nội dung trả lời', type: 3, required: true }
            ]
        },
        {
            name: 'sửa',
            description: 'Sửa lệnh',
            options: [
                { name: 'key', description: 'Tên lệnh', type: 3, required: true },
                { name: 'value', description: 'Nội dung mới', type: 3, required: true }
            ]
        },
        {
            name: 'xóa',
            description: 'Xóa lệnh',
            options: [
                { name: 'key', description: 'Tên lệnh', type: 3, required: true }
            ]
        }
    ];

    const rest = new REST({ version: '10' }).setToken(process.env.TOKEN);

    await rest.put(
        Routes.applicationCommands(client.user.id),
        { body: commands }
    );
});

client.on('interactionCreate', async interaction => {
    if (!interaction.isChatInputCommand()) return;

    const key = interaction.options.getString('key');
    const value = interaction.options.getString('value');

    if (interaction.commandName === 'thêm') {
        data[key] = value;
        fs.writeFileSync('./data.json', JSON.stringify(data, null, 2));
        return interaction.reply(`Đã thêm: ${key}`);
    }

    if (interaction.commandName === 'sửa') {
        if (!data[key]) return interaction.reply("Lệnh chưa tồn tại");
        data[key] = value;
        fs.writeFileSync('./data.json', JSON.stringify(data, null, 2));
        return interaction.reply(`Đã sửa: ${key}`);
    }

    if (interaction.commandName === 'xóa') {
        if (!data[key]) return interaction.reply("Lệnh không tồn tại");
        delete data[key];
        fs.writeFileSync('./data.json', JSON.stringify(data, null, 2));
        return interaction.reply(`Đã xóa: ${key}`);
    }
});

client.on('messageCreate', message => {
    if (message.author.bot) return;
    if (data[message.content]) {
        message.reply(data[message.content]);
    }
});

client.login(process.env.TOKEN);
