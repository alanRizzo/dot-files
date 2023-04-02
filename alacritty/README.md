## Installation

To install Alacritty, follow the instructions outlined in the Alacritty [installation guide](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#prerequisites)

## Post-Installation

After installing Alacritty, verify the compiled terminfo entry for a particular terminal type using the following command:

```bash
infocmp alacritty
```

If the above command returns an error, refer to the [post-build instruction](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#post-build)


## Schemas
There are a list of color schemas to personalize your terminal.
To change the color schema, go to the end of ***color_schemas.yml*** and overwrite the schema using the desired one.

```bash
colors: *<desired_schema>
```

Make sure to replace **<desired_schema>** with the name of the schema you want to use.
