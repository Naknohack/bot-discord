require("./keep_alive");
const { Client, GatewayIntentBits, SlashCommandBuilder, REST, Routes } = require('discord.js');
const fs = require('fs');

const client = new Client({
    intents: [
        GatewayIntentBits.Guilds,
        GatewayIntentBits.GuildMessages,
        GatewayIntentBits.MessageContent
    ]
});

let data = require('./data.json');
let cooldown = {};

const commands = [
    new SlashCommandBuilder()
        .setName('thêm')
        .setDescription('Thêm lệnh')
        .addStringOption(option =>
            option.setName('noidung')
                .setDescription('từ | nội dung')
                .setRequired(true)
        ),
    new SlashCommandBuilder()
        .setName('sửa')
        .setDescription('Sửa lệnh')
        .addStringOption(option =>
            option.setName('noidung')
                .setDescription('từ | nội dung')
                .setRequired(true)
        )
].map(command => command.toJSON());

const rest = new REST({ version: '10' }).setToken(process.env.TOKEN);

client.once('ready', async () => {
    console.log('Bot đã online');
    await rest.put(
        Routes.applicationCommands(client.user.id),
        { body: commands },
    );
});

client.on('interactionCreate', async interaction => {
    if (!interaction.isChatInputCommand()) return;

    const input = interaction.options.getString('noidung');
    const splitIndex = input.indexOf('|');
    if (splitIndex === -1) return interaction.reply("Sai cú pháp");

    const trigger = input.slice(0, splitIndex).trim();
    const reply = input.slice(splitIndex + 1).trim();

    if (interaction.commandName === 'thêm') {
        data[trigger] = reply;
        fs.writeFileSync('./data.json', JSON.stringify(data));
        interaction.reply(`Đã thêm lệnh: ${trigger}`);
    }

    if (interaction.commandName === 'sửa') {
        if (!data[trigger]) return interaction.reply("Lệnh chưa tồn tại");
        data[trigger] = reply;
        fs.writeFileSync('./data.json', JSON.stringify(data));
        interaction.reply(`Đã sửa lệnh: ${trigger}`);
    }
});

client.on('messageCreate', message => {
    if (message.author.bot) return;
    if (message.interaction) return;

    const content = message.content.trim();

    if (data[content]) {
        if (cooldown[message.author.id]) return;
        cooldown[message.author.id] = true;

        message.reply(data[content]);

        setTimeout(() => {
            delete cooldown[message.author.id];
        }, 2000);
    }
});

client.login(process.env.TOKEN);
