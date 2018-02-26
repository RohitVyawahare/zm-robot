# zm-robot
Robot POC for ZCS

# Pre-requisites
- Install Python 2.7+
- Install Robot framework: `pip install robotframework`
- Install paramiko for ssh connection

# Test Execution

Execute the test as `robot -T -d reports --variable HOST:<hostname> tests/test_zcs_license.robot`
