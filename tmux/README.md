<div align="center">
  <a href="https://github.com/alanRizzo/dot-files/tree/main/tmux"><img alt="Tmux" src="https://user-images.githubusercontent.com/36242460/209569621-063e61b1-ae2d-4c5f-b1fc-0fbdbcc99cd7.png" height="100"></a>
</div>

## Installation

To install Tmux, follow the instructions outlined in the Tmux [installation guide](https://github.com/tmux/tmux/wiki/Installing)


## Wheater

By default, the Tmux config includes a line that displays weather information using the wttr.in service.
You can customize the weather output by creating a custom format using the one-line output guide on the [wttr.in GitHub page](https://github.com/chubin/wttr.in#one-line-output)

To use this custom format in your Tmux config, update the **WEATHER** variable with the new URL. For instance:

```
WEATHER='#(curl -s wttr.in/?format\="%%C+%%t")'
```

This will display the weather condition and temperature on the right side of your Tmux status bar.
