#!/bin/bash
clear
echo ""
echo "Meizu MX4 - arale"
echo ""
sleep 1
echo "Ubuntu: "
echo ""
echo "[1] Install Ubuntu"
echo ""
echo "[2] Quit "
echo ""
echo -n "Enter option: "; read option
if [ "$option" = "1" ]; then
  clear
  echo "  "
  echo "Install Ubuntu"
  echo ""
  sleep 1
  echo "[1] Choose a channel to flash with the --wipe option (Will remove existing apps/data)"
  echo "[2] Choose a channel to switch your device to (Will keep existing apps/data) "
  sleep 1
  echo ""
  echo -n "Enter option: "; read optionubuntu
  if [ "$optionubuntu" = "1" ]; then
    clear
    echo ""
    echo "Choose a channel to flash with the --wipe option (Will remove existing apps/data)"
    echo ""
    sleep 1
    echo "[1] stable"
    echo "[2] rc-proposed"
    echo ""
    echo -n "Enter option: "; read ubuntuwipechannel
    if [ "$ubuntuwipechannel" = "1" ]; then
      clear
      echo ""
      echo "Flashing stable channel"
      echo ""
      sleep 1
      echo "Please boot you MX4 into bootloader/fastboot mode by pressing Power & Vol -"
      echo ""
      sleep 1
      echo -n "Is your MX4 in bootloader/fastboot mode now? [Y/N] "; read bootloadermode
      if [ "$bootloadermode"==Y -o "$bootloadermode==y" ]; then
        clear
        echo ""
        echo "Detecting device"
        echo ""
        sleep 1
        fastboot devices >~/.AttachedDevices
        if grep 'device$\|fastboot$' ~/.AttachedDevices
        then
          echo "Device detected !"
          sleep 1
          clear
          echo ""
          echo "Flashing stable channel"
          echo ""
          sleep 1
          fastboot format cache
          fastboot format userdata
          fastboot reboot-bootloader
          sleep 6
          wget http://people.canonical.com/~alextu/tangxi/recovery/recovery.img
          sleep 1
          fastboot flash recovery recovery.img
          sleep 1
          echo ""
          ubuntu-device-flash touch --channel ubuntu-touch/stable/meizu.en --device arale --bootstrap
          echo ""
          echo "Rest of the setup will be on your device."
          sleep 1
          echo ""
          echo "Cleaning up.."
          rm -f ~/.AttachedDevices
          rm recovery.img
          echo ""
          sleep 1
          echo "Exiting script. Bye Bye"
          sleep 1
          exit
        else
          echo "Device not found"
          exit
        fi
        echo "Device not found."
        exit
      else
        if [ "$bootloadermode"==N -o "$bootloadermode==n"]; then
          echo ""
          sleep 1
          echo "Exiting script. Bye Bye"
          sleep 1
          exit
        else
          echo "Invalid Option"
          echo ""
          echo "Exiting script. Bye Bye"
          exit
        fi
      fi
    else
      if [ "$ubuntuwipechannel" = "2" ]; then
        clear
        echo ""
        echo "Flashing rc-proposed channel"
        echo ""
        sleep 1
        echo "Please boot you MX4 into bootloader/fastboot mode by pressing Power & Vol -"
        echo ""
        sleep 1
        echo -n "Is your MX4 in bootloader/fastboot mode now? [Y/N] "; read bootloadermode
        if [ "$bootloadermode"==Y -o "$bootloadermode==y" ]; then
          clear
          echo ""
          echo "Detecting device"
          echo ""
          sleep 1
          fastboot devices >~/.AttachedDevices
          if grep 'device$\|fastboot$' ~/.AttachedDevices
          then
            echo ""
            echo "Device detected !"
            sleep 1
            clear
            echo ""
            echo "Flashing rc-proposed channel"
            echo ""
            sleep 1
            fastboot format cache
            fastboot format userdata
            fastboot reboot-bootloader
            sleep 6
            wget http://people.canonical.com/~alextu/tangxi/recovery/recovery.img
            sleep 1
            fastboot flash recovery recovery.img
            sleep 1
            ubuntu-device-flash touch --channel ubuntu-touch/rc-proposed/meizu.en --device arale --bootstrap
            echo ""
            echo "Rest of the setup will be on your device."
            sleep 1
            echo ""
            echo "Cleaning up.."
            rm -f ~/.AttachedDevices
            rm recovery.img
            echo ""
            echo ""
            sleep 1
            echo "Exiting script. Bye Bye"
            sleep 1
            exit
          else
            echo "Device not found"
            exit
          fi
          echo "Device not found."
          exit
        else
          if [ "$bootloadermode"==N -o "$bootloadermode==n"]; then
            echo ""
            sleep 1
            echo "Exiting script. Bye Bye"
            sleep 1
            exit
          else
            echo "Invalid Option"
            echo ""
            echo "Exiting script. Bye Bye"
            exit
          fi
        fi
      fi
    fi
  else
    if [ "$optionubuntu" = "2" ]; then
      clear
      echo ""
      echo "Choose a channel to flash "
      echo "Your Apps/Data won't be touched, it will just reinstall Ubuntu / switch the channel."
      echo ""
      sleep 1
      echo "[1] stable"
      echo "[2] rc-proposed"
      echo ""
      echo -n "Enter option: "; read ubuntukeepchannel
      if [ "$ubuntukeepchannel" = "1" ]; then
        clear
        echo ""
        echo "Flashing stable channel"
        echo ""
        sleep 1
        echo "Please boot you MX4 into recovery mode by pressing Power & Vol +"
        echo ""
        sleep 1
        echo -n "Is your MX4 in recovery mode now? [Y/N] "; read recoverymode
        if [ "$recoverymode"==Y -o "$recoverymode==y" ]; then
          clear
          echo ""
          echo "Detecting device"
          echo ""
          sleep 1
          adb devices >~/.AttachedDevices
          if grep 'device$\|recovery$' ~/.AttachedDevices
          then
            echo ""
            echo "Device detected !"
            sleep 1
            clear
            echo ""
            echo "Flashing stable channel"
            sleep 1
            echo ""
            ubuntu-device-flash touch --channel ubuntu-touch/stable/meizu.en --device arale
            echo ""
            echo "Rest of the setup will be on your device."
            sleep 1
            echo ""
            echo "Cleaning up.."
            rm -f ~/.AttachedDevices
            echo ""
            sleep 1
            echo "Exiting script. Bye Bye"
            sleep 1
            exit
          else
            echo "Device not found"
            exit
          fi
          echo "Device not found."
          exit
        else
          if [ "$recoverymode"==N -o "$recoverymode==n"]; then
            echo ""
            sleep 1
            echo "Exiting script. Bye Bye"
            sleep 1
            exit
          else
            echo "Invalid Option"
            echo ""
            echo "Exiting script. Bye Bye"
            exit
          fi
        fi
      else
        if [ "$ubuntukeepchannel" = "2" ]; then
          clear
          echo ""
          echo "Flashing rc-proposed channel"
          echo ""
          sleep 1
          echo "Please boot you MX4 into recovery mode by pressing Power & Vol +"
          echo ""
          sleep 1
          echo -n "Is your MX4 in recovery mode now? [Y/N] "; read bootloadermode
          if [ "$recoverymode"==Y -o "$recoverymode==y" ]; then
            echo ""
            echo "Detecting device"
            echo ""
            sleep 1
            adb devices >~/.AttachedDevices
            if grep 'device$\|recovery$' ~/.AttachedDevices
            then
              echo "Device detected !"
              sleep 1
              clear
              echo ""
              echo "Flashing rc-proposed channel"
              sleep 1
              echo ""
              ubuntu-device-flash touch --channel ubuntu-touch/rc-proposed/meizu.en --device arale
              echo ""
              echo "Rest of the setup will be on your device."
              sleep 1
              echo ""
              echo "Cleaning up.."
              rm -f ~/.AttachedDevices
              echo ""
              sleep 1
              echo "Exiting script. Bye Bye"
              sleep 1
              exit
            else
              echo "Device not found"
              exit
            fi
            echo "Device not found."
            exit
          else
            if [ "$recoverymode"==N -o "$recoverymode==n"]; then
              echo ""
              sleep 1
              echo "Exiting script. Bye Bye"
              sleep 1
              exit
            else
              echo "Invalid Option"
              echo ""
              echo "Exiting script. Bye Bye"
              exit
            fi
          fi
        fi
      fi
    else
      echo ""
      echo "Exiting script. Bye Bye"
    fi
  fi
else
        if [ "$option" = "2" ]; then
          echo "Exiting script. Bye Bye"
          exit
        else
          echo "Exiting script. Bye Bye"
        fi
      fi