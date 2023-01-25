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
print("Please enter the channel (use only whole numbers)")
CH = tonumber(read())
print("Please enter the message to send")
sky.send(CH,read())
print("Your message has been sent")
