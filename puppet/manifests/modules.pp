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
	    mode=>"0440",
      	require=>Package["sudo"];
    "/etc/etckeeper/etckeeper.conf": 
    	owner=>root,
    	group=>root,
      	mode=>"0644",	
        source=>"puppet:///files/etckeeper.conf",
      	require=>Package["etckeeper"];
  }
  exec { 'etckeeper-init':
    command => 'etckeeper init',
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
    cwd     => '/etc',
    creates => '/etc/.git',
    require => [ Package['git'], Package['etckeeper'] ],
  }
}

class rabbitmq {
  package {
    "rabbitmq-server": ensure=>latest;
  }
  service {
    "rabbitmq-server": require=>Package['rabbitmq-server'], ensure=>running;	
  }
}
