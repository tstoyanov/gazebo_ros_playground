rosservice call /hiqp_joint_effort_controller/set_tasks \
"tasks:
- name: 'full_pose'
  priority: 1
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose', '0.0', '-1.17', '0.003']  
  dyn_params: ['TDynPD', '0.5', '1.5'] "
