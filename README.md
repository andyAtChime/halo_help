# halo_help

## Philosophy

My fingers are lazy. Are yours too?! You can use my shortcuts. Increase your hack per clack ratio!

## Install

1. Clone this repo
2. In your bash or zsh or whatever jam something like `source <path>/.halo_help/halo.sh || true # import halo help`
3. (Optional) do this too, I love it for debugging `alias zzz="source ~/.zshrc"`
4. Enjoy the sweet freedom of not typing `halo` ever again (or at least not very much)

## Features

The main benefit comes from autofilling based on the directory you're in at the time, and noting that service names in halo coincide with those directories

For example, when you're in `<dev_path_whatever>/bank-account-service`, `hlogs` equates to `halo logs bank-account-service -f`. I've found this pretty helpful. Optionally, you can provide a service name if the service you want to log is not the one corresponding to the directory you're in, i.e. `hlogs router` equates to `halo logs router -f`

Note that this behavior only applies to methods that aren't configured to accept other arguments. I refer to these as `service-optional commands` in `halo.sh`, the full list can be seen there.


For terse descriptions, there are copilot-generated comments in `halo.sh`, where all this is implemented

## Contributing

I'm objectively untrained/just bad at bash scripting so improvements welcome. I intend to version releases for easy checking out.
