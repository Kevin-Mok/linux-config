function scan-history
	sudo systemctl start postgresql.service
	# and systemctl status postgresql.service
	and source $spv_dir/src/scripts/api-keys.sh
	# and $spv_dir/src/scripts/update-history-2.sh
	and $spv_dir/src/scripts/update-history.sh 
	and cat $spv_dir/src/api/management/commands/update-history.log | tail -n 1
end
