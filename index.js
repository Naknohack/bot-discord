require("dotenv").config();
const { Client, GatewayIntentBits, REST, Routes, SlashCommandBuilder } = require("discord.js");
const fs = require("fs");

const client = new Client({
  intents: [GatewayIntentBits.Guilds]
});

const DATA_FILE = "./data.json";

// Load data
function loadData() {
  if (!fs.existsSync(DATA_FILE)) return {};
  return JSON.parse(fs.readFileSync(DATA_FILE));
}

// Save data
function saveData(data) {
  fs.writeFileSync(DATA_FILE, JSON.stringify(data, null, 2));
}

client.once("ready", () => {
  console.log(`Bot đã online: ${client.user.tag}`);
});

// Slash Commands
const commands = [
  new SlashCommandBuilder()
    .setName("them")
    .setDescription("Thêm dữ liệu")
    .addStringOption(option =>
      option.setName("key").setDescription("Tên").setRequired(true))
    .addStringOption(option =>
      option.setName("value").setDescription("Giá trị").setRequired(true)),

  new SlashCommandBuilder()
    .setName("sua")
    .setDescription("Sửa dữ liệu")
    .addStringOption(option =>
      option.setName("key").setDescription("Tên").setRequired(true))
    .addStringOption(option =>
      option.setName("value").setDescription("Giá trị mới").setRequired(true)),

  new SlashCommandBuilder()
    .setName("xoa")
    .setDescription("Xóa dữ liệu")
    .addStringOption(option =>
      option.setName("key").setDescription("Tên").setRequired(true)),

  new SlashCommandBuilder()
    .setName("xem")
    .setDescription("Xem dữ liệu")
];

const rest = new REST({ version: "10" }).setToken(process.env.TOKEN);

(async () => {
  try {
    await rest.put(
      Routes.applicationCommands(process.env.CLIENT_ID),
      { body: commands }
    );
    console.log("Đã đăng ký slash commands");
  } catch (err) {
    console.error(err);
  }
})();

client.on("interactionCreate", async interaction => {
  if (!interaction.isChatInputCommand()) return;

  const data = loadData();

  if (interaction.commandName === "them") {
    const key = interaction.options.getString("key");
    const value = interaction.options.getString("value");

    data[key] = value;
    saveData(data);

    await interaction.reply(`Đã thêm: ${key} = ${value}`);
  }

  if (interaction.commandName === "sua") {
    const key = interaction.options.getString("key");
    const value = interaction.options.getString("value");

    if (!data[key]) return interaction.reply("Không tồn tại!");

    data[key] = value;
    saveData(data);

    await interaction.reply(`Đã sửa: ${key} = ${value}`);
  }

  if (interaction.commandName === "xoa") {
    const key = interaction.options.getString("key");

    if (!data[key]) return interaction.reply("Không tồn tại!");

    delete data[key];
    saveData(data);

    await interaction.reply(`Đã xóa: ${key}`);
  }

  if (interaction.commandName === "xem") {
    if (Object.keys(data).length === 0)
      return interaction.reply("Chưa có dữ liệu");

    let msg = "";
    for (let key in data) {
      msg += `${key}: ${data[key]}\n`;
    }

    await interaction.reply(msg);
  }
});

client.login(process.env.TOKEN);
