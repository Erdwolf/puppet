
class sbt {

  include java

  include wget

  wget::fetch { 'https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.13.9/sbt-launch.jar?_ga=1.137549430.715993285.1431960594':
    destination => '/usr/local/lib/sbt-launch.jar',
  }

  file { '/usr/local/bin/sbt':
    source => 'puppet:///modules/sbt/sbt.sh',
    mode   => '0775',
  }

}
