print("Would you like to install CC-ALLUDE? Y/n")
selection = read()
if selection == "Y" then
  print("To install CC-ALLUDE with this script, you need to accept the license")
  print("it is GNU General Public License v3.0")
  print("Press enter to read more..")
  read()
  print("The license in short is:")
  print("Permissions of this strong copyleft license are conditioned on making available complete source code of licensed works and modifications, which include larger works using a licensed work, under the same license. Copyright and license notices must be preserved. Contributors provide an express grant of patent rights.")
  print("Do you want to read the entire license or accept it directly? R/A")
  if read() == "A" then
    shell.run("mv LICENSE LICENSE-for-another-file")
    shell.run("wget https://raw.githubusercontent.com/TheAio/CC-ALLUDE/main/LICENSE LICENSE")
  else
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
      print("")
      for line=1,#fileData do
        print(fileData[line])
        E,K = os.pullEvent("key")
      end
      print("")
      print("If you agree to this license please press Y otherwise press N")
      while true do
        E,K = os.pullEvent("key")
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
