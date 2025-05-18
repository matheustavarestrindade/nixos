{
	config,
	pkgs,
	...
}: {
	hardware = {
		bluetooth.enable = true;
		graphics.enable = true;
	};
	powerManagement = {
		cpuFreqGovernor = "performance";
		# cpufreq = {
		# 	max = 4000000; # Frequency in kHz, so 4.0 GHz = 4,000,000 kHz
		# 	min = 2300000; # 2.3 GHz = 2,300,000 kHz (adjust as needed)
		# };
	};
}
