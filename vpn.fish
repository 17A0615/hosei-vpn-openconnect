# replace {USERNAME} to your student number!
# requires: brew install openconnect && brew cask install tuntap
# optional: brew install coreutils # gecho (GNU echo) was used to show info you can delete gecho(s).

function vpn # cisco anyconnect wrapper (for macOS (at least up to Big Sur))

	if test (count $argv) -gt 0
		# has argv
		if test $argv[1] = 'c' || test $argv[1] = 'connect'
			# connect
			#/opt/cisco/anyconnect/bin/vpn connect vpn.hosei.ac.jp
			#sudo openconnect --background --user {USERNAME} vpn.hosei.ac.jp
			#
			echo (cat ~/.netrc | tail -n 1 | awk '{print $2}') | sudo openconnect -b vpn.hosei.ac.jp --user {USERNAME}
		else if test $argv[1] = 'd' || test $argv[1] = 'disconnect'
			# disconnect
			#/opt/cisco/anyconnect/bin/vpn disconnect
			gecho "disconnect from vpn.hosei.ac.jp..."
			gecho "disconnecting requires sudo priv. please input password."
			sudo pkill openconnect
		else if test $argv[1] = 'cd'
			# cd to /opt/cisco/anyconnect
			cd /opt/cisco/anyconnect
		else if test $argv[1] = 's' || test $argv[1] = 'stat' || test $argv[1] = 'status'
			# show status
			/opt/cisco/anyconnect/bin/vpn state | grep state | uniq
		else
			gecho "[ERROR]: option $argv[1] is not available."
			echo "Usage:"
			gecho -e "   c: connect to vpn.hosei.ac.jp"
			gecho -e "   d: disconnect from vpn.hosei.ac.jp"
			gecho -e "  cd: chdir to /opt/cisco/anyconnect"
			gecho -e "   s: show status"
		end
	else
		# does not have argv-s
		echo "Usage:"
		gecho -e "   c: connect to vpn.hosei.ac.jp"
		gecho -e "   d: disconnect from vpn.hosei.ac.jp"
		gecho -e "  cd: chdir to /opt/cisco/anyconnect"
		gecho -e "   s: show status"
	end
end
