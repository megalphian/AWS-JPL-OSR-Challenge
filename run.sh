source /opt/ros/melodic/setup.bash
source /home/ubuntu/catkin_ws/devel/setup.bash
source /home/ubuntu/catkin_ws/src/simulation_ws/src/install/local_setup.bash

# Minio
export MINIO_ACCESS_KEY="minio"
export MINIO_SECRET_KEY="miniokey"
mkdir -p /data/beep/boop
/usr/local/bin/minio server /data --address 0.0.0.0:9000 &

# ELK
cp logstash-udp.conf /usr/share/logstash/bin/
sudo -u elasticsearch JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/ /usr/share/elasticsearch/bin/elasticsearch -d
/usr/share/logstash/bin/logstash -f logstash-udp.conf &
/usr/share/kibana/bin/kibana --server.host=0.0.0.0 > kibana.log 2>&1 &

# ROS
roslaunch /home/ubuntu/catkin_ws/src/simulation_ws/src/mars/launch/mars_full_sim.launch