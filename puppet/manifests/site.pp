import "nodes"

filebucket { main: server => 'lcars.penguin-games.com' }

File { backup => main }
Exec { path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin" }


