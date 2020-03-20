#! /usr/bin/env python
import rospy
import actionlib
from vortex_msgs.msg import LosPathFollowingAction, LosPathFollowingGoal, LosPathFollowingResult, LosPathFollowingFeedback


def fibonacci_client():
    # Creates the SimpleActionClient, passing the type of the action
    # (FibonacciAction) to the constructor.
    client = actionlib.SimpleActionClient('pid_global_plan_server', LosPathFollowingAction)

    # Waits until the action server has started up and started
    # listening for goals.
    client.wait_for_server()

    # Creates a goal to send to the action server.
    goal = LosPathFollowingGoal()


    goal.next_waypoint.x = 10
    goal.next_waypoint.y = 10
    goal.sphereOfAcceptance = 0.2
    goal.desired_depth.z = -0.5

    # Sends the goal to the action server.
    client.send_goal(goal)

    # Waits for the server to finish performing the action.
    client.wait_for_result()

    # Prints out the result of executing the action
    #return client.get_result()  # A FibonacciResult

if __name__ == '__main__':
    try:
        # Initializes a rospy node so that the SimpleActionClient can
        # publish and subscribe over ROS.
        rospy.init_node('pid_global_plan_client_py')
        fibonacci_client()
    except rospy.ROSInterruptException:
        print("program interrupted before completion")