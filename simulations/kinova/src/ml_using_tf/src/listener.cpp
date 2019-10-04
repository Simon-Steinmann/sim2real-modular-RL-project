/*
 * Copyright (C) 2012 Open Source Robotics Foundation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
*/
#include "ros/ros.h"
#include <gazebo/transport/transport.hh>
#include <gazebo/msgs/msgs.hh>
#include <gazebo/gazebo_client.hh>
#include <gazebo_msgs/ContactsState.h>
#include <std_msgs/String.h>

#include <iostream>

#include <ros/ros.h>

class SubscribeAndPublish
{
public:
  SubscribeAndPublish()
  {
    //Topic you want to publish
    pub_ = n_.advertise<gazebo_msgs::ContactsState>("/z_collisions_cpp", 1);

    //Topic you want to subscribe
    sub_ = n_.subscribe('/j2n6s300/collision/j2n6s300_link_1', 1, &SubscribeAndPublish::callback, this);
  }

  void callback(const <gazebo_msgs::ContactsState>& input)
  {
    PUBLISHED_MESSAGE_TYPE output;
    //.... do something with the input and generate the output...
    pub_.publish(output);
  }

private:
  ros::NodeHandle n_; 
  ros::Publisher pub_;
  ros::Subscriber sub_;

};//End of class SubscribeAndPublish

int main(int argc, char **argv)
{
  //Initiate ROS
  ros::init(argc, argv, "subscribe_and_publish");

  //Create an object of class SubscribeAndPublish that will take care of everything
  SubscribeAndPublish SAPObject;

  ros::spin();

  return 0;
}
/*
class SubscribeAndPublish
{
public:
  SubscribeAndPublish()
  {
    //Topic you want to publish
    pub_ = n_.advertise<gazebo_msgs::ContactsState>("/z_contacts", 1);

    //Topic you want to subscribe
    sub_ = node_->Subscribe("~/physics/contacts", callback);
  }

  void callback(ConstContactsPtr &_msg)
  {
    //PUBLISHED_MESSAGE_TYPE output;
    //.... do something with the input and generate the output...
    pub_.publish(_msg);
  }

private:
  ros::NodeHandle n_; 
  gazebo::transport::NodePtr node_;
  //gazebo::transport::NodePtr node_(new gazebo::transport::Node()); 
  //node_->Init("test"); 
  ros::Publisher pub_;
  gazebo::transport::SubscriberPtr sub_;

};//End of class SubscribeAndPublish

int main(int argc, char **argv)
{

  gazebo::transport::NodePtr node(new gazebo::transport::Node());
  node->Init();
  //Initiate ROS
  ros::init(argc, argv, "subscribe_and_publish");

  //Create an object of class SubscribeAndPublish that will take care of everything
  SubscribeAndPublish SAPObject;

  ros::spin();

  return 0;
}




class Publish {
public:
    //Topic you want to publish
    Publish(){} 
    
    void PubContact(const ConstContactsPtr& _msg){
        std_msgs::String msg;
        msg.data = _msg->DebugString();
        pub_.publish(msg);
        std::cout << _msg->DebugString();
    }
    
private:
  ros::NodeHandle n_; 
  ros::Publisher pub_  = n_.advertise<std_msgs::String>("/z_contacts", 1);
  //pub_ = n_.advertise<std_msgs::String>("/z_contacts", 1);

};//End of class SubscribeAndPublish

/////////////////////////////////////////////////
// Function is called everytime a message is received.
void cb(ConstContactsPtr &_msg)
{
  // Dump the message contents to stdout.
  //pub.publish(_msg);
  //Publish PubObject;
  //PubObject.PubContact(_msg);
  std::cout << _msg->DebugString();
}

/////////////////////////////////////////////////
int main(int argc, char **argv)
{
  ros::init(argc, argv, "ztalker");
  // Load gazebo
  gazebo::client::setup(argc, argv);

  // Create our node for communication
  gazebo::transport::NodePtr node(new gazebo::transport::Node());
  node->Init();
  
  
  
  Publish PubObject;
  // Listen to Gazebo world_stats topic
  gazebo::transport::SubscriberPtr sub = node->Subscribe("~/physics/contacts", cb);

  // Busy wait loop...replace with your own code as needed.
  while (true)
    gazebo::common::Time::MSleep(1000);

  // Make sure to shut everything down.
  gazebo::client::shutdown();
}

*/