#include "signames.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char* sig_to_name(int sig)
{
    static char signame[7];

    if (sig >= SIGRTMIN && sig <= SIGRTMAX) {
        snprintf(signame, 7, "RT%d", sig - SIGRTMIN);

        return signame;
    }
    else {
        int i;

        for (i = 0; i < sizeof(sigs) / sizeof(sigs[0]); ++i) {
            if (sigs[i].sig == sig) {
                return sigs[i].name;
            }
        }

        return NULL;
    }
}

int name_to_sig(const char* name)
{
    if (strncmp(name, "RT", 2) == 0) {
        int rtsig;

        rtsig = atoi(name + 2);

        return rtsig + SIGRTMIN;
    }
    else {
        int i;

        for (i = 0; i < sizeof(sigs) / sizeof(sigs[0]); ++i) {
            if (strcmp(sigs[i].name, name) == 0) {
                return sigs[i].sig;
            }
        }

        return -1;
    }
}
