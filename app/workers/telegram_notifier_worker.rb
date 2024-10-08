require "telegram/bot"

class TelegramNotifierWorker < SidekiqWorker
  def perform(message)
    bot_token = ENV["TELEGRAM_BOT_TOKEN"]
    notification_chat_id = ENV["TELEGRAM_NOTIFICATION_CHAT_ID"]

    Telegram::Bot::Client.run(bot_token) do |bot|
      bot.api.send_message(chat_id: notification_chat_id, text: message)
    end
  end
end
