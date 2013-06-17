class core {
  package {
    "git": ensure=>latest;
    "etckeeper": ensure=>latest;
    "ssh": ensure=>latest;
    "denyhosts": ensure=>latest;
    "puppet": ensure=>latest;
    "ntp": ensure=>latest;
    "htop": ensure=>latest;
    "sudo": ensure=>latest;
    "build-essential": ensure=>latest;
  }
  service {
    "ssh": require=>Package["ssh"], ensure=>running;
    "ntp": require=>Package["ntp"], ensure=>running;
  }
  file {
    "/etc/sudoers": 
	      owner=>root,
	      group=>root,
	      mode=>"0440";
    "/etc/etckeeper/etckeeper.conf": 
	      owner=>root,
	      group=>root,
      	mode=>"0644",	
  	require=>Package["sudo"]
  }
}
