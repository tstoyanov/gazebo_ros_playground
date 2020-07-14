rosservice call /hiqp_joint_effort_controller/set_tasks \
"tasks:
- name: 'full_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose', '0.5', '-1.97', '-1.883']  
  dyn_params: ['TDynPD', '1.0', '2.0'] "
