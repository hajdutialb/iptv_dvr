from telethon import TelegramClient, sync
import os

entity = 'iptv_dvr_bot'
api_id = int(os.environ["API_ID"])
api_hash = os.environ["API_HASH"]
phone = os.environ["PHONE"]

client = TelegramClient(entity, api_id, api_hash)
    
def main(argv):
    file_path = argv[1]
    file_name = argv[2]
    bot_name = 'iptv_dvr_bot'
    
    client.connect()
    if not client.is_user_authorized():
        print("NOT AUTHORIZED")
        exit(1)
       # client.send_code_request(phone)
       # client.sign_in(phone, input('Enter code: '))

    msg = client.send_file(bot_name, file_path, caption=str("Regjistrimi i kërkuar"), file_name=str(file_name))
    print(msg.file.id)
    client.disconnect()
    
    return 0
    
    
if __name__ == '__main__':
    import sys
    main(sys.argv[0:])
