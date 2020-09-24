
rosservice call /hiqp_joint_effort_controller/remove_tasks \
"names:
- 'full_pose'
- 'ee_cage_left'
- 'ee_cage_right'
- 'ee_cage_back'
- 'ee_cage_front'
- 'goal_project'
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
- name: 'ee_approach_axis'
  type: 'line'
  frame_id: 'three_dof_planar_eef'
  visible: true
  color: [1.0, 0.0, 0.0, 1.0]
  parameters: [1.0, 0.0, 0.0, 0.0, 0.0, 0.0]
- name: 'link2_point'
  type: 'point'
  frame_id: 'three_dof_planar_link2'
  visible: true
  color: [1.0, 0.0, 0.0, 1.0]
  parameters: [0.0, 0.0, 0.0]
- name: back_plane
  type: plane
  frame_id: world
  visible: false
  color: [0.2, 0.5, 0.2, 0.21]
  parameters: [0.0, 1.0, 0.0, -0.8]
- name: front_plane
  type: plane
  frame_id: world
  visible: false
  color: [0.2, 0.5, 0.2, 0.21]
  parameters: [0.0, 1.0, 0.0, 0.8]
- name: left_plane
  type: plane
  frame_id: world
  visible: false
  color: [0.2, 0.5, 0.2, 0.21]
  parameters: [1.0, 0.0, 0.0, -0.8]
- name: right_plane
  type: plane
  frame_id: world
  visible: false
  color: [0.2, 0.5, 0.2, 0.21]
  parameters: [1.0, 0.0, 0.0, 0.8]
- name: 'goal'
  type: 'point'
  frame_id: 'world'
  visible: true
  color: [0.0, 1.0, 0.0, 1.0]
  parameters: [-0.2, -0.5, 0.05]
"


####################### TASKS #######################
rosservice call /hiqp_joint_effort_controller/set_tasks \
"tasks:
- name: 'ee_cage_front'
  priority: 1
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomProj', 'point', 'plane', 'ee_point < front_plane']
  dyn_params: ['TDynPD', '1.0', '2.0']
- name: 'ee_cage_back'
  priority: 1
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomProj', 'point', 'plane', 'ee_point > back_plane']
  dyn_params: ['TDynPD', '1.0', '2.0']
- name: 'ee_cage_left'
  priority: 1
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomProj', 'point', 'plane', 'ee_point > left_plane']
  dyn_params: ['TDynPD', '1.0', '2.0']
- name: 'ee_cage_right'
  priority: 1
  visible: 1
  active: 1
  monitored: 1
  def_params: ['TDefGeomProj', 'point', 'plane', 'ee_point < right_plane']
  dyn_params: ['TDynPD', '1.0', '2.0']
- name: 'full_pose'
  priority: 3
  visible: 1
  active: 1
  monitored: 0
  def_params: ['TDefFullPose', '-1.6', '-1.3', '-0.25']
  dyn_params: ['TDynPD', '0.5', '1.5']
"





