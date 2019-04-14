####### Só encontrar links simbólicos quebrados.

# find / -type l -print |perl -nle '-e || print';

####### Só encontrar links simbólicos quebrados, outra maneira.

# find / -type l | ( while read LS ; do test -e "$LS" || ls -ld  "$LS"; done )


# Encontrar e remover links quebrados.

sudo find / -type l | ( while read LS ; do test -e "$LS" || sudo rm -f "$LS" ; done )
