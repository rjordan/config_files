import "modules"

node default {
  include core
}

node 'lcars.codecrusade.org' inherits default {
}

node 'megatraveler.codecrusade.org' inherits default {
}

node 'rabbit.codecrusade.org' inherits default {
  include rabbitmq
}
