function localdir { basename $(echo $(pwd)); }

alias h="halo"

# service-fixed or service-agnostic commands
function hexec { halo exec $(localdir) -- $@; } # execute a command in the current directory's service
function hbundle { hexec bundle; } # install gems in a service
function hcop { hexec bundle exec rubocop; } # run rubocop in a service
function hcopa { hexec bundle exec rubocop -a; } # run rubocop in a service and auto-correct
function hcopacabana { hcopa && echo "The hottest spot north of Havana"; }
function htest {
  if [ $(localdir) = 'decision-platform-client' ]; then # add your non-ruby tests like this
    hexec yarn test $@
  else # extend more with `elif`
    halo test $(localdir) $@
  fi
}
function hnuke { halo disable -a; } # disable all services
function hsta { halo status; } # show status of all services
function hrc { hexec bin/rails console; } # rails console
function hr { hexec bin/rails $@; } # rails console
function hdiff { hexec cat $1 | diff --strip-trailing-cr $1 -; } # diff a file with its remote counterpart for sanity checking syncing

# service-optional commands
function hlogs { halo logs ${1:-$(localdir)} -f; } # tail logs of a service
function hstart { halo enable ${1:-$(localdir)}; } # enable a service
function hst { hsta | grep "\(${1:-$(localdir)}\)\|\(NAME\)\|\─"; } # show status of a service
alias hstatus=hst
function hkick { halo restart ${1:-$(localdir)}; } # restart a service
alias hrestart=hkick
function hlink { halo link ${1:-$(localdir)}; } # link a service
function hlink2 { halo link ${1:-$(localdir)} --two-way; } # link a service two-way
function hunlink { halo unlink ${1:-$(localdir)}; } # unlink a service
function hdis { halo disable ${1:-$(localdir)}; } # disable a service
alias hdisable=hdis
function hen { halo enable ${1:-$(localdir)}; } # disable a service
alias henable=hen
