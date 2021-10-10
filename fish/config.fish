if status is-interactive
    # Commands to run in interactive sessions can go here
    alias ls='exa'
    alias macchina='macchina --config ~/macchina/macchina.toml'
    alias off='sudo shutdown -p now'
    alias reboot='sudo reboot' 
end
# THEME PURE #
set fish_function_path /home/ragavan/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /home/ragavan/.config/fish/functions/theme-pure/conf.d/pure.fish
