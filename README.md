# Fish Shell
A Chassis extension to install and configure [Fish Shell](https://fishshell.com/) on your server.

## Usage
1. Add this extension to your extensions directory. `git clone git@github.com:Chassis/Fish.git extensions/fish`
2. Run `vagrant provision`
3. Fish Shell has been installed on your Chassis VM!

## Custom Fish Config
If you have a custom `config.fish` that you're used to using locally and you'd like it to be installed on your Chassis box then copy and commit your `fish.config` into your base content folder.

For default Chassis installs this  will be `content/config.fish` for customised content folders this will be `<your_custom_content_folder>/config.fish`.

That's it!
