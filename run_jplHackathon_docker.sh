sudo docker run  -p 5900:5900 -p 9000:9000 -p 6080:80 -p 5601:5601 -p 8888:8888 -v /home/yourusername/dockervolumes/awsjpl:/data -v /home/yourusername/GitHub/AWS-JPL-OSR-Challenge:/home/ubuntu/catkin_ws/src -v /home/yourusername/dockervolumes/awsjpl-gazebo:/root/.gazebo --gpus all \ awsjpl