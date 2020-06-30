
rosservice call /hiqp_joint_effort_controller/remove_tasks \
"names:
- 'ee_cage_left'
- 'ee_goal'
"
rosservice call /hiqp_joint_effort_controller/remove_all_primitives "{}"


####################### GEOMETRIC PRIMITIVES #######################
rosservice call /hiqp_joint_effort_controller/set_primitives \
"primitives:
- name: 'ee_point'
  type: 'point'
  frame_id: 'three_dof_planar_eef'
  visible: true
  color: [0.0, 0.0, 1.0, 1.0]
  parameters: [0.0, 0.0, 0.0]
- name: left_plane
  type: plane
  frame_id: world
  visible: false
  color: [0.2, 0.5, 0.1, 0.21]
  parameters: [1.0, 0.0, 0.0, 1.8]
- name: 'goal'
  type: 'point'
  frame_id: 'world'
  visible: true
  color: [0.0, 1.0, 0.0, 1.0]
  parameters: [0.7, -0.1, 0.05]
"


####################### TASKS #######################
rosservice call /hiqp_joint_effort_controller/set_tasks \
"tasks:
- name: 'ee_cage_left'
  priority: 0
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomProj', 'point', 'plane', 'ee_point < left_plane']
  dyn_params: ['TDynPD', '1.0', '2.0']
- name: 'goal_project'
  priority: 2
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomProj', 'point', 'point', 'ee_point = goal']
  dyn_params: ['TDynPD', '0.5', '1.5']
- name: 'full_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefFullPose', '0.2', '-1.3', '0.3']
  dyn_params: ['TDynPD', '0.5', '1.5']
"





