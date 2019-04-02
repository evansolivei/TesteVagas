node 'ip-x.x.x.x-ec2.internal'{
  class { 'TesteVagas': }
  include 'nginx'  
}
