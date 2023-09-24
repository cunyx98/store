#include <iostream>

#include <unistd.h>
#include <sys/wait.h>

int cFork()
{
    pid_t pid = fork();
    if (pid == 0)
    {
        std::cout << "is children " << getpid() << std::endl;
    }
    else if (pid > 0)
    {
        int status;
        int nOpt = WNOHANG;
        std::cout << "pid " << pid << " " << getpid() << std::endl;

        while (1)
        {
            int ret = waitpid(pid, &status, nOpt);
            if (ret > 0)
            {
                if (WIFEXITED(status))
                {
                    printf("children pid = %d normal, status code %d\n", pid, WEXITSTATUS(status));
                }
                else
                {
                    printf("abnormal exit\n");
                }
                break;
            }
        }
    }

    return 0;
}