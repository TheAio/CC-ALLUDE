print("Would you like to install CC-ALLUDE? Y/n")
selection = read()
if selection == "Y" then
  shell.run("mv LICENSE LICENSE-for-another-file")
  shell.run("wget https://raw.githubusercontent.com/TheAio/CC-ALLUDE/main/LICENSE LICENSE")
  if fs.exists("LICENSE") then
    file = fs.open("LICENSE","r")
    fileData = {}
    while true do
      line = file.readLine()
      if line == nil then
        break
      else
        fileData[#fileData+1] = line
      end
    end
    for line=1,#fileData do
      print(fileData[line])
      E,K = os.pullEvent("keys")
    end
    print("If you agree to this license please press Y otherwise press N")
    while true do
      E,K = os.pullEvent("keys")
      if K == keys.n then
        shell.run("rm LICENSE")
        shell.run("mv LICENSE-for-another-file LICENSE")
        print("License denied, aborting install")
        return false
      elseif K == keys.y then
        break
      end
    end
  else
    print("Unable to download the license, aborting install")
    return false
  end
  shell.run("wget https://raw.githubusercontent.com/TheAio/CC-ALLUDE/main/APM APM")
  if fs.exists("APM") then
    os.reboot()
  else
    print("The install seems to have failed")
    return false
  end
else
  print("Installation denied, aborting install")
  return false
end
