import distutils.spawn
import subprocess
import strings


def execute(command_list, force=True):
    if isinstance(command_list, list) is False:
        print('execute() takes only 2d arrays')
        return

    if strings.isstring_2d_list(command_list) is not True:
        print('execute() takes only 2d "string" arrays')
        return 

    proc = None
    for command in command_list:
        if is_existing_executable(command[0]) is False:
            print('executable {} not found in the system'.format(command[0]))
            return

        if force is False and is_running_executable(command[0]) is True:
            print('command {} already running'.format(command[0]))
            return

        if proc == None:
            proc = subprocess.Popen(command, stdout=subprocess.PIPE)

        else:
            proc = subprocess.Popen(command, stdin=proc.stdout, stdout=subprocess.PIPE)

    return proc


def is_existing_executable(name):
    return distutils.spawn.find_executable(name) != None

def is_running_executable(name):
    proc = execute([
        ['pgrep', name]
    ])

    return len(proc.stdout.readlines()) > 0
