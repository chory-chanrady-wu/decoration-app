# Telegram Bot Setup Guide

## Step 1: Create a Telegram Bot

1. Open Telegram and search for **@BotFather**
2. Start a chat and send `/newbot`
3. Follow the instructions:
   - Choose a name for your bot (e.g., "Furniture Store")
   - Choose a username (must end in 'bot', e.g., "furniture_store_bot")
4. BotFather will give you a **Bot Token** like: `123456789:ABCdefGHIjklMNOpqrsTUVwxyz`
5. Save this token - you'll need it!

## Step 2: Get Your Chat ID

### Method 1: Using @userinfobot

1. Search for **@userinfobot** in Telegram
2. Start a chat with it
3. It will reply with your Chat ID (e.g., `123456789`)

### Method 2: Using your bot

1. Send any message to your new bot
2. Open this URL in browser (replace YOUR_BOT_TOKEN):
   ```
   https://api.telegram.org/botYOUR_BOT_TOKEN/getUpdates
   ```
3. Look for `"chat":{"id":123456789}` in the response
4. That number is your Chat ID

## Step 3: Configure the App

1. Open `lib/screens/checkout_screen.dart`
2. Find these lines (around line 29-30):
   ```dart
   final String _telegramBotToken = 'YOUR_BOT_TOKEN_HERE';
   final String _telegramChatId = 'YOUR_CHAT_ID_HERE';
   ```
3. Replace with your actual values:
   ```dart
   final String _telegramBotToken = '123456789:ABCdefGHIjklMNOpqrsTUVwxyz';
   final String _telegramChatId = '123456789';
   ```

## Step 4: Test It!

1. Run the app
2. Add items to cart
3. Go through checkout
4. Upload a receipt
5. You should receive a Telegram message with:
   - 🛍️ New Order notification
   - 👤 Customer details
   - 📱 Phone number
   - 📍 Address
   - 💰 Total amount
   - 📦 List of items with quantities
   - ✅ Receipt upload confirmation

## Message Format

You'll receive messages like:

```
🛍️ New Order Received!

👤 Customer: John Doe
📱 Phone: +1234567890
📍 Address: 123 Main Street, City

💰 Total: $299.99

📦 Items:
• Modern Sofa x2 ($999.98)
• LED Wall Light x1 ($79.99)

✅ Receipt uploaded successfully!
```

## Troubleshooting

**Bot not sending messages?**

- Make sure you've started a chat with your bot first
- Verify the bot token and chat ID are correct
- Check internet connection

**Wrong chat ID?**

- Use @userinfobot to get your correct ID
- Make sure it's just numbers (no quotes in code)

**App crashes?**

- Run `flutter pub get` to install http package
- Check for any syntax errors in checkout_screen.dart

## Security Note

⚠️ **Important**: Don't commit your bot token to public repositories!

- Keep your token private
- Consider using environment variables for production
- You can regenerate token via @BotFather if compromised

## Need Help?

- Telegram Bot API docs: https://core.telegram.org/bots/api
- BotFather commands: Send `/help` to @BotFather
