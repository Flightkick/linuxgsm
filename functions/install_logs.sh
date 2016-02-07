#!/bin/bash
# LGSM install_logs.sh function
# Author: Daniel Gibbs
# Website: http://gameservermanagers.com
lgsm_version="271215"

if [ "${checklogs}" != "1" ]; then
	echo ""
	echo "Creating log directorys"
	echo "================================="
fi
sleep 1
# Create dir's for the script and console logs
mkdir -v "${scriptlogdir}"
touch "${scriptlog}"
if [ -n "${consolelogdir}" ]; then
	mkdir -v "${consolelogdir}"
	touch "${consolelog}"
fi

# If a server is source or goldsource, Teamspeak 3, Starbound, Project Zomhoid create a symbolic link to the game server logs.
if [ "${engine}" == "source" ]||[ "${engine}" == "goldsource" ]||[ "${gamename}" == "Teamspeak 3" ]||[ "${engine}" == "starbound" ]||[ "${engine}" == "projectzomboid" ]; then
	if [ ! -h "${logsdir}/server" ]; then
		ln -nfsv "${gamelogdir}" "${logsdir}/server"
	fi
fi

# If a server is unreal2 or unity3d create a dir.
if [ "${engine}" == "unreal2" ]||[ "${engine}" == "unity3d" ]||[ "${gamename}" == "Teeworlds" ]; then
	mkdir -pv "${gamelogdir}"
fi

# If a server is 7 Days to Die.
if [ "${gamename}" == "7 Days To Die" ]; then
	if [ ! -h "${gamelogdir}/output_log.txt" ]; then
		ln -nfsv "${filesdir}/7DaysToDie_Data/output_log.txt" "${gamelogdir}/output_log.txt"
	fi
fi

# If server uses SteamCMD create a symbolic link to the Steam logs.
if [ -d "${rootdir}/Steam/logs" ]; then
	if [ ! -h "${logsdir}/steamcmd" ]; then
		ln -nfsv "${rootdir}/Steam/logs" "${logsdir}/steamcmd"
	fi
fi
sleep 1