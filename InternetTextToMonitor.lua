monitor = peripheral.wrap("top")
if fs.exists("skynet") then
    sky = require("skynet")
else
    if fs.exists("APM") then
        shell.run("APM install 19 -y")
    else
        shell.run("wget https://raw.githubusercontent.com/TheAio/CC-ALLUDE/main/APM APM")
        shell.run("APM install 19 -y")
    end
    sky = require("skynet")
end
monitor.setBackgroundColor(colors.black)
monitor.setTextColor(colors.white)
monitor.setCursorPos(1,1)
monitor.clear()
print("Please enter a channel (use only whole numbers)")
CH = tonumber(read())
print("Starting")
print("Did you see a bad message?")
print("Hold 'ctrl + R' to restart the computer")
sleep(1)
while true do
    print("Ready")
    PX,PY = monitor.getCursorPos()
    ch,message = sky.receive(CH)
    print("received a message",message,"@",os.time())
    monitor.write(message)
    monitor.setCursorPos(PX,PY+1)
    print("Waiting 2 seconds for chat cooldown")
    sleep(2)
end
error("CRASHED")
